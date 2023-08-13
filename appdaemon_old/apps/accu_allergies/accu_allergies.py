############################################################
#
# This class aims to get the Allergies information from Accuweather
#
# written to be run from AppDaemon for a HASS or HASSIO install
#
# Written: 30/04/2020
# Updated: 26/06/2020
# added postcode in addition to ID for some locations
############################################################

############################################################
# 
# In the apps.yaml file you will need the following
# updated for your database path, stop ids and name of your flag
#
# accu_allergies:
#   module: accu_allergies
#   class: Get_Accu_Allergies
#   ACC_FILE: "./allergies"
#   ACC_FLAG: "input_boolean.get_allergies_data"
#   DEB_FLAG: "input_boolean.reset_allergies_sensor"
#   URL_ID: "21921"
#   URL_CITY: "canberra"
#   URL_COUNTRY: "au"
#   URL_LANG: "en"
#   URL_POSTCODE: ""
#   WEB_VER: "APRIL22"
#
# PRE APRIL 2022
# https://www.accuweather.com/en/au/canberra/21921/allergies-weather/21921
# https://www.accuweather.com/en/au/canberra/21921/cold-flu-weather/21921
# https://www.accuweather.com/en/au/canberra/21921/asthma-weather/21921
# https://www.accuweather.com/en/au/canberra/21921/arthritis-weather/21921
# https://www.accuweather.com/en/au/canberra/21921/migraine-weather/21921
# https://www.accuweather.com/en/au/canberra/21921/sinus-weather/21921
#
# APRIL 2022
# https://www.accuweather.com/en/au/canberra/21921/health-activities/21921

############################################################

# import the function libraries for beautiful soup
from distutils.log import debug
from bs4 import BeautifulSoup
import json
import datetime
import appdaemon.plugins.hass.hassapi as hass
import requests
import shelve
import urllib.parse

class Get_Accu_Allergies(hass.Hass):

    ACC_FLAG = ""
    DEB_FLAG = ""
    URL_LANG = ""
    URL_COUNTRY = ""
    URL_CITY = ""
    URL_ID = ""
    URL_POSTCODE = ""
    WEB_VER = ""

    payload = {}
    headers = {
        'User-Agent': 'Mozilla/5.0'
    }
        
    #"https://www.accuweather.com/URL_LANG/URL_COUNTRY/URL_CITY/URL_POSTCODE/health-activities/URL_ID"
    #url building
    url_base = "https://www.accuweather.com"
    
    # simple - asthma, arthritis, migraine, sinus
    
    url_txt_setsA = [["/asthma-weather/","asthma"], ["/arthritis-weather/","arthritis"], ["/migraine-weather/","migraine"], [ "/sinus-weather/","sinus"], ["/air-quality-index/", "air"]]
    url_txt_setsB = [["/health-activities/","health"],["/air-quality-index/", "air"]]
    # extended - cold, flu, ragweed pollen, grass pollen, tree pollen, mold, dust
    #["/allergies-weather/","allergies"], ["/cold-flu-weather/","coldflu"]
    url_txt_xtdA = [["/allergies-weather/", "?name=ragweed-pollen" , "ragweed"], ["/allergies-weather/", "?name=grass-pollen" , "grass"], ["/allergies-weather/", "?name=tree-pollen" , "tree"], ["/allergies-weather/", "?name=mold" , "mold"], ["/allergies-weather/", "?name=dust-dander" , "dust"], ["/cold-flu-weather/", "?name=common-cold" , "cold"], ["/cold-flu-weather/", "?name=flu" , "flu"]]
    url_txt_xtdB = []

    icon_txt_set = {'Air Quality': 'air-purifier','Dust & Dander': 'weather-dust','Sinus Pressure': 'head-sync','Asthma': 'head-dots-horizontal',
                    'Migraine': 'head-alert','Arthritis': 'bone','Common Cold': 'head-snowflake','Flu': 'head-flash','Indoor Pests': 'bug',
                    'Outdoor Pests': 'spider','Mosquitos': 'bee','Outdoor Entertaining': 'party-popper','Lawn Mowing': 'mower',
                    'Composting': 'compost','Air Travel': 'airplane','Driving': 'car','Fishing': 'fish','Running': 'run',
                    'Golf': 'golf','Biking & Cycling': 'bike','Beach & Pool': 'beach','Stargazing': 'weather-night','Hiking': 'hiking',
                    'Tree Pollen': 'tree'}

    def cleanString(self, s):
        retstr = ""
        for chars in s:
                retstr += self.removeNonAscii(chars)
        return retstr

    def removeNonAscii(self, s): 
        return ''.join(i for i in s if ord(i)<126 and ord(i)>31)    

    # run to setup the system
    def initialize(self):
        #get the info for the system
        self.ACC_FILE = self.args["ACC_FILE"]
        self.ACC_FLAG = self.args["ACC_FLAG"]
        self.DEB_FLAG = self.args["DEB_FLAG"]
        self.URL_LANG = self.args["URL_LANG"]
        self.URL_COUNTRY = self.args["URL_COUNTRY"]
        self.URL_CITY = self.args["URL_CITY"]
        self.URL_ID = self.args["URL_ID"]
        
        try:
            self.WEB_VER = self.args["WEB_VER"]
        except:
            self.WEB_VER = ""

        #see if they have included a postcode value, if not, just use the ID value
        try:
            self.URL_POSTCODE = self.args["URL_POSTCODE"]
        except:
            self.URL_POSTCODE = self.URL_ID
        #check that the postcode is blank, and if so set it to the ID value
        if self.URL_POSTCODE == "":
            self.URL_POSTCODE = self.URL_ID

        #this supports the two website variations
        if self.WEB_VER == "APRIL22":
            self.url_txt_sets = self.url_txt_setsB
            self.url_txt_xtd = self.url_txt_xtdB
        else:
            self.url_txt_sets = self.url_txt_setsA
            self.url_txt_xtd = self.url_txt_xtdA

        #create the original sensors
        self.load_sensors()

        #set the listener for the update flag for getting the data
        self.listen_state(self.get_all_data, self.ACC_FLAG, new="on")
        #set the listener for update flag for updating the sensor from the files
        self.listen_state(self.set_acc_sensors, self.DEB_FLAG, new="on")

        # set to run each morning at 5.07am
        runtime = datetime.time(5,7,0)
        self.run_daily(self.daily_load_sensors, runtime)
        

    #get the information from each of the pages and write them into text files for reuse
    def get_all_data(self, entity, attribute, old, new, kwargs):
        #call the data builder
        self.get_html_data()
        #turn off the flag
        self.turn_off(self.ACC_FLAG)
    
    #request the website information
    def get_html_data(self):
        #build the url for the correct country and area
        start_url = self.url_base + "/" + self.URL_LANG + "/" + urllib.parse.quote(self.URL_COUNTRY) + "/" + urllib.parse.quote(self.URL_CITY) + "/" + self.URL_POSTCODE
        
        #for each of the basic pages (asthma, arthritis, migraine and sinus)
        for sets in self.url_txt_sets:
            #build the url for this allergy type
            data_url = start_url + sets[0] + self.URL_ID
            #call the function to get the information and put it in the text file
            self.get_data(data_url, sets[1])

        #for each of the multi-tier pages (allergies and cold/flu)
        for sets in self.url_txt_xtd:
            #build the url for this allergy type
            data_url = start_url + sets[0] + self.URL_ID + sets[1]
            #call the function to get the information and put it in the text file
            self.get_data(data_url, sets[2])
        
    #request the website information and write it to a file
    def get_data(self, url, txt):
        # request the rendered html
        self.log("request " + url)
        data_from_website = self.get_html(url) 
        # write the html into the local shelve file
        with shelve.open(self.ACC_FILE) as allergies_db:
            allergies_db[txt] = data_from_website
        #write out the get sensor
        self.set_get_sensor()
        #update the sensor
        self.create_get_sensor()

    def set_get_sensor(self):
        #create a sensor to keep track last time this was run
        tim = datetime.datetime.now()
        date_time = tim.strftime("%d/%m/%Y, %H:%M:%S")
        #add date time to the save file
        with shelve.open(self.ACC_FILE) as allergies_db:
            allergies_db["updated"] = date_time

    def create_get_sensor(self):
        #get last update date time from the save file 
        with shelve.open(self.ACC_FILE) as allergies_db:
            date_time = allergies_db["updated"]
        #create the sensor
        self.set_state("sensor.acc_data_last_sourced", state=date_time, replace=True, attributes={"icon": "mdi:timeline-clock-outline", "friendly_name": "ACC Allergy Data last sourced"})

    #get the html from the website
    def get_html(self, url):
        #create request for getting information from the accuweather website
        response = requests.request("GET", url, headers=self.headers, data = self.payload)
        #scrape and return the rendered html
        return response.text.encode('utf8')

    # call the processes to create the sensors
    def set_acc_sensors(self, entity, attribute, old, new, kwargs):
        #load all the sensors
        self.load_sensors()
        #turn off the flag
        self.turn_off(self.DEB_FLAG)

    # this loads the first time run and on a restart of appdaemon
    def load_sensors(self):    
        #if no current data files
        collect_flag = 0
        with shelve.open(self.ACC_FILE) as allergies_db:
            #self.log(allergies_db[self.url_txt_sets[0][1]])
            if "updated" not in allergies_db:
                collect_flag = 1
                
        if collect_flag == 1:
            self.get_html_data()
            self.log("get")

        #create the sensors
        
        if self.WEB_VER == "APRIL22":
            self.get_vals(self.url_txt_sets[0][1])
            self.get_allergies_air_info(self.url_txt_sets[1][1])
        else:
            #pollens etc
            self.get_allergies_rag_info(self.url_txt_xtd[0][2])
            self.get_allergies_grass_info(self.url_txt_xtd[1][2])
            self.get_allergies_tree_info(self.url_txt_xtd[2][2])
            self.get_allergies_mold_info(self.url_txt_xtd[3][2])
            self.get_allergies_dust_info(self.url_txt_xtd[4][2])
            #cold and flu
            self.get_coldflu_cold_info(self.url_txt_xtd[5][2])        
            self.get_coldflu_flu_info(self.url_txt_xtd[6][2])
            #air quality
            self.get_allergies_air_info(self.url_txt_sets[4][1])
            #asthma
            self.get_asthma_info(self.url_txt_sets[0][1])
            #arthritis
            self.get_arthritis_info(self.url_txt_sets[1][1])
            #migraine
            self.get_migraine_info(self.url_txt_sets[2][1])
            #sinus
            self.get_sinus_info(self.url_txt_sets[3][1])

        #update the last updated sensor
        self.create_get_sensor()

    # this runs each morning
    def daily_load_sensors(self, kwargs):    
        #get data
        self.get_html_data()

        #load sensors
        self.load_sensors()

    def get_vals(self, txt):

        #open the file and read the allergies information
        with shelve.open(self.ACC_FILE) as allergies_db:
            html_info = allergies_db[txt]

        #parse the file for the hmtl
        soup = BeautifulSoup(html_info, "html.parser")
        
        myvals = soup.find_all("div", "index-name")
        mytext = soup.find_all("div", "index-status-text")


        for val, txt in zip(myvals, mytext):
            #create the hassio sensors for today and tomorrow for ragweed        
                senid = "sensor.acc_" + val.text.strip().lower().replace(" ","_").replace("&","and")  + "_today"
                self.log(senid)
                if val.text in self.icon_txt_set:
                    ticon = 'mdi:' + self.icon_txt_set[val.text]
                else: 
                    ticon = 'mdi:air-purifier'
                #self.set_state(senid, state=txt.text, replace=True, attributes={"icon": "mdi:air-purifier", "friendly_name": val.text + " Today"})
                self.set_state(senid, state=txt.text, replace=True, attributes={"icon": ticon, "friendly_name": val.text + " Today"})


    #get the info for pollens - ragweed, grass, tree, mold, dust and air quality
    def get_allergies_air_info(self, txt):

        #open the file and read the allergies information
        with shelve.open(self.ACC_FILE) as allergies_db:
            html_info = allergies_db[txt]
        #parse the file for the hmtl

        soup = BeautifulSoup(html_info, "html.parser")
        
        myvals = soup.find_all("div", "aq-number")
        mytext = soup.find_all("p", "category-text")
        mystate = soup.find_all("p", "statement")
        

        #create the hassio sensors for today and tomorrow for ragweed        
        if(len(myvals) > 1):
            self.set_state("sensor.acc_air_today", state=myvals[0].text, replace=True, attributes={"icon": "mdi:air-purifier", "friendly_name": "Air Quality Today", "today_air_value": myvals[0].text + " - " + mytext[0].text , "today_air_phrase": mystate[0].text })
            self.set_state("sensor.acc_air_tomorrow", state=myvals[2].text, replace=True, attributes={"icon": "mdi:air-purifier", "friendly_name": "Air Quality Tomorrow", "tomorrow_air_value": myvals[2].text + " - " + mytext[2].text , "tomorrow_air_phrase": mystate[2].text })
        else:
            self.set_state("sensor.acc_air_today", state='Unknown', replace=True, attributes={"icon": "mdi:air-purifier", "friendly_name": "Air Quality Today", "today_air_value": 'Unknown' , "today_air_phrase": 'Unknown' })
            self.set_state("sensor.acc_air_tomorrow", state='Unknown', replace=True, attributes={"icon": "mdi:air-purifier", "friendly_name": "Air Quality Tomorrow", "tomorrow_air_value": 'Unknown' , "tomorrow_air_phrase": 'Unknown' })

        
    #get the info for pollens - ragweed, grass, tree, mold, dust and air quality
    def get_allergies_rag_info(self, txt):

        #open the file and read the allergies information
        with shelve.open(self.ACC_FILE) as allergies_db:
            html_info = allergies_db[txt]
        #parse the file for the hmtl
        soup = BeautifulSoup(html_info, "html.parser")
        
        myvals = soup.find_all("div", "gauge")
        myconds = soup.find_all("div", "cond")

        #create the hassio sensors for today and tomorrow for ragweed        
        if(len(myvals) > 1):
            myvalseta = self.cleanString(myvals[0].text.split('>'))
            myvalsetb = self.cleanString(myvals[1].text.split('>'))
            self.set_state("sensor.acc_ragweed_pollen_today", state=myvalseta, replace=True, attributes={"icon": "mdi:clover", "friendly_name": "Ragweed Pollen Today", "today_ragweed_value": myvals[0].text , "today_ragweed_phrase": myconds[0].text })
            self.set_state("sensor.acc_ragweed_pollen_tomorrow", state=myvalsetb, replace=True, attributes={"icon": "mdi:clover", "friendly_name": "Ragweed Pollen Tomorrow", "tomorrow_ragweed_value": myvals[1].text , "tomorrow_ragweed_phrase": myconds[1].text })
        else:
            self.set_state("sensor.acc_ragweed_pollen_today", state='Unknown', replace=True, attributes={"icon": "mdi:clover", "friendly_name": "Ragweed Pollen Today", "today_ragweed_value": 'Unknown' , "today_ragweed_phrase": 'Unknown' })
            self.set_state("sensor.acc_ragweed_pollen_tomorrow", state='Unknown', replace=True, attributes={"icon": "mdi:clover", "friendly_name": "Ragweed Pollen Tomorrow", "tomorrow_ragweed_value": 'Unknown' , "tomorrow_ragweed_phrase": 'Unknown' })


    #get the info for pollens - ragweed, grass, tree, mold, dust and air quality
    def get_allergies_grass_info(self, txt):

        #open the file and read the allergies information
        with shelve.open(self.ACC_FILE) as allergies_db:
            html_info = allergies_db[txt]
        #parse the file for the hmtl
        soup = BeautifulSoup(html_info, "html.parser")
        
        myvals = soup.find_all("div", "gauge")
        myconds = soup.find_all("div", "cond")

        #create the hassio sensors for today and tomorrow for ragweed        
        if(len(myvals) > 1):
            myvalseta = self.cleanString(myvals[0].text.split('>'))
            myvalsetb = self.cleanString(myvals[1].text.split('>'))
            self.set_state("sensor.acc_grass_pollen_today", state=myvalseta, replace=True, attributes={"icon": "mdi:barley", "friendly_name": "Grass Pollen Today", "today_grass_value": myvals[0].text , "today_grass_phrase": myconds[0].text })
            self.set_state("sensor.acc_grass_pollen_tomorrow", state=myvalsetb, replace=True, attributes={"icon": "mdi:barley", "friendly_name": "Grass Pollen Tomorrow", "tomorrow_grass_value": myvals[1].text , "tomorrow_grass_phrase": myconds[1].text })
        else:
            self.set_state("sensor.acc_grass_pollen_today", state='Unknown', replace=True, attributes={"icon": "mdi:barley", "friendly_name": "Grass Pollen Today", "today_grass_value": 'Unknown' , "today_grass_phrase": 'Unknown' })
            self.set_state("sensor.acc_grass_pollen_tomorrow", state='Unknown', replace=True, attributes={"icon": "mdi:barley", "friendly_name": "Grass Pollen Tomorrow", "tomorrow_grass_value": 'Unknown' , "tomorrow_grass_phrase": 'Unknown' })

        
    #get the info for pollens - ragweed, grass, tree, mold, dust and air quality
    def get_allergies_tree_info(self, txt):

        #open the file and read the allergies information
        with shelve.open(self.ACC_FILE) as allergies_db:
            html_info = allergies_db[txt]
        #parse the file for the hmtl
        soup = BeautifulSoup(html_info, "html.parser")
        
        myvals = soup.find_all("div", "gauge")
        myconds = soup.find_all("div", "cond")

        #create the hassio sensors for today and tomorrow for ragweed        
        if(len(myvals) > 1):
            myvalseta = self.cleanString(myvals[0].text.split('>'))
            myvalsetb = self.cleanString(myvals[1].text.split('>'))
            self.set_state("sensor.acc_tree_pollen_today", state=myvalseta, replace=True, attributes={"icon": "mdi:tree-outline", "friendly_name": "Tree Pollen Today", "today_tree_value": myvals[0].text , "today_tree_phrase": myconds[0].text })
            self.set_state("sensor.acc_tree_pollen_tomorrow", state=myvalsetb, replace=True, attributes={"icon": "mdi:tree-outline", "friendly_name": "Tree Pollen Tomorrow", "tomorrow_tree_value": myvals[1].text , "tomorrow_tree_phrase": myconds[1].text })
        else:
            self.set_state("sensor.acc_tree_pollen_today", state='Unknown', replace=True, attributes={"icon": "mdi:tree-outline", "friendly_name": "Tree Pollen Today", "today_tree_value": 'Unknown' , "today_tree_phrase": 'Unknown' })
            self.set_state("sensor.acc_tree_pollen_tomorrow", state='Unknown', replace=True, attributes={"icon": "mdi:tree-outline", "friendly_name": "Tree Pollen Tomorrow", "tomorrow_tree_value": 'Unknown' , "tomorrow_tree_phrase": 'Unknown' })


    #get the info for pollens - ragweed, grass, tree, mold, dust and air quality
    def get_allergies_mold_info(self, txt):

        #open the file and read the allergies information
        with shelve.open(self.ACC_FILE) as allergies_db:
            html_info = allergies_db[txt]
        #parse the file for the hmtl
        soup = BeautifulSoup(html_info, "html.parser")
        
        myvals = soup.find_all("div", "gauge")
        myconds = soup.find_all("div", "cond")

        #create the hassio sensors for today and tomorrow for ragweed        
        if(len(myvals) > 1):
            myvalseta = self.cleanString(myvals[0].text.split('>'))
            myvalsetb = self.cleanString(myvals[1].text.split('>'))
            self.set_state("sensor.acc_mold_today", state=myvalseta, replace=True, attributes={"icon": "mdi:bacteria-outline", "friendly_name": "Mold Today", "today_mold_value": myvals[0].text , "today_mold_phrase": myconds[0].text })
            self.set_state("sensor.acc_mold_tomorrow", state=myvalsetb, replace=True, attributes={"icon": "mdi:bacteria-outline", "friendly_name": "Mold Tomorrow", "tomorrow_mold_value": myvals[1].text , "tomorrow_mold_phrase": myconds[1].text })
        else:
            self.set_state("sensor.acc_mold_today", state='Unknown', replace=True, attributes={"icon": "mdi:bacteria-outline", "friendly_name": "Mold Today", "today_mold_value": 'Unknown' , "today_mold_phrase": 'Unknown' })
            self.set_state("sensor.acc_mold_tomorrow", state='Unknown', replace=True, attributes={"icon": "mdi:bacteria-outline", "friendly_name": "Mold Tomorrow", "tomorrow_mold_value": 'Unknown' , "tomorrow_mold_phrase": 'Unknown' })
    

    #get the info for pollens - ragweed, grass, tree, mold, dust and air quality
    def get_allergies_dust_info(self, txt):

        #open the file and read the allergies information
        with shelve.open(self.ACC_FILE) as allergies_db:
            html_info = allergies_db[txt]
        #parse the file for the hmtl
        soup = BeautifulSoup(html_info, "html.parser")
        
        myvals = soup.find_all("div", "gauge")
        myconds = soup.find_all("div", "cond")

        #create the hassio sensors for today and tomorrow for ragweed        
        if(len(myvals) > 1):
            myvalseta = self.cleanString(myvals[0].text.split('>'))
            myvalsetb = self.cleanString(myvals[1].text.split('>'))
            self.set_state("sensor.acc_dust_today", state=myvalseta, replace=True, attributes={"icon": "mdi:cloud-search-outline", "friendly_name": "Dust Today", "today_dust_value": myvals[0].text , "today_dust_phrase": myconds[0].text })
            self.set_state("sensor.acc_dust_tomorrow", state=myvalsetb, replace=True, attributes={"icon": "mdi:cloud-search-outline", "friendly_name": "Dust Tomorrow", "tomorrow_dust_value": myvals[1].text , "tomorrow_dust_phrase": myconds[1].text })
        else:
            self.set_state("sensor.acc_dust_today", state='Unknown', replace=True, attributes={"icon": "mdi:cloud-search-outline", "friendly_name": "Dust Today", "today_dust_value": 'Unknown' , "today_dust_phrase": 'Unknown' })
            self.set_state("sensor.acc_dust_tomorrow", state='Unknown', replace=True, attributes={"icon": "mdi:cloud-search-outline", "friendly_name": "Dust Tomorrow", "tomorrow_dust_value": 'Unknown' , "tomorrow_dust_phrase": 'Unknown' })
    
    #get the info for cold and flu
    def get_coldflu_cold_info(self, txt):

        #open the file and read the allergies information
        with shelve.open(self.ACC_FILE) as allergies_db:
            html_info = allergies_db[txt]
        #parse the file for the hmtl
        soup = BeautifulSoup(html_info, "html.parser")

        myvals = soup.find_all("div", "gauge")
        myconds = soup.find_all("div", "cond")

        #create the hassio sensors for today and tomorrow for cold        
        if(len(myvals) > 1):
            myvalseta = self.cleanString(myvals[0].text.split('>'))
            myvalsetb = self.cleanString(myvals[1].text.split('>'))
            self.set_state("sensor.acc_common_cold_today", state=myvalseta, replace=True, attributes={"icon": "mdi:snowflake-alert", "friendly_name": "Common Cold Today", "today_common_value": myvals[0].text , "today_common_phrase": myconds[0].text })
            self.set_state("sensor.acc_common_cold_tomorrow", state=myvalsetb, replace=True, attributes={"icon": "mdi:snowflake-alert", "friendly_name": "Common Cold Tomorrow", "tomorrow_common_value": myvals[1].text , "tomorrow_common_phrase": myconds[1].text })
        else:
            self.set_state("sensor.acc_common_cold_today", state='Unknown', replace=True, attributes={"icon": "mdi:snowflake-alert", "friendly_name": "Common Cold Today", "today_common_value": 'Unknown' , "today_common_phrase": 'Unknown' })
            self.set_state("sensor.acc_common_cold_tomorrow", state='Unknown', replace=True, attributes={"icon": "mdi:snowflake-alert", "friendly_name": "Common Cold Tomorrow", "tomorrow_common_value": 'Unknown' , "tomorrow_common_phrase": 'Unknown' })
    

    def get_coldflu_flu_info(self, txt):

        #open the file and read the allergies information
        with shelve.open(self.ACC_FILE) as allergies_db:
            html_info = allergies_db[txt]
        #parse the file for the hmtl
        soup = BeautifulSoup(html_info, "html.parser")

        myvals = soup.find_all("div", "gauge")
        myconds = soup.find_all("div", "cond")

        #create the hassio sensors for today and tomorrow for cold        
        if(len(myvals) > 1):
            myvalseta = self.cleanString(myvals[0].text.split('>'))
            myvalsetb = self.cleanString(myvals[1].text.split('>'))
            self.set_state("sensor.acc_flu_today", state=myvalseta, replace=True, attributes={"icon": "mdi:bacteria", "friendly_name": "Flu Today", "today_flu_value": myvals[0].text , "today_flu_phrase": myconds[0].text })
            self.set_state("sensor.acc_flu_tomorrow", state=myvalsetb, replace=True, attributes={"icon": "mdi:bacteria", "friendly_name": "Flu Tomorrow", "tomorrow_flu_value": myvals[1].text , "tomorrow_flu_phrase": myconds[1].text })
        else:
            self.set_state("sensor.acc_flu_today", state='Unknown', replace=True, attributes={"icon": "mdi:bacteria", "friendly_name": "Flu Today", "today_flu_value": 'Unknown' , "today_flu_phrase": 'Unknown' })
            self.set_state("sensor.acc_flu_tomorrow", state='Unknown', replace=True, attributes={"icon": "mdi:bacteria", "friendly_name": "Flu Tomorrow", "tomorrow_flu_value": 'Unknown' , "tomorrow_flu_phrase": 'Unknown' })
        
        
    #get the info for asthma
    def get_asthma_info(self, txt):

        #open the file and read the allergies information
        with shelve.open(self.ACC_FILE) as allergies_db:
            html_info = allergies_db[txt]
        #parse the file for the hmtl
        soup = BeautifulSoup(html_info, "html.parser")

        myvals = soup.find_all("div", "gauge")
        myconds = soup.find_all("div", "cond")
        
        #create the hassio sensors for today and tomorrow for asthma
        if(len(myvals) > 1):
            myvalseta = self.cleanString(myvals[0].text.split('>'))
            myvalsetb = self.cleanString(myvals[1].text.split('>'))
            self.set_state("sensor.acc_asthma_today", state=myvalseta, replace=True, attributes={"icon": "mdi:lungs", "friendly_name": "Asthma Today", "today_asthma_value": myvals[0].text , "today_asthma_phrase": myconds[0].text })
            self.set_state("sensor.acc_asthma_tomorrow", state=myvalsetb, replace=True, attributes={"icon": "mdi:lungs", "friendly_name": "Asthma Tomorrow", "tomorrow_asthma_value": myvals[1].text , "tomorrow_asthma_phrase": myconds[1].text })
        else:
            self.set_state("sensor.acc_asthma_today", state='Unknown', replace=True, attributes={"icon": "mdi:lungs", "friendly_name": "Asthma Today", "today_asthma_value": 'Unknown' , "today_asthma_phrase": 'Unknown' })
            self.set_state("sensor.acc_asthma_tomorrow", state='Unknown', replace=True, attributes={"icon": "mdi:lungs", "friendly_name": "Asthma Tomorrow", "tomorrow_asthma_value": 'Unknown' , "tomorrow_asthma_phrase": 'Unknown' })
        

    #get the info for arthritis
    def get_arthritis_info(self, txt):

        #open the file and read the allergies information
        with shelve.open(self.ACC_FILE) as allergies_db:
            html_info = allergies_db[txt]
        #parse the file for the hmtl
        soup = BeautifulSoup(html_info, "html.parser")

        myvals = soup.find_all("div", "gauge")
        myconds = soup.find_all("div", "cond")
        
        #create the hassio sensors for today and tomorrow for arthritis
        if(len(myvals) > 1):
            myvalseta = self.cleanString(myvals[0].text.split('>'))
            myvalsetb = self.cleanString(myvals[1].text.split('>'))
            self.set_state("sensor.acc_arthritis_today", state=myvalseta, replace=True, attributes={"icon": "mdi:bone", "friendly_name": "Arthritis Today", "today_arthritis_value": myvals[0].text , "today_arthritis_phrase": myconds[0].text })
            self.set_state("sensor.acc_arthritis_tomorrow", state=myvalsetb, replace=True, attributes={"icon": "mdi:bone", "friendly_name": "Arthritis Tomorrow", "tomorrow_arthritis_value": myvals[1].text , "tomorrow_arthritis_phrase": myconds[1].text })
        else:
            self.set_state("sensor.acc_arthritis_today", state='Unknown', replace=True, attributes={"icon": "mdi:bone", "friendly_name": "Arthritis Today", "today_arthritis_value": 'Unknown' , "today_arthritis_phrase": 'Unknown' })
            self.set_state("sensor.acc_arthritis_tomorrow", state='Unknown', replace=True, attributes={"icon": "mdi:bone", "friendly_name": "Arthritis Tomorrow", "tomorrow_arthritis_value": 'Unknown' , "tomorrow_arthritis_phrase": 'Unknown' })

    #get the info for migraine
    def get_migraine_info(self, txt):

        #open the file and read the allergies information
        with shelve.open(self.ACC_FILE) as allergies_db:
            html_info = allergies_db[txt]
        #parse the file for the hmtl
        soup = BeautifulSoup(html_info, "html.parser")

        myvals = soup.find_all("div", "gauge")
        myconds = soup.find_all("div", "cond")
        
        #create the hassio sensors for today and tomorrow for migraine
        if(len(myvals) > 1):
            myvalseta = self.cleanString(myvals[0].text.split('>'))
            myvalsetb = self.cleanString(myvals[1].text.split('>'))
            self.set_state("sensor.acc_migraine_today", state=myvalseta, replace=True, attributes={"icon": "mdi:head-flash", "friendly_name": "Migraine Today", "today_migraine_value": myvals[0].text , "today_migraine_phrase": myconds[0].text })
            self.set_state("sensor.acc_migraine_tomorrow", state=myvalsetb, replace=True, attributes={"icon": "mdi:head-flash", "friendly_name": "Migraine Tomorrow", "tomorrow_migraine_value": myvals[1].text , "tomorrow_migraine_phrase": myconds[1].text })
        else:
            self.set_state("sensor.acc_migraine_today", state='Unknown', replace=True, attributes={"icon": "mdi:head-flash", "friendly_name": "Migraine Today", "today_migraine_value": 'Unknown' , "today_migraine_phrase": 'Unknown' })
            self.set_state("sensor.acc_migraine_tomorrow", state='Unknown', replace=True, attributes={"icon": "mdi:head-flash", "friendly_name": "Migraine Tomorrow", "tomorrow_migraine_value": 'Unknown' , "tomorrow_migraine_phrase": 'Unknown' })
        
    
    #get the info for sinus
    def get_sinus_info(self, txt):

        #open the file and read the allergies information
        with shelve.open(self.ACC_FILE) as allergies_db:
            html_info = allergies_db[txt]
        #parse the file for the hmtl
        soup = BeautifulSoup(html_info, "html.parser")

        myvals = soup.find_all("div", "gauge")
        myconds = soup.find_all("div", "cond")
        
        #create the hassio sensors for today and tomorrow for sinus
        if(len(myvals) > 1):
            myvalseta = self.cleanString(myvals[0].text.split('>'))
            myvalsetb = self.cleanString(myvals[1].text.split('>'))
            self.set_state("sensor.acc_sinus_today", state=myvalseta, replace=True, attributes={"icon": "mdi:head-remove-outline", "friendly_name": "Sinus Today", "today_sinus_value": myvals[0].text , "today_sinus_phrase": myconds[0].text })
            self.set_state("sensor.acc_sinus_tomorrow", state=myvalsetb, replace=True, attributes={"icon": "mdi:head-remove-outline", "friendly_name": "Sinus Tomorrow", "tomorrow_sinus_value": myvals[1].text , "tomorrow_sinus_phrase": myconds[1].text })
        else:
            self.set_state("sensor.acc_sinus_today", state='Unknown', replace=True, attributes={"icon": "mdi:head-remove-outline", "friendly_name": "Sinus Today", "today_sinus_value": 'Unknown' , "today_sinus_phrase": 'Unknown' })
            self.set_state("sensor.acc_sinus_tomorrow", state='Unknown', replace=True, attributes={"icon": "mdi:head-remove-outline", "friendly_name": "Sinus Tomorrow", "tomorrow_sinus_value": 'Unknown' , "tomorrow_sinus_phrase": 'Unknown' })

     