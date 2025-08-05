const VERSION="1.4.12",CARD={meta:{card:{typeName:"entity-progress-card",name:"Entity Progress Card",description:"A cool custom card to show current entity status with a progress bar.",editor:"entity-progress-card-editor"},template:{typeName:"entity-progress-card-template",name:"Entity Progress Card (Template)",description:"A cool custom card to show current entity status with a progress bar."},badge:{typeName:"entity-progress-badge",editor:"entity-progress-badge-editor"}},config:{dev:!1,debug:{card:!1,editor:!1,interactionHandler:!1,ressourceManager:!1,hass:!1},language:"en",value:{min:0,max:100},unit:{default:"%",fahrenheit:"\xB0F",timer:"timer",flexTimer:"flextimer",second:"s",disable:"",space:" ",unitSpacing:{auto:"auto",space:"space",noSpace:"no-space"}},showMoreInfo:!0,reverse:!1,decimal:{percentage:0,timer:0,counter:0,duration:0,other:2},entity:{state:{unavailable:"unavailable",unknown:"unknown",notFound:"notFound",idle:"idle",active:"active",paused:"paused"},type:{timer:"timer",light:"light",cover:"cover",fan:"fan",climate:"climate",counter:"counter",number:"number"},class:{shutter:"shutter",battery:"battery"}},msFactor:1e3,shadowMode:"open",refresh:{ratio:500,min:250,max:1e3},stub:{template:{icon:"mdi:washing-machine",name:"Entity Progress Card",secondary:"Template",badge_icon:"mdi:update",badge_color:"green",percent:"{{ 50 }}",force_circular_background:!0}},languageMap:{af:"af-ZA",ar:"ar",bg:"bg-BG",bn:"bn",ca:"ca-ES",cs:"cs-CZ",da:"da-DK",de:"de-DE","de-CH":"de-CH",el:"el-GR",en:"en-US",es:"es-ES",et:"et-EE",eu:"eu-ES",fa:"fa-IR",fi:"fi-FI",fr:"fr-FR",gl:"gl-ES",gu:"gu-IN",he:"he-IL",hi:"hi-IN",hr:"hr-HR",hu:"hu-HU",id:"id-ID",is:"is-IS",it:"it-IT",ja:"ja-JP",ka:"ka-GE",kn:"kn-IN",ko:"ko-KR",kw:"kw-GB",lb:"lb-LU",lt:"lt-LT",lv:"lv-LV",ml:"ml-IN",mn:"mn-MN",mr:"mr-IN",ms:"ms-MY",nb:"nb-NO",ne:"ne-NP",nl:"nl-NL",pl:"pl-PL",pt:"pt-PT","pt-br":"pt-BR",ro:"ro-RO",ru:"ru-RU",sk:"sk-SK",sl:"sl-SI",sr:"sr-RS","sr-Latn":"sr-Latn-RS",sv:"sv-SE",sw:"sw-KE",te:"te-IN",th:"th-TH",tr:"tr-TR",uk:"uk-UA",ur:"ur-PK",vi:"vi-VN","zh-cn":"zh-CN","zh-hk":"zh-HK","zh-tw":"zh-TW","zh-Hant":"zh-TW"},separator:" \xB7 "},htmlStructure:{card:{element:"ha-card"},sections:{container:{element:"div",class:"container"},belowContainer:{element:"div",class:"below-container"},left:{element:"div",class:"left"},right:{element:"div",class:"right"}},elements:{icon:{element:"div",class:"icon"},shape:{element:"shape",class:"shape"},nameGroup:{element:"div",class:"name-group"},nameCombined:{element:"span",class:"name-combined"},name:{element:"span",class:"name"},nameCustomInfo:{element:"span",class:"name-custom-info"},secondaryInfo:{element:"div",class:"secondary-info"},detailGroup:{element:"div",class:"secondary-info-detail-group"},detailCombined:{element:"span",class:"secondary-info-detail-combined"},stateAndProgressInfo:{element:"span",class:"state-and-progress-info"},customInfo:{element:"span",class:"secondary-info-custom-info"},progressBar:{container:{element:"div",class:"progress-bar-container"},bar:{element:"div",class:"progress-bar"},inner:{element:"div",class:"progress-bar-inner"},positiveInner:{element:"div",class:"progress-bar-positive-inner"},negativeInner:{element:"div",class:"progress-bar-negative-inner"},zeroMark:{element:"div",class:"progress-bar-low-zero"},lowWatermark:{element:"div",class:"progress-bar-low-wm"},highWatermark:{element:"div",class:"progress-bar-high-wm"},watermark:{class:"progress-bar-wm"}},badge:{container:{element:"div",class:"badge"},icon:{element:"ha-icon",class:"badge-icon"}}}},style:{element:"style",color:{default:"var(--state-icon-color)",disabled:"var(--dark-grey-color)",unavailable:"var(--state-unavailable-color)",notFound:"var(--state-inactive-color)",active:"var(--state-active-color)",coverActive:"var(--state-cover-active-color)",lightActive:"#FF890E",fanActive:"var(--state-fan-active-color)",battery:{low:"var(--state-sensor-battery-low-color)",medium:"var(--state-sensor-battery-medium-color)",high:"var(--state-sensor-battery-high-color)"},climate:{dry:"var(--state-climate-dry-color)",cool:"var(--state-climate-cool-color)",heat:"var(--state-climate-heat-color)",fanOnly:"var(--state-climate-fan_only-color)"},inactive:"var(--state-inactive-color)"},icon:{default:{icon:"mdi:alert"},alert:{icon:"mdi:alert-circle-outline",color:"#0080ff",attribute:"icon"},notFound:{icon:"mdi:help"},badge:{default:{attribute:"icon"},unavailable:{icon:"mdi:exclamation-thick",color:"white",backgroundColor:"var(--orange-color)",attribute:"icon"},notFound:{icon:"mdi:exclamation-thick",color:"white",backgroundColor:"var(--red-color)",attribute:"icon"},timer:{active:{icon:"mdi:play",color:"white",backgroundColor:"var(--success-color)",attribute:"icon"},paused:{icon:"mdi:pause",color:"white",backgroundColor:"var(--state-icon-color)",attribute:"icon"}}}},bar:{sizeOptions:{small:{label:"small",mdi:"mdi:size-s"},medium:{label:"medium",mdi:"mdi:size-m"},large:{label:"large",mdi:"mdi:size-l"},xlarge:{label:"xlarge",mdi:"mdi:size-xl"}}},dynamic:{card:{minWidth:{var:"--epb-card-min-width"},height:{var:"--epb-card-height"}},badge:{color:{var:"--epb-badge-color",default:"var(--orange-color)"},backgroundColor:{var:"--epb-badge-bgcolor",default:"white"}},iconAndShape:{color:{var:"--epb-icon-and-shape-color",default:"var(--state-icon-color)"},icon:{size:{var:"--epb-icon-size"}},shape:{size:{var:"--epb-shape-size"}}},progressBar:{color:{var:"--epb-progress-bar-color",default:"var(--state-icon-color)"},size:{var:"--epb-progress-bar-size",default:"0%"},pSize:{var:"--epb-progress-bar-psize",default:"0%"},nSize:{var:"--epb-progress-bar-nsize",default:"0%"},background:{var:"--epb-progress-bar-background-color"},orientation:{rtl:"rtl-orientation",ltr:"ltr-orientation"},effect:{radius:{label:"radius",class:"progress-bar-effect-radius"},glass:{label:"glass",class:"progress-bar-effect-glass"},gradient:{label:"gradient",class:"progress-bar-effect-gradient"},shimmer:{label:"shimmer",class:"progress-bar-effect-shimmer"}}},watermark:{low:{value:{var:"--epb-low-watermark-value",default:20},color:{var:"--epb-low-watermark-color",default:"red"}},high:{value:{var:"--epb-high-watermark-value",default:80},color:{var:"--epb-high-watermark-color",default:"red"}},lineSize:{var:"--epb-watermark-line-size"},opacity:{var:"--epb-watermark-opacity-value"}},secondaryInfoError:{class:"secondary-info-error"},show:"show",hide:"hide",clickable:{card:"clickable-card",icon:"clickable-icon"},hiddenComponent:{icon:{label:"icon",class:"hide-icon"},shape:{label:"shape",class:"hide-shape"},name:{label:"name",class:"hide-name"},secondary_info:{label:"secondary_info",class:"hide-secondary-info"},value:{label:"value"},progress_bar:{label:"progress_bar",class:"hide-progress-bar"}},frameless:{class:"frameless"},marginless:{class:"marginless"}}},layout:{orientations:{horizontal:{label:"horizontal",grid:{grid_rows:1,grid_min_rows:1,grid_columns:2,grid_min_columns:2},mdi:"mdi:focus-field-horizontal",minHeight:"56px"},vertical:{label:"vertical",grid:{grid_rows:2,grid_min_rows:2,grid_columns:1,grid_min_columns:1},mdi:"mdi:focus-field-vertical",minHeight:"120px"}}},interactions:{event:{HASelect:["selected"],toggle:["change"],other:["value-changed","input"],closed:"closed",click:"click",configChanged:"config-changed",originalTarget:{icon:["ha-shape","ha-svg-icon"]},from:{icon:"icon",card:"card"},tap:{tapAction:"tap",holdAction:"hold",doubleTapAction:"double_tap",iconTapAction:"icon_tap",iconHoldAction:"icon_hold",iconDoubleTapAction:"icon_double_tap"}},action:{default:"default",navigate:{action:"navigate"},moreInfo:{action:"more-info"},url:{action:"url"},assist:{action:"assist"},toggle:{action:"toggle"},performAction:{action:"perform-action"},none:{action:"none"}}},editor:{fields:{container:{element:"div",class:"editor"},entity:{type:"entity",element:"ha-form"},attribute:{type:"attribute",element:"ha-select"},max_value_attribute:{type:"max_value_attribute",element:"ha-select"},icon:{type:"icon",element:"ha-form"},layout:{type:"layout",element:"ha-select"},bar_size:{type:"bar_size",element:"ha-select"},tap_action:{type:"tap_action",element:"ha-form"},double_tap_action:{type:"double_tap_action",element:"ha-form"},hold_action:{type:"hold_action",element:"ha-form"},icon_tap_action:{type:"icon_tap_action",element:"ha-form"},icon_double_tap_action:{type:"icon_double_tap_action",element:"ha-form"},icon_hold_action:{type:"icon_hold_action",element:"ha-form"},theme:{type:"theme",element:"ha-select"},color:{type:"color",element:"ha-form"},number:{type:"number",element:"ha-textfield"},default:{type:"text",element:"ha-textfield"},listItem:{type:"list item",element:"mwc-list-item"},iconItem:{element:"ha-icon",attribute:"icon",class:"editor-icon-list"},select:{element:"ha-select"},toggle:{type:"toggle",element:"ha-switch",class:"editor-toggle"},text:{element:"span"},accordion:{item:{element:"div",class:"accordion"},icon:{element:"ha-icon",class:"accordion-icon"},title:{element:"button",class:"accordion-title"},arrow:{element:"ha-icon",class:"accordion-arrow",icon:"mdi:chevron-down"},content:{element:"div",class:"accordion-content"}}},keyMappings:{attribute:"attribute",max_value_attribute:"max_value_attribute",url_path:"url_path",navigation_path:"navigation_path",theme:"theme",tapAction:"tap_action"}},theme:{default:"**CUSTOM**",battery:{label:"battery",icon:"battery"},customTheme:{expectedKeys:["min","max"],colorKeys:["color","icon_color","bar_color"]}},documentation:{link:{element:"a",class:"documentation-link",linkTarget:"_blank",documentationUrl:"https://github.com/francois-le-ko4la/lovelace-entity-progress-card/"},shape:{element:"div",class:"documentation-link-shape"},questionMark:{element:"ha-icon",class:"documentation-icon",icon:"mdi:help-circle",style:{width:"24px",class:"24px"}}}};CARD.config.defaults={tap_action:{action:"more-info"},hold_action:{action:"none"},double_tap_action:{action:"none"},icon_tap_action:{action:"none"},icon_hold_action:{action:"none"},icon_double_tap_action:{action:"none"},unit:null,layout:CARD.layout.orientations.horizontal.label,decimal:null,force_circular_background:!1,disable_unit:!1,unit_spacing:CARD.config.unit.unitSpacing.auto,entity:null,attribute:null,icon:null,name:null,max_value_attribute:null,color:null,theme:null,custom_theme:null,bar_size:CARD.style.bar.sizeOptions.small.label,bar_color:null,bar_effect:[],bar_orientation:null,reverse:null,min_value:CARD.config.value.min,max_value:CARD.config.value.max,hide:[],badge_icon:null,badge_color:null,name_info:null,custom_info:null,state_content:[],frameless:!1,marginless:!1,center_zero:!1,watermark:{low:20,low_color:"red",high:80,high_color:"red",opacity:.8,type:"blended",line_size:"1px",disable_low:!1,disable_high:!1}},CARD.console={message:`%c\u2728${CARD.meta.card.typeName.toUpperCase()} ${VERSION} IS INSTALLED.`,css:"color:orange; background-color:black; font-weight: bold;",link:"      For more details, check the README: https://github.com/francois-le-ko4la/lovelace-entity-progress-card"};const DEF_COLORS=new Set(["primary","accent","red","pink","purple","deep-purple","indigo","blue","light-blue","cyan","teal","green","light-green","lime","yellow","amber","orange","deep-orange","brown","light-grey","grey","dark-grey","blue-grey","black","white","disabled"]),THEME={optimal_when_low:{linear:!1,percent:!0,style:[{min:0,max:20,icon:null,color:"var(--success-color)"},{min:20,max:50,icon:null,color:"var(--yellow-color)"},{min:50,max:80,icon:null,color:"var(--accent-color)"},{min:80,max:100,icon:null,color:"var(--red-color)"}]},optimal_when_high:{linear:!1,percent:!0,style:[{min:0,max:20,icon:null,color:"var(--red-color)"},{min:20,max:50,icon:null,color:"var(--accent-color)"},{min:50,max:80,icon:null,color:"var(--yellow-color)"},{min:80,max:100,icon:null,color:"var(--success-color)"}]},light:{linear:!0,percent:!0,style:[{icon:"mdi:lightbulb-outline",color:"#4B4B4B"},{icon:"mdi:lightbulb-outline",color:"#877F67"},{icon:"mdi:lightbulb",color:"#C3B382"},{icon:"mdi:lightbulb",color:"#FFE79E"},{icon:"mdi:lightbulb",color:"#FFE79E"}]},temperature:{linear:!1,percent:!1,style:[{min:-50,max:-30,icon:"mdi:thermometer",color:"var(--deep-purple-color)"},{min:-30,max:-15,icon:"mdi:thermometer",color:"var(--dark-blue-color)"},{min:-15,max:-2,icon:"mdi:thermometer",color:"var(--blue-color)"},{min:-2,max:2,icon:"mdi:thermometer",color:"var(--light-blue-color)"},{min:2,max:8,icon:"mdi:thermometer",color:"var(--cyan-color)"},{min:8,max:16,icon:"mdi:thermometer",color:"var(--teal-color)"},{min:16,max:18,icon:"mdi:thermometer",color:"var(--green-teal-color)"},{min:18,max:20,icon:"mdi:thermometer",color:"var(--light-green-color)"},{min:20,max:25,icon:"mdi:thermometer",color:"var(--success-color)"},{min:25,max:27,icon:"mdi:thermometer",color:"var(--yellow-color)"},{min:27,max:29,icon:"mdi:thermometer",color:"var(--amber-color)"},{min:29,max:34,icon:"mdi:thermometer",color:"var(--deep-orange-color)"},{min:34,max:100,icon:"mdi:thermometer",color:"var(--red-color)"}]},humidity:{linear:!1,percent:!0,style:[{min:0,max:23,icon:"mdi:water-percent",color:"var(--red-color)"},{min:23,max:30,icon:"mdi:water-percent",color:"var(--accent-color)"},{min:30,max:40,icon:"mdi:water-percent",color:"var(--yellow-color)"},{min:40,max:50,icon:"mdi:water-percent",color:"var(--success-color)"},{min:50,max:60,icon:"mdi:water-percent",color:"var(--teal-color)"},{min:60,max:65,icon:"mdi:water-percent",color:"var(--light-blue-color)"},{min:65,max:80,icon:"mdi:water-percent",color:"var(--indigo-color)"},{min:80,max:100,icon:"mdi:water-percent",color:"var(--deep-purple-color)"}]},voc:{linear:!1,percent:!1,style:[{min:0,max:300,icon:"mdi:air-filter",color:"var(--success-color)"},{min:300,max:500,icon:"mdi:air-filter",color:"var(--yellow-color)"},{min:500,max:3e3,icon:"mdi:air-filter",color:"var(--accent-color)"},{min:3e3,max:25e3,icon:"mdi:air-filter",color:"var(--red-color)"},{min:25e3,max:5e4,icon:"mdi:air-filter",color:"var(--deep-purple-color)"}]},pm25:{linear:!1,percent:!1,style:[{min:0,max:12,icon:"mdi:air-filter",color:"var(--success-color)"},{min:12,max:35,icon:"mdi:air-filter",color:"var(--yellow-color)"},{min:35,max:55,icon:"mdi:air-filter",color:"var(--accent-color)"},{min:55,max:150,icon:"mdi:air-filter",color:"var(--red-color)"},{min:150,max:200,icon:"mdi:air-filter",color:"var(--deep-purple-color)"}]}},LANGUAGES={en:{card:{msg:{entityError:"entity: The 'entity' parameter is required!",entityNotFound:"Entity not found",attributeNotFound:"attribute: Attribute not found in HA.",minValueError:"min_value: Check your min_value.",maxValueError:"max_value: Check your max_value.",decimalError:"decimal: This value cannot be negative."}},editor:{title:{content:"Content",interaction:"Interactions",theme:"Look & Feel"},field:{entity:"Entity",attribute:"Attribute",name:"Name",unit:"Unit",decimal:"decimal",min_value:"Minimum value",max_value:"Maximum value",max_value_attribute:"Attribute (max_value)",tap_action:"Tap behavior",double_tap_action:"Double tap behavior",hold_action:"Hold behavior",icon_tap_action:"Icon tap behavior",icon_double_tap_action:"Icon double tap behavior",icon_hold_action:"Icon hold behavior",toggle_icon:"Icon",toggle_name:"Name",toggle_value:"Value",toggle_unit:"Unit",toggle_secondary_info:"Info",toggle_progress_bar:"Bar",toggle_force_circular_background:"Force circular background",theme:"Theme",bar_size:"Bar size",bar_color:"Color for the bar",icon:"Icon",color:"Primary color",layout:"Card layout"},option:{theme:{"":"",optimal_when_low:"Optimal when Low (CPU, RAM,...)",optimal_when_high:"Optimal when High (Battery...)",light:"Light",temperature:"Temperature",humidity:"Humidity",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"Small",medium:"Medium",large:"Large"},layout:{horizontal:"Horizontal (default)",vertical:"Vertical"}}}},fr:{card:{msg:{entityError:"entity: Le param\xE8tre 'entity' est requis !",entityNotFound:"Entit\xE9 introuvable",attributeNotFound:"attribute: Attribut introuvable dans HA.",minValueError:"min_value: V\xE9rifiez votre min_value.",maxValueError:"max_value: V\xE9rifiez votre max_value.",decimalError:"decimal: La valeur ne peut pas \xEAtre n\xE9gative."}},editor:{title:{content:"Contenu",interaction:"Interactions",theme:"Aspect visuel et convivialit\xE9"},field:{entity:"Entit\xE9",attribute:"Attribut",name:"Nom",unit:"Unit\xE9",decimal:"d\xE9cimal",min_value:"Valeur minimum",max_value:"Valeur maximum",max_value_attribute:"Attribut (max_value)",tap_action:"Comportement lors d'un appui court",double_tap_action:"Comportement lors d'un double appui",hold_action:"Comportement lors d'un appui long",icon_tap_action:"Comportement lors de l'appui sur l'ic\xF4ne",icon_double_tap_action:"Comportement lors d'un double appui sur l'ic\xF4ne",icon_hold_action:"Comportement lors d'un appui long sur l'ic\xF4ne",toggle_icon:"Ic\xF4ne",toggle_name:"Nom",toggle_value:"Valeur",toggle_unit:"Unit\xE9",toggle_secondary_info:"Info",toggle_progress_bar:"Barre",toggle_force_circular_background:"Forcer le fond circulaire",theme:"Th\xE8me",bar_size:"Taille de la barre",bar_color:"Couleur de la barre",icon:"Ic\xF4ne",color:"Couleur de l'ic\xF4ne",layout:"Disposition de la carte"},option:{theme:{"":"",optimal_when_low:"Optimal quand c'est bas (CPU, RAM,...)",optimal_when_high:"Optimal quand c'est \xE9lev\xE9 (Batterie...)",light:"Lumi\xE8re",temperature:"Temp\xE9rature",humidity:"Humidit\xE9",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"Petite",medium:"Moyenne",large:"Grande"},layout:{horizontal:"Horizontal (par d\xE9faut)",vertical:"Vertical"}}}},es:{card:{msg:{entityError:"entity: \xA1El par\xE1metro 'entity' es obligatorio!",entityNotFound:"Entidad no encontrada",attributeNotFound:"attribute: Atributo no encontrado en HA.",minValueError:"min_value: Verifique su min_value.",maxValueError:"max_value: Verifique su max_value.",decimalError:"decimal: El valor no puede ser negativo."}},editor:{title:{content:"Contenido",interaction:"Interacciones",theme:"Apariencia y funcionamiento"},field:{entity:"Entidad",attribute:"Atributo",name:"Nombre",unit:"Unidad",decimal:"decimal",min_value:"Valor m\xEDnimo",max_value:"Valor m\xE1ximo",max_value_attribute:"Atributo (max_value)",tap_action:"Acci\xF3n al pulsar brevemente",double_tap_action:"Acci\xF3n al pulsar dos veces",hold_action:"Acci\xF3n al mantener pulsado",icon_tap_action:"Acci\xF3n al pulsar el icono",icon_double_tap_action:"Acci\xF3n al pulsar dos veces el icono",icon_hold_action:"Acci\xF3n al mantener pulsado el icono",toggle_icon:"Icono",toggle_name:"Nombre",toggle_value:"Valor",toggle_unit:"Unidad",toggle_secondary_info:"Info",toggle_progress_bar:"Barra",toggle_force_circular_background:"Forzar fondo circular",theme:"Tema",bar_size:"Tama\xF1o de la barra",bar_color:"Color de la barra",icon:"Icono",color:"Color del icono",layout:"Disposici\xF3n de la tarjeta"},option:{theme:{"":"",optimal_when_low:"\xD3ptimo cuando es bajo (CPU, RAM,...)",optimal_when_high:"\xD3ptimo cuando es alto (Bater\xEDa...)",light:"Luz",temperature:"Temperatura",humidity:"Humedad",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"Peque\xF1a",medium:"Media",large:"Grande"},layout:{horizontal:"Horizontal (predeterminado)",vertical:"Vertical"}}}},it:{card:{msg:{entityError:"entity: Il parametro 'entity' \xE8 obbligatorio!",entityNotFound:"Entit\xE0 non trovata",attributeNotFound:"attribute: Attributo non trovato in HA.",minValueError:"min_value: Controlla il tuo min_value.",maxValueError:"max_value: Controlla il tuo max_value.",decimalError:"decimal: Questo valore non pu\xF2 essere negativo."}},editor:{title:{content:"Contenuto",interaction:"Interazioni",theme:"Aspetto e funzionalit\xE0"},field:{entity:"Entit\xE0",attribute:"Attributo",name:"Nome",unit:"Unit\xE0",decimal:"Decimale",min_value:"Valore minimo",max_value:"Valore massimo",max_value_attribute:"Attributo (max_value)",tap_action:"Azione al tocco breve",double_tap_action:"Azione al doppio tocco",hold_action:"Azione al tocco prolungato",icon_tap_action:"Azione al tocco dell'icona",icon_double_tap_action:"Azione al doppio tocco dell'icona",icon_hold_action:"Azione al tocco prolungato dell'icona",toggle_icon:"Icona",toggle_name:"Nome",toggle_value:"Valore",toggle_unit:"Unit\xE0",toggle_secondary_info:"Info",toggle_progress_bar:"Barra",toggle_force_circular_background:"Forza sfondo circolare",theme:"Tema",bar_size:"Dimensione della barra",bar_color:"Colore per la barra",icon:"Icona",color:"Colore dell'icona",layout:"Layout della carta"},option:{theme:{"":"",optimal_when_low:"Ottimale quando \xE8 basso (CPU, RAM,...)",optimal_when_high:"Ottimale quando \xE8 alto (Batteria...)",light:"Luce",temperature:"Temperatura",humidity:"Umidit\xE0",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"Piccola",medium:"Media",large:"Grande"},layout:{horizontal:"Orizzontale (predefinito)",vertical:"Verticale"}}}},de:{card:{msg:{entityError:"entity: Der Parameter 'entity' ist erforderlich!",entityNotFound:"Entit\xE4t nicht gefunden",attributeNotFound:"attribute: Attribut in HA nicht gefunden.",minValueError:"min_value: \xDCberpr\xFCfen Sie Ihren min_value.",maxValueError:"max_value: \xDCberpr\xFCfen Sie Ihren max_value.",decimalError:"decimal: Negative Werte sind nicht zul\xE4ssig."}},editor:{title:{content:"Inhalt",interaction:"Interaktionen",theme:"Aussehen und Bedienung"},field:{entity:"Entit\xE4t",attribute:"Attribut",name:"Name",unit:"Einheit",decimal:"dezimal",min_value:"Mindestwert",max_value:"H\xF6chstwert",max_value_attribute:"Attribut (max_value)",tap_action:"Aktion bei kurzem Tippen",double_tap_action:"Aktion bei doppelt Tippen",hold_action:"Aktion bei langem Tippen",icon_tap_action:"Aktion beim Tippen auf das Symbol",icon_double_tap_action:"Aktion bei doppelt Tippen auf das Symbol",icon_hold_action:"Aktion bei langem Tippen auf das Symbol",toggle_icon:"Icon",toggle_name:"Name",toggle_value:"Wert",toggle_unit:"Einheit",toggle_secondary_info:"Info",toggle_progress_bar:"Balken",toggle_force_circular_background:"Kreisf\xF6rmigen Hintergrund erzwingen",theme:"Thema",bar_size:"Gr\xF6\xDFe der Bar",bar_color:"Farbe f\xFCr die Leiste",icon:"Symbol",color:"Prim\xE4rfarbe",layout:"Kartenlayout"},option:{theme:{"":"",optimal_when_low:"Optimal bei niedrig (CPU, RAM,...)",optimal_when_high:"Optimal bei hoch (Batterie...)",light:"Licht",temperature:"Temperatur",humidity:"Feuchtigkeit",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"Klein",medium:"Mittel",large:"Gro\xDF"},layout:{horizontal:"Horizontal (Standard)",vertical:"Vertikal"}}}},nl:{card:{msg:{entityError:"entity: De parameter 'entity' is verplicht!",entityNotFound:"Entiteit niet gevonden",attributeNotFound:"attribute: Attribuut niet gevonden in HA.",minValueError:"min_value: Controleer je min_value.",maxValueError:"max_value: Controleer je max_value.",decimalError:"decimal: Deze waarde kan niet negatief zijn."}},editor:{title:{content:"Inhoud",interaction:"Interactie",theme:"Uiterlijk en gebruiksgemak"},field:{entity:"Entiteit",attribute:"Attribuut",name:"Naam",unit:"Eenheid",decimal:"decimaal",min_value:"Minimale waarde",max_value:"Maximale waarde",max_value_attribute:"Attribuut (max_value)",tap_action:"Actie bij korte tik",double_tap_action:"Actie bij dubbel tikken",hold_action:"Actie bij lang ingedrukt houden",icon_tap_action:"Actie bij tikken op pictogram",icon_double_tap_action:"Actie bij dubbel tikken op pictogram",icon_hold_action:"Actie bij lang ingedrukt houden op pictogram",toggle_icon:"Icoon",toggle_name:"Naam",toggle_value:"Waarde",toggle_unit:"Eenheid",toggle_secondary_info:"Info",toggle_progress_bar:"Balk",toggle_force_circular_background:"Geforceerde cirkelvormige achtergrond",theme:"Thema",bar_size:"Balkgrootte",bar_color:"Kleur voor de balk",icon:"Pictogram",color:"Primaire kleur",layout:"Kaartindeling"},option:{theme:{"":"",optimal_when_low:"Optimaal wanneer laag (CPU, RAM,...)",optimal_when_high:"Optimaal wanneer hoog (Batterij...)",light:"Licht",temperature:"Temperatuur",humidity:"Vochtigheid",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"Klein",medium:"Middel",large:"Groot"},layout:{horizontal:"Horizontaal (standaard)",vertical:"Verticaal"}}}},hr:{card:{msg:{entityError:"entity: Parametar 'entity' je obavezan!",entityNotFound:"Entitet nije prona\u0111en",attributeNotFound:"attribute: Atribut nije prona\u0111en u HA.",minValueError:"min_value: Provjerite svoj min_value.",maxValueError:"max_value: Provjerite svoj max_value.",decimalError:"decimal: Ova vrijednost ne mo\u017Ee biti negativna."}},editor:{title:{content:"Sadr\u017Eaj",interaction:"Interakcije",theme:"Izgled i funkcionalnost"},field:{entity:"Entitet",attribute:"Atribut",name:"Ime",unit:"Jedinica",decimal:"decimalni",min_value:"Minimalna vrijednost",max_value:"Maksimalna vrijednost",max_value_attribute:"Atribut (max_value)",tap_action:"Radnja na kratki dodir",double_tap_action:"Radnja na dupli dodir",hold_action:"Radnja na dugi dodir",icon_tap_action:"Radnja na dodir ikone",icon_double_tap_action:"Radnja na dupli dodir ikone",icon_hold_action:"Radnja na dugi dodir ikone",toggle_icon:"Ikona",toggle_name:"Ime",toggle_value:"Vrijednost",toggle_unit:"Jedinica",toggle_secondary_info:"Info",toggle_progress_bar:"Traka",toggle_force_circular_background:"Prisili kru\u017Enu pozadinu",theme:"Tema",bar_size:"Veli\u010Dina trake",bar_color:"Boja za traku",icon:"Ikona",color:"Primarna boja",layout:"Izgled kartice"},option:{theme:{"":"",optimal_when_low:"Optimalno kada je nisko (CPU, RAM,...)",optimal_when_high:"Optimalno kada je visoko (Baterija...)",light:"Svjetlo",temperature:"Temperatura",humidity:"Vla\u017Enost",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"Mali",medium:"Srednje",large:"Veliko"},layout:{horizontal:"Horizontalno (zadano)",vertical:"Vertikalno"}}}},pl:{card:{msg:{entityError:"entity: Parametr 'entity' jest wymagany!",entityNotFound:"Encji nie znaleziono",attributeNotFound:"attribute: Atrybut nie znaleziony w HA.",minValueError:"min_value: Sprawd\u017A sw\xF3j min_value.",maxValueError:"max_value: Sprawd\u017A sw\xF3j max_value.",decimalError:"decimal: Ta warto\u015B\u0107 nie mo\u017Ce by\u0107 ujemna."}},editor:{title:{content:"Zawarto\u015B\u0107",interaction:"Interakcje",theme:"Wygl\u0105d i funkcjonalno\u015B\u0107"},field:{entity:"Encja",attribute:"Atrybut",name:"Nazwa",unit:"Jednostka",decimal:"dziesi\u0119tny",min_value:"Warto\u015B\u0107 minimalna",max_value:"Warto\u015B\u0107 maksymalna",max_value_attribute:"Atrybut (max_value)",tap_action:"Akcja przy kr\xF3tkim naci\u015Bni\u0119ciu",double_tap_action:"Akcja przy podw\xF3jnym naci\u015Bni\u0119ciu",hold_action:"Akcja przy d\u0142ugim naci\u015Bni\u0119ciu",icon_tap_action:"Akcja przy naci\u015Bni\u0119ciu ikony",icon_double_tap_action:"Akcja przy podw\xF3jnym naci\u015Bni\u0119ciu ikony",icon_hold_action:"Akcja przy d\u0142ugim naci\u015Bni\u0119ciu ikony",toggle_icon:"Ikona",toggle_name:"Nazwa",toggle_value:"Warto\u015B\u0107",toggle_unit:"Jednostka",toggle_secondary_info:"Info",toggle_progress_bar:"Pasek",toggle_force_circular_background:"Wymu\u015B okr\u0105g\u0142e t\u0142o",theme:"Motyw",bar_size:"Rozmiar paska",bar_color:"Kolor paska",icon:"Ikona",color:"Kolor podstawowy",layout:"Uk\u0142ad karty"},option:{theme:{"":"",optimal_when_low:"Optymalny, gdy niskie (CPU, RAM,...)",optimal_when_high:"Optymalny, gdy wysokie (Bateria...)",light:"\u015Awiat\u0142o",temperature:"Temperatura",humidity:"Wilgotno\u015B\u0107",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"Ma\u0142y",medium:"\u015Aredni",large:"Du\u017Cy"},layout:{horizontal:"Poziomo (domy\u015Blnie)",vertical:"Pionowy"}}}},mk:{card:{msg:{entityError:"entity: \u041F\u0430\u0440\u0430\u043C\u0435\u0442\u0430\u0440\u043E\u0442 'entity' \u0435 \u0437\u0430\u0434\u043E\u043B\u0436\u0438\u0442\u0435\u043B\u0435\u043D!",entityNotFound:"\u0415\u043D\u0442\u0438\u0442\u0435\u0442\u043E\u0442 \u043D\u0435 \u0435 \u043F\u0440\u043E\u043D\u0430\u0458\u0434\u0435\u043D",attributeNotFound:"attribute: \u0410\u0442\u0440\u0438\u0431\u0443\u0442\u043E\u0442 \u043D\u0435 \u0435 \u043F\u0440\u043E\u043D\u0430\u0458\u0434\u0435\u043D \u0432\u043E HA.",minValueError:"min_value: \u041F\u0440\u043E\u0432\u0435\u0440\u0435\u0442\u0435 \u0433\u043E \u0432\u0430\u0448\u0438\u043E\u0442 min_value.",maxValueError:"max_value: \u041F\u0440\u043E\u0432\u0435\u0440\u0435\u0442\u0435 \u0433\u043E \u0432\u0430\u0448\u0438\u043E\u0442 max_value.",decimalError:"decimal: \u041E\u0432\u0430 \u0432\u0440\u0435\u0434\u043D\u043E\u0441\u0442 \u043D\u0435 \u043C\u043E\u0436\u0435 \u0434\u0430 \u0431\u0438\u0434\u0435 \u043D\u0435\u0433\u0430\u0442\u0438\u0432\u043D\u0430."}},editor:{title:{content:"\u0421\u043E\u0434\u0440\u0436\u0438\u043D\u0430",interaction:"\u0418\u043D\u0442\u0435\u0440\u0430\u043A\u0446\u0438\u0438",theme:"\u0418\u0437\u0433\u043B\u0435\u0434 \u0438 \u0444\u0443\u043D\u043A\u0446\u0438\u043E\u043D\u0430\u043B\u043D\u043E\u0441\u0442"},field:{entity:"\u0415\u043D\u0442\u0438\u0442\u0435\u0442",attribute:"\u0410\u0442\u0440\u0438\u0431\u0443\u0442",name:"\u0418\u043C\u0435",unit:"\u0408\u0435\u0434\u0438\u043D\u0441\u0442\u0432\u043E",decimal:"\u0434\u0435\u0446\u0435\u043C\u0430\u043B\u0435\u043D",min_value:"\u041C\u0438\u043D\u0438\u043C\u0430\u043B\u043D\u0430 \u0432\u0440\u0435\u0434\u043D\u043E\u0441\u0442",max_value:"\u041C\u0430\u043A\u0441\u0438\u043C\u0430\u043B\u043D\u0430 \u0432\u0440\u0435\u0434\u043D\u043E\u0441\u0442",max_value_attribute:"\u0410\u0442\u0440\u0438\u0431\u0443\u0442 (max_value)",tap_action:"\u0414\u0435\u0458\u0441\u0442\u0432\u043E \u043F\u0440\u0438 \u043A\u0440\u0430\u0442\u043E\u043A \u0434\u043E\u043F\u0438\u0440",double_tap_action:"\u0414\u0435\u0458\u0441\u0442\u0432\u043E \u043F\u0440\u0438 \u0434\u0432\u043E\u0435\u043D \u0434\u043E\u043F\u0438\u0440",hold_action:"\u0414\u0435\u0458\u0441\u0442\u0432\u043E \u043F\u0440\u0438 \u0434\u043E\u043B\u0433 \u0434\u043E\u043F\u0438\u0440",icon_tap_action:"\u0414\u0435\u0458\u0441\u0442\u0432\u043E \u043F\u0440\u0438 \u0434\u043E\u043F\u0438\u0440 \u043D\u0430 \u0438\u043A\u043E\u043D\u0430\u0442\u0430",icon_double_tap_action:"\u0414\u0435\u0458\u0441\u0442\u0432\u043E \u043F\u0440\u0438 \u0434\u0432\u043E\u0435\u043D \u0434\u043E\u043F\u0438\u0440 \u043D\u0430 \u0438\u043A\u043E\u043D\u0430\u0442\u0430",icon_hold_action:"\u0414\u0435\u0458\u0441\u0442\u0432\u043E \u043F\u0440\u0438 \u0434\u043E\u043B\u0433 \u0434\u043E\u043F\u0438\u0440 \u043D\u0430 \u0438\u043A\u043E\u043D\u0430\u0442\u0430",toggle_icon:"\u0418\u043A\u043E\u043D\u0430",toggle_name:"\u0418\u043C\u0435",toggle_value:"\u0412\u0440\u0435\u0434\u043D\u043E\u0441\u0442",toggle_unit:"\u0408\u0435\u0434\u0438\u043D\u0441\u0442\u0432\u043E",toggle_secondary_info:"\u0418\u043D\u0444\u043E",toggle_progress_bar:"\u041B\u0435\u043D\u0442\u0430",toggle_force_circular_background:"\u041F\u0440\u0438\u043D\u0443\u0434\u0438 \u043A\u0440\u0443\u0436\u043D\u0430 \u043F\u043E\u0437\u0430\u0434\u0438\u043D\u0430",theme:"\u0422\u0435\u043C\u0430",bar_size:"\u0413\u043E\u043B\u0435\u043C\u0438\u043D\u0430 \u043D\u0430 \u043B\u0435\u043D\u0442\u0430",bar_color:"\u0411\u043E\u0458\u0430 \u0437\u0430 \u043B\u0435\u043D\u0442\u0430\u0442\u0430",icon:"\u0418\u043A\u043E\u043D\u0430",color:"\u041F\u0440\u0438\u043C\u0430\u0440\u043D\u0430 \u0431\u043E\u0458\u0430",layout:"\u0420\u0430\u0441\u043F\u043E\u0440\u0435\u0434 \u043D\u0430 \u043A\u0430\u0440\u0442\u0430"},option:{theme:{"":"",optimal_when_low:"\u041E\u043F\u0442\u0438\u043C\u0430\u043B\u043D\u043E \u043A\u043E\u0433\u0430 \u0435 \u043D\u0438\u0441\u043A\u043E(CPU, RAM,...)",optimal_when_high:"\u041E\u043F\u0442\u0438\u043C\u0430\u043B\u043D\u043E \u043A\u043E\u0433\u0430 \u0435 \u0432\u0438\u0441\u043E\u043A\u043E (\u0411\u0430\u0442\u0435\u0440\u0438\u0458\u0430...)",light:"\u0421\u0432\u0435\u0442\u043B\u0438\u043D\u0430",temperature:"\u0422\u0435\u043C\u043F\u0435\u0440\u0430\u0442\u0443\u0440\u0430",humidity:"\u0412\u043B\u0430\u0436\u043D\u043E\u0441\u0442",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"\u041C\u0430\u043B\u043E",medium:"\u0421\u0440\u0435\u0434\u043D\u043E",large:"\u0413\u043E\u043B\u0435\u043C\u043E"},layout:{horizontal:"\u0425\u043E\u0440\u0438\u0437\u043E\u043D\u0442\u0430\u043B\u043D\u043E (\u0441\u0442\u0430\u043D\u0434\u0430\u0440\u0434\u043D\u043E)",vertical:"\u0412\u0435\u0440\u0442\u0438\u043A\u0430\u043B\u043D\u043E"}}}},pt:{card:{msg:{entityError:"entity: O par\xE2metro 'entity' \xE9 obrigat\xF3rio!",entityNotFound:"Entidade n\xE3o encontrada",attributeNotFound:"attribute: Atributo n\xE3o encontrado no HA.",minValueError:"min_value: Verifique o seu min_value.",maxValueError:"max_value: Verifique o seu max_value.",decimalError:"decimal: Este valor n\xE3o pode ser negativo."}},editor:{title:{content:"Conte\xFAdo",interaction:"Intera\xE7\xF5es",theme:"Apar\xEAncia e usabilidade"},field:{entity:"Entidade",attribute:"Atributo",name:"Nome",unit:"Unidade",decimal:"decimal",min_value:"Valor m\xEDnimo",max_value:"Valor m\xE1ximo",max_value_attribute:"Atributo (max_value)",tap_action:"A\xE7\xE3o ao toque curto",double_tap_action:"A\xE7\xE3o ao toque duplo",hold_action:"A\xE7\xE3o ao toque longo",icon_tap_action:"A\xE7\xE3o ao tocar no \xEDcone",icon_double_tap_action:"A\xE7\xE3o ao tocar duplamente no \xEDcone",icon_hold_action:"A\xE7\xE3o ao manter o toque no \xEDcone",toggle_icon:"\xCDcone",toggle_name:"Nome",toggle_value:"Valor",toggle_unit:"Unidade",toggle_secondary_info:"Info",toggle_progress_bar:"Barra",toggle_force_circular_background:"For\xE7ar fundo circular",theme:"Tema",bar_size:"Tamanho da barra",bar_color:"Cor para a barra",icon:"\xCDcone",color:"Cor prim\xE1ria",layout:"Layout do cart\xE3o"},option:{theme:{"":"",optimal_when_low:"\xD3timo quando \xE9 baixo (CPU, RAM,...)",optimal_when_high:"\xD3timo quando \xE9 alto (Bateria...)",light:"Luz",temperature:"Temperatura",humidity:"Humidade",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"Pequeno",medium:"M\xE9dio",large:"Grande"},layout:{horizontal:"Horizontal (padr\xE3o)",vertical:"Vertical"}}}},da:{card:{msg:{entityError:"entity: Parameteren 'entity' er p\xE5kr\xE6vet!",entityNotFound:"Enheden blev ikke fundet",attributeNotFound:"attribute: Attribut ikke fundet i HA.",minValueError:"min_value: Tjekk din min_value.",maxValueError:"max_value: Tjekk din max_value.",decimalError:"decimal: Denne v\xE6rdi kan ikke v\xE6re negativ."}},editor:{title:{content:"Indhold",interaction:"Interaktioner",theme:"Udseende og funktionalitet"},field:{entity:"Enhed",attribute:"Attribut",name:"Navn",unit:"Enhed",decimal:"decimal",min_value:"Minimumsv\xE6rdi",max_value:"Maksimal v\xE6rdi",max_value_attribute:"Attribut (max_value)",tap_action:"Handling ved kort tryk",double_tap_action:"Handling ved dobbelt tryk",hold_action:"Handling ved langt tryk",icon_tap_action:"Handling ved tryk p\xE5 ikonet",icon_double_tap_action:"Handling ved dobbelt tryk p\xE5 ikonet",icon_hold_action:"Handling ved langt tryk p\xE5 ikonet",toggle_icon:"Ikon",toggle_name:"Navn",toggle_value:"V\xE6rdi",toggle_unit:"Enhed",toggle_secondary_info:"Info",toggle_progress_bar:"Bar",toggle_force_circular_background:"Tving cirkul\xE6r baggrund",theme:"Tema",bar_size:"Bar st\xF8rrelse",bar_color:"Farve til bar",icon:"Ikon",color:"Prim\xE6r farve",layout:"Kort layout"},option:{theme:{"":"",optimal_when_low:"Optimal n\xE5r lavt (CPU, RAM,...)",optimal_when_high:"Optimal n\xE5r h\xF8jt (Batteri...)",light:"Lys",temperature:"Temperatur",humidity:"Fugtighed",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"Lille",medium:"Mellem",large:"Stor"},layout:{horizontal:"Horisontal (standard)",vertical:"Vertikal"}}}},nb:{card:{msg:{entityError:"entity: Parameteret 'entity' er p\xE5krevd!",entityNotFound:"Enheten ble ikke funnet",attributeNotFound:"attribute: Attributt ikke funnet i HA.",minValueError:"min_value: Sjekk din min_value.",maxValueError:"max_value: Sjekk din max_value.",decimalError:"decimal: Denne verdien kan ikke v\xE6re negativ."}},editor:{title:{content:"Innhold",interaction:"Interaksjoner",theme:"Utseende og funksjonalitet"},field:{entity:"Enhet",attribute:"Attributt",name:"Navn",unit:"Enhet",decimal:"desimal",min_value:"Minste verdi",max_value:"Maksimal verdi",max_value_attribute:"Attributt (max_value)",tap_action:"Handling ved kort trykk",double_tap_action:"Handling ved dobbelt trykk",hold_action:"Handling ved langt trykk",icon_tap_action:"Handling ved trykk p\xE5 ikonet",icon_double_tap_action:"Handling ved dobbelt trykk p\xE5 ikonet",icon_hold_action:"Handling ved langt trykk p\xE5 ikonet",toggle_icon:"Ikon",toggle_name:"Navn",toggle_value:"Verdi",toggle_unit:"Enhet",toggle_secondary_info:"Info",toggle_progress_bar:"Bar",toggle_force_circular_background:"Tving sirkul\xE6r bakgrunn",theme:"Tema",bar_size:"Bar st\xF8rrelse",bar_color:"Farge for baren",icon:"Ikon",color:"Prim\xE6rfarge",layout:"Kortlayout"},option:{theme:{"":"",optimal_when_low:"Optimal n\xE5r lavt (CPU, RAM,...)",optimal_when_high:"Optimal n\xE5r h\xF8yt (Batteri...)",light:"Lys",temperature:"Temperatur",humidity:"Fuktighet",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"Liten",medium:"Middels",large:"Stor"},layout:{horizontal:"Horisontal (standard)",vertical:"Vertikal"}}}},sv:{card:{msg:{entityError:"entity: Parametern 'entity' \xE4r obligatorisk!",entityNotFound:"Enhet ej funnen",attributeNotFound:"attribute: Attributet hittades inte i HA.",minValueError:"min_value: Kontrollera ditt min_value.",maxValueError:"max_value: Kontrollera ditt max_value.",decimalError:"decimal: Detta v\xE4rde kan inte vara negativt."}},editor:{title:{content:"Inneh\xE5ll",interaction:"Interaktioner",theme:"Utseende och funktionalitet"},field:{entity:"Enhet",attribute:"Attribut",name:"Namn",unit:"Enhet",decimal:"decimal",min_value:"Minsta v\xE4rde",max_value:"Maximalt v\xE4rde",max_value_attribute:"Attribut (max_value)",tap_action:"\xC5tg\xE4rd vid kort tryck",double_tap_action:"\xC5tg\xE4rd vid dubbeltryck",hold_action:"\xC5tg\xE4rd vid l\xE5ngt tryck",icon_tap_action:"\xC5tg\xE4rd vid tryck p\xE5 ikonen",icon_double_tap_action:"\xC5tg\xE4rd vid dubbeltryck p\xE5 ikonen",icon_hold_action:"\xC5tg\xE4rd vid l\xE5ngt tryck p\xE5 ikonen",toggle_icon:"Ikon",toggle_name:"Namn",toggle_value:"V\xE4rde",toggle_unit:"Enhet",toggle_secondary_info:"Info",toggle_progress_bar:"Bar",toggle_force_circular_background:"Tvinga cirkul\xE4r bakgrund",theme:"Tema",bar_size:"Barstorlek",bar_color:"F\xE4rg f\xF6r baren",icon:"Ikon",color:"Prim\xE4rf\xE4rg",layout:"Kortlayout"},option:{theme:{"":"",optimal_when_low:"Optimal n\xE4r det \xE4r l\xE5gt (CPU, RAM,...)",optimal_when_high:"Optimal n\xE4r det \xE4r h\xF6gt (Batteri...)",light:"Ljus",temperature:"Temperatur",humidity:"Luftfuktighet",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"Liten",medium:"Medium",large:"Stor"},layout:{horizontal:"Horisontell (standard)",vertical:"Vertikal"}}}},el:{card:{msg:{entityError:"\u03BF\u03BD\u03C4\u03CC\u03C4\u03B7\u03C4\u03B1: \u0397 \u03C0\u03B1\u03C1\u03AC\u03BC\u03B5\u03C4\u03C1\u03BF\u03C2 'entity' \u03B5\u03AF\u03BD\u03B1\u03B9 \u03C5\u03C0\u03BF\u03C7\u03C1\u03B5\u03C9\u03C4\u03B9\u03BA\u03AE!",entityNotFound:"\u0397 \u03BF\u03BD\u03C4\u03CC\u03C4\u03B7\u03C4\u03B1 \u03B4\u03B5\u03BD \u03B2\u03C1\u03AD\u03B8\u03B7\u03BA\u03B5",attributeNotFound:"\u03C7\u03B1\u03C1\u03B1\u03BA\u03C4\u03B7\u03C1\u03B9\u03C3\u03C4\u03B9\u03BA\u03CC: \u03A4\u03BF \u03C7\u03B1\u03C1\u03B1\u03BA\u03C4\u03B7\u03C1\u03B9\u03C3\u03C4\u03B9\u03BA\u03CC \u03B4\u03B5\u03BD \u03B2\u03C1\u03AD\u03B8\u03B7\u03BA\u03B5 \u03C3\u03C4\u03BF HA.",minValueError:"min_value: \u0395\u03BB\u03AD\u03B3\u03BE\u03C4\u03B5 \u03C4\u03B7\u03BD \u03B5\u03BB\u03AC\u03C7\u03B9\u03C3\u03C4\u03B7 \u03C4\u03B9\u03BC\u03AE.",maxValueError:"max_value: \u0395\u03BB\u03AD\u03B3\u03BE\u03C4\u03B5 \u03C4\u03B7 \u03BC\u03AD\u03B3\u03B9\u03C3\u03C4\u03B7 \u03C4\u03B9\u03BC\u03AE.",decimalError:"decimal: \u0391\u03C5\u03C4\u03AE \u03B7 \u03C4\u03B9\u03BC\u03AE \u03B4\u03B5\u03BD \u03BC\u03C0\u03BF\u03C1\u03B5\u03AF \u03BD\u03B1 \u03B5\u03AF\u03BD\u03B1\u03B9 \u03B1\u03C1\u03BD\u03B7\u03C4\u03B9\u03BA\u03AE."}},editor:{title:{content:"\u03A0\u03B5\u03C1\u03B9\u03B5\u03C7\u03CC\u03BC\u03B5\u03BD\u03BF",interaction:"\u0391\u03BB\u03BB\u03B7\u03BB\u03B5\u03C0\u03B9\u03B4\u03C1\u03AC\u03C3\u03B5\u03B9\u03C2",theme:"\u0395\u03BC\u03C6\u03AC\u03BD\u03B9\u03C3\u03B7"},field:{entity:"\u039F\u03BD\u03C4\u03CC\u03C4\u03B7\u03C4\u03B1",attribute:"\u03A7\u03B1\u03C1\u03B1\u03BA\u03C4\u03B7\u03C1\u03B9\u03C3\u03C4\u03B9\u03BA\u03CC",name:"\u038C\u03BD\u03BF\u03BC\u03B1",unit:"\u039C\u03BF\u03BD\u03AC\u03B4\u03B1",decimal:"\u03B4\u03B5\u03BA\u03B1\u03B4\u03B9\u03BA\u03AC",min_value:"\u0395\u03BB\u03AC\u03C7\u03B9\u03C3\u03C4\u03B7 \u03C4\u03B9\u03BC\u03AE",max_value:"\u039C\u03AD\u03B3\u03B9\u03C3\u03C4\u03B7 \u03C4\u03B9\u03BC\u03AE",max_value_attribute:"\u03A7\u03B1\u03C1\u03B1\u03BA\u03C4\u03B7\u03C1\u03B9\u03C3\u03C4\u03B9\u03BA\u03CC (max_value)",tap_action:"\u0395\u03BD\u03AD\u03C1\u03B3\u03B5\u03B9\u03B1 \u03BA\u03B1\u03C4\u03AC \u03C4\u03BF \u03C3\u03CD\u03BD\u03C4\u03BF\u03BC\u03BF \u03C0\u03AC\u03C4\u03B7\u03BC\u03B1",double_tap_action:"\u0395\u03BD\u03AD\u03C1\u03B3\u03B5\u03B9\u03B1 \u03BA\u03B1\u03C4\u03AC \u03C4\u03BF \u03B4\u03B9\u03C0\u03BB\u03CC \u03C0\u03AC\u03C4\u03B7\u03BC\u03B1",hold_action:"\u0395\u03BD\u03AD\u03C1\u03B3\u03B5\u03B9\u03B1 \u03BA\u03B1\u03C4\u03AC \u03C4\u03BF \u03C0\u03B1\u03C1\u03B1\u03C4\u03B5\u03C4\u03B1\u03BC\u03AD\u03BD\u03BF \u03C0\u03AC\u03C4\u03B7\u03BC\u03B1",icon_tap_action:"\u0395\u03BD\u03AD\u03C1\u03B3\u03B5\u03B9\u03B1 \u03C3\u03C4\u03BF \u03C0\u03AC\u03C4\u03B7\u03BC\u03B1 \u03C4\u03BF\u03C5 \u03B5\u03B9\u03BA\u03BF\u03BD\u03B9\u03B4\u03AF\u03BF\u03C5",icon_double_tap_action:"\u0395\u03BD\u03AD\u03C1\u03B3\u03B5\u03B9\u03B1 \u03C3\u03C4\u03BF \u03B4\u03B9\u03C0\u03BB\u03CC \u03C0\u03AC\u03C4\u03B7\u03BC\u03B1 \u03C4\u03BF\u03C5 \u03B5\u03B9\u03BA\u03BF\u03BD\u03B9\u03B4\u03AF\u03BF\u03C5",icon_hold_action:"\u0395\u03BD\u03AD\u03C1\u03B3\u03B5\u03B9\u03B1 \u03C3\u03C4\u03BF \u03C0\u03B1\u03C1\u03B1\u03C4\u03B5\u03C4\u03B1\u03BC\u03AD\u03BD\u03BF \u03C0\u03AC\u03C4\u03B7\u03BC\u03B1 \u03C4\u03BF\u03C5 \u03B5\u03B9\u03BA\u03BF\u03BD\u03B9\u03B4\u03AF\u03BF\u03C5",toggle_icon:"\u0395\u03B9\u03BA\u03BF\u03BD\u03AF\u03B4\u03B9\u03BF",toggle_name:"\u038C\u03BD\u03BF\u03BC\u03B1",toggle_value:"\u03A4\u03B9\u03BC\u03AE",toggle_unit:"\u039C\u03BF\u03BD\u03AC\u03B4\u03B1",toggle_secondary_info:"\u03A0\u03BB\u03B7\u03C1\u03BF\u03C6\u03BF\u03C1\u03AF\u03B5\u03C2",toggle_progress_bar:"\u0393\u03C1\u03B1\u03BC\u03BC\u03AE",toggle_force_circular_background:"\u0395\u03BE\u03B1\u03BD\u03B1\u03B3\u03BA\u03B1\u03C3\u03BC\u03CC\u03C2 \u03BA\u03C5\u03BA\u03BB\u03B9\u03BA\u03BF\u03CD \u03C6\u03CC\u03BD\u03C4\u03BF\u03C5",theme:"\u0398\u03AD\u03BC\u03B1",bar_size:"\u039C\u03AD\u03B3\u03B5\u03B8\u03BF\u03C2 \u03B3\u03C1\u03B1\u03BC\u03BC\u03AE\u03C2",bar_color:"\u03A7\u03C1\u03CE\u03BC\u03B1 \u03B3\u03C1\u03B1\u03BC\u03BC\u03AE\u03C2",icon:"\u0395\u03B9\u03BA\u03BF\u03BD\u03AF\u03B4\u03B9\u03BF",color:"\u039A\u03CD\u03C1\u03B9\u03BF \u03C7\u03C1\u03CE\u03BC\u03B1",layout:"\u0394\u03B9\u03AC\u03C4\u03B1\u03BE\u03B7 \u03BA\u03AC\u03C1\u03C4\u03B1\u03C2"},option:{theme:{"":"",optimal_when_low:"\u0392\u03AD\u03BB\u03C4\u03B9\u03C3\u03C4\u03BF \u03CC\u03C4\u03B1\u03BD \u03B5\u03AF\u03BD\u03B1\u03B9 \u03C7\u03B1\u03BC\u03B7\u03BB\u03CC (CPU, RAM...)",optimal_when_high:"\u0392\u03AD\u03BB\u03C4\u03B9\u03C3\u03C4\u03BF \u03CC\u03C4\u03B1\u03BD \u03B5\u03AF\u03BD\u03B1\u03B9 \u03C5\u03C8\u03B7\u03BB\u03CC (\u039C\u03C0\u03B1\u03C4\u03B1\u03C1\u03AF\u03B1...)",light:"\u03A6\u03C9\u03C4\u03B5\u03B9\u03BD\u03CC\u03C4\u03B7\u03C4\u03B1",temperature:"\u0398\u03B5\u03C1\u03BC\u03BF\u03BA\u03C1\u03B1\u03C3\u03AF\u03B1",humidity:"\u03A5\u03B3\u03C1\u03B1\u03C3\u03AF\u03B1",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"\u039C\u03B9\u03BA\u03C1\u03CC",medium:"\u039C\u03B5\u03C3\u03B1\u03AF\u03BF",large:"\u039C\u03B5\u03B3\u03AC\u03BB\u03BF"},layout:{horizontal:"\u039F\u03C1\u03B9\u03B6\u03CC\u03BD\u03C4\u03B9\u03B1 (\u03C0\u03C1\u03BF\u03B5\u03C0\u03B9\u03BB\u03BF\u03B3\u03AE)",vertical:"\u039A\u03B1\u03C4\u03B1\u03BA\u03CC\u03C1\u03C5\u03C6\u03B7"}}}},fi:{card:{msg:{entityError:"entiteetti: 'entity'-parametri on pakollinen!",entityNotFound:"Entiteetti\xE4 ei l\xF6ydy",attributeNotFound:"attribuutti: Attribuuttia ei l\xF6ydy HA:sta.",minValueError:"min_value: Tarkista minimiarvo.",maxValueError:"max_value: Tarkista maksimiarvo.",decimalError:"decimal: Arvo ei voi olla negatiivinen."}},editor:{title:{content:"Sis\xE4lt\xF6",interaction:"Vuorovaikutukset",theme:"Ulkoasu"},field:{entity:"Entiteetti",attribute:"Attribuutti",name:"Nimi",unit:"Yksikk\xF6",decimal:"desimaali",min_value:"Minimiarvo",max_value:"Maksimiarvo",max_value_attribute:"Attribuutti (max_value)",tap_action:"Toiminto lyhyell\xE4 napautuksella",double_tap_action:"Toiminto kahdella napautuksella",hold_action:"Toiminto pitk\xE4ll\xE4 painalluksella",icon_tap_action:"Toiminto kuvaketta napautettaessa",icon_double_tap_action:"Toiminto kahdella napautuksella kuvaketta",icon_hold_action:"Toiminto pitk\xE4ll\xE4 painalluksella kuvaketta",toggle_icon:"Ikoni",toggle_name:"Nimi",toggle_value:"Arvo",toggle_unit:"Yksikk\xF6",toggle_secondary_info:"Tiedot",toggle_progress_bar:"Palkki",toggle_force_circular_background:"Pakota py\xF6re\xE4 tausta",theme:"Teema",bar_size:"Palkin koko",bar_color:"Palkin v\xE4ri",icon:"Ikoni",color:"P\xE4\xE4v\xE4ri",layout:"Kortin asettelu"},option:{theme:{"":"",optimal_when_low:"Optimaalinen alhaisena (CPU, RAM...)",optimal_when_high:"Optimaalinen korkeana (Akku...)",light:"Valoisuus",temperature:"L\xE4mp\xF6tila",humidity:"Kosteus",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"Pieni",medium:"Keskikokoinen",large:"Suuri"},layout:{horizontal:"Vaakasuora (oletus)",vertical:"Pystysuora"}}}},ro:{card:{msg:{entityError:"entitate: Parametrul 'entity' este obligatoriu!",entityNotFound:"Entitatea nu a fost g\u0103sit\u0103",attributeNotFound:"atribut: Atributul nu a fost g\u0103sit \xEEn HA.",minValueError:"min_value: Verific\u0103 valoarea minim\u0103.",maxValueError:"max_value: Verific\u0103 valoarea maxim\u0103.",decimalError:"decimal: Aceast\u0103 valoare nu poate fi negativ\u0103."}},editor:{title:{content:"Con\u021Binut",interaction:"Interac\u021Biuni",theme:"Aspect & Stil"},field:{entity:"Entitate",attribute:"Atribut",name:"Nume",unit:"Unitate",decimal:"zecimal",min_value:"Valoare minim\u0103",max_value:"Valoare maxim\u0103",max_value_attribute:"Atribut (max_value)",tap_action:"Ac\u021Biune la ap\u0103sare scurt\u0103",double_tap_action:"Ac\u021Biune la ap\u0103sare dubl\u0103",hold_action:"Ac\u021Biune la ap\u0103sare lung\u0103",icon_tap_action:"Ac\u021Biune la ap\u0103sarea pictogramei",icon_double_tap_action:"Ac\u021Biune la ap\u0103sare dubl\u0103 a pictogramei",icon_hold_action:"Ac\u021Biune la ap\u0103sare lung\u0103 a pictogramei",toggle_icon:"Pictogram\u0103",toggle_name:"Nume",toggle_value:"Valoare",toggle_unit:"Unitate",toggle_secondary_info:"Info",toggle_progress_bar:"Bar\u0103",toggle_force_circular_background:"For\u021Beaz\u0103 fundal circular",theme:"Tem\u0103",bar_size:"Dimensiunea barei",bar_color:"Culoare bar\u0103",icon:"Pictogram\u0103",color:"Culoare principal\u0103",layout:"Aspectul cardului"},option:{theme:{"":"",optimal_when_low:"Optim c\xE2nd este sc\u0103zut (CPU, RAM...)",optimal_when_high:"Optim c\xE2nd este ridicat (Baterie...)",light:"Luminozitate",temperature:"Temperatur\u0103",humidity:"Umiditate",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"Mic",medium:"Mediu",large:"Mare"},layout:{horizontal:"Orizontal (implicit)",vertical:"Vertical"}}}},zh:{card:{msg:{entityError:"entity\uFF1A\u5FC5\u987B\u63D0\u4F9B 'entity' \u53C2\u6570\uFF01",entityNotFound:"\u672A\u627E\u5230\u5B9E\u4F53",attributeNotFound:"attribute\uFF1AHA \u4E2D\u672A\u627E\u5230\u8BE5\u5C5E\u6027\u3002",minValueError:"min_value\uFF1A\u8BF7\u68C0\u67E5\u6700\u5C0F\u503C\u3002",maxValueError:"max_value\uFF1A\u8BF7\u68C0\u67E5\u6700\u5927\u503C\u3002",decimalError:"decimal\uFF1A\u8BE5\u503C\u4E0D\u80FD\u4E3A\u8D1F\u6570\u3002"}},editor:{title:{content:"\u5185\u5BB9",interaction:"\u4EA4\u4E92",theme:"\u5916\u89C2"},field:{entity:"\u5B9E\u4F53",attribute:"\u5C5E\u6027",name:"\u540D\u79F0",unit:"\u5355\u4F4D",decimal:"\u5C0F\u6570",min_value:"\u6700\u5C0F\u503C",max_value:"\u6700\u5927\u503C",max_value_attribute:"\u5C5E\u6027\uFF08\u6700\u5927\u503C\uFF09",tap_action:"\u77ED\u6309\u65F6\u7684\u64CD\u4F5C",double_tap_action:"\u53CC\u51FB\u65F6\u7684\u64CD\u4F5C",hold_action:"\u957F\u6309\u65F6\u7684\u64CD\u4F5C",icon_tap_action:"\u70B9\u51FB\u56FE\u6807\u65F6\u7684\u64CD\u4F5C",icon_double_tap_action:"\u53CC\u51FB\u56FE\u6807\u65F6\u7684\u64CD\u4F5C",icon_hold_action:"\u957F\u6309\u56FE\u6807\u65F6\u7684\u64CD\u4F5C",toggle_icon:"\u56FE\u6807",toggle_name:"\u540D\u79F0",toggle_value:"\u6570\u503C",toggle_unit:"\u5355\u4F4D",toggle_secondary_info:"\u4FE1\u606F",toggle_progress_bar:"\u8FDB\u5EA6\u6761",toggle_force_circular_background:"\u5F3A\u5236\u5706\u5F62\u80CC\u666F",theme:"\u4E3B\u9898",bar_size:"\u6761\u5F62\u5927\u5C0F",bar_color:"\u6761\u5F62\u989C\u8272",icon:"\u56FE\u6807",color:"\u4E3B\u8272",layout:"\u5361\u7247\u5E03\u5C40"},option:{theme:{"":"",optimal_when_low:"\u4F4E\u503C\u6700\u4F73\uFF08CPU\u3001\u5185\u5B58\u7B49\uFF09",optimal_when_high:"\u9AD8\u503C\u6700\u4F73\uFF08\u7535\u6C60\u7B49\uFF09",light:"\u4EAE\u5EA6",temperature:"\u6E29\u5EA6",humidity:"\u6E7F\u5EA6",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"\u5C0F",medium:"\u4E2D",large:"\u5927"},layout:{horizontal:"\u6C34\u5E73\uFF08\u9ED8\u8BA4\uFF09",vertical:"\u5782\u76F4"}}}},ja:{card:{msg:{entityError:"entity\uFF1A\u300Centity\u300D\u30D1\u30E9\u30E1\u30FC\u30BF\u306F\u5FC5\u9808\u3067\u3059\uFF01",entityNotFound:"\u30A8\u30F3\u30C6\u30A3\u30C6\u30A3\u304C\u898B\u3064\u304B\u308A\u307E\u305B\u3093",attributeNotFound:"attribute\uFF1AHA \u306B\u5C5E\u6027\u304C\u898B\u3064\u304B\u308A\u307E\u305B\u3093\u3067\u3057\u305F\u3002",minValueError:"min_value\uFF1A\u6700\u5C0F\u5024\u3092\u78BA\u8A8D\u3057\u3066\u304F\u3060\u3055\u3044\u3002",maxValueError:"max_value\uFF1A\u6700\u5927\u5024\u3092\u78BA\u8A8D\u3057\u3066\u304F\u3060\u3055\u3044\u3002",decimalError:"decimal\uFF1A\u8CA0\u306E\u5024\u306F\u4F7F\u7528\u3067\u304D\u307E\u305B\u3093\u3002"}},editor:{title:{content:"\u30B3\u30F3\u30C6\u30F3\u30C4",interaction:"\u30A4\u30F3\u30BF\u30E9\u30AF\u30B7\u30E7\u30F3",theme:"\u5916\u89B3"},field:{entity:"\u30A8\u30F3\u30C6\u30A3\u30C6\u30A3",attribute:"\u5C5E\u6027",name:"\u540D\u524D",unit:"\u5358\u4F4D",decimal:"\u5C0F\u6570\u70B9",min_value:"\u6700\u5C0F\u5024",max_value:"\u6700\u5927\u5024",max_value_attribute:"\u5C5E\u6027\uFF08\u6700\u5927\u5024\uFF09",tap_action:"\u77ED\u304F\u30BF\u30C3\u30D7\u3057\u305F\u3068\u304D\u306E\u52D5\u4F5C",double_tap_action:"\u30C0\u30D6\u30EB\u30BF\u30C3\u30D7\u3057\u305F\u3068\u304D\u306E\u52D5\u4F5C",hold_action:"\u9577\u62BC\u3057\u3057\u305F\u3068\u304D\u306E\u52D5\u4F5C",icon_tap_action:"\u30A2\u30A4\u30B3\u30F3\u3092\u30BF\u30C3\u30D7\u3057\u305F\u3068\u304D\u306E\u52D5\u4F5C",icon_double_tap_action:"\u30A2\u30A4\u30B3\u30F3\u3092\u30C0\u30D6\u30EB\u30BF\u30C3\u30D7\u3057\u305F\u3068\u304D\u306E\u52D5\u4F5C",icon_hold_action:"\u30A2\u30A4\u30B3\u30F3\u3092\u9577\u62BC\u3057\u3057\u305F\u3068\u304D\u306E\u52D5\u4F5C",toggle_icon:"\u30A2\u30A4\u30B3\u30F3",toggle_name:"\u540D\u524D",toggle_value:"\u5024",toggle_unit:"\u5358\u4F4D",toggle_secondary_info:"\u60C5\u5831",toggle_progress_bar:"\u30D0\u30FC",toggle_force_circular_background:"\u5186\u5F62\u306E\u80CC\u666F\u3092\u5F37\u5236\u3059\u308B",theme:"\u30C6\u30FC\u30DE",bar_size:"\u30D0\u30FC\u30B5\u30A4\u30BA",bar_color:"\u30D0\u30FC\u306E\u8272",icon:"\u30A2\u30A4\u30B3\u30F3",color:"\u30E1\u30A4\u30F3\u30AB\u30E9\u30FC",layout:"\u30AB\u30FC\u30C9\u30EC\u30A4\u30A2\u30A6\u30C8"},option:{theme:{"":"",optimal_when_low:"\u4F4E\u3044\u6642\u304C\u6700\u9069\uFF08CPU\u3001RAM\u306A\u3069\uFF09",optimal_when_high:"\u9AD8\u3044\u6642\u304C\u6700\u9069\uFF08\u30D0\u30C3\u30C6\u30EA\u30FC\u306A\u3069\uFF09",light:"\u660E\u308B\u3055",temperature:"\u6E29\u5EA6",humidity:"\u6E7F\u5EA6",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"\u5C0F",medium:"\u4E2D",large:"\u5927"},layout:{horizontal:"\u6C34\u5E73\uFF08\u30C7\u30D5\u30A9\u30EB\u30C8\uFF09",vertical:"\u5782\u76F4"}}}},ko:{card:{msg:{entityError:"entity: 'entity' \uB9E4\uAC1C\uBCC0\uC218\uB294 \uD544\uC218\uC785\uB2C8\uB2E4!",entityNotFound:"\uC5D4\uD2F0\uD2F0\uB97C \uCC3E\uC744 \uC218 \uC5C6\uC2B5\uB2C8\uB2E4",attributeNotFound:"attribute: HA\uC5D0\uC11C \uC18D\uC131\uC744 \uCC3E\uC744 \uC218 \uC5C6\uC2B5\uB2C8\uB2E4.",minValueError:"min_value: \uCD5C\uC18C\uAC12\uC744 \uD655\uC778\uD558\uC138\uC694.",maxValueError:"max_value: \uCD5C\uB300\uAC12\uC744 \uD655\uC778\uD558\uC138\uC694.",decimalError:"decimal: \uC74C\uC218\uB294 \uD5C8\uC6A9\uB418\uC9C0 \uC54A\uC2B5\uB2C8\uB2E4."}},editor:{title:{content:"\uCF58\uD150\uCE20",interaction:"\uC0C1\uD638\uC791\uC6A9",theme:"\uD14C\uB9C8 \uBC0F \uC2A4\uD0C0\uC77C"},field:{entity:"\uC5D4\uD2F0\uD2F0",attribute:"\uC18D\uC131",name:"\uC774\uB984",unit:"\uB2E8\uC704",decimal:"\uC18C\uC218\uC810",min_value:"\uCD5C\uC18C\uAC12",max_value:"\uCD5C\uB300\uAC12",max_value_attribute:"\uC18D\uC131 (\uCD5C\uB300\uAC12)",tap_action:"\uC9E7\uAC8C \uD0ED \uC2DC \uB3D9\uC791",double_tap_action:"\uB354\uBE14 \uD0ED \uC2DC \uB3D9\uC791",hold_action:"\uAE38\uAC8C \uB204\uB97C \uC2DC \uB3D9\uC791",icon_tap_action:"\uC544\uC774\uCF58 \uD0ED \uC2DC \uB3D9\uC791",icon_double_tap_action:"\uC544\uC774\uCF58 \uB354\uBE14 \uD0ED \uC2DC \uB3D9\uC791",icon_hold_action:"\uC544\uC774\uCF58 \uAE38\uAC8C \uB204\uB97C \uC2DC \uB3D9\uC791",toggle_icon:"\uC544\uC774\uCF58",toggle_name:"\uC774\uB984",toggle_value:"\uAC12",toggle_unit:"\uB2E8\uC704",toggle_secondary_info:"\uC815\uBCF4",toggle_progress_bar:"\uC9C4\uD589 \uBC14",toggle_force_circular_background:"\uC6D0\uD615 \uBC30\uACBD \uAC15\uC81C \uC801\uC6A9",theme:"\uD14C\uB9C8",bar_size:"\uBC14 \uD06C\uAE30",bar_color:"\uBC14 \uC0C9\uC0C1",icon:"\uC544\uC774\uCF58",color:"\uAE30\uBCF8 \uC0C9\uC0C1",layout:"\uCE74\uB4DC \uB808\uC774\uC544\uC6C3"},option:{theme:{"":"",optimal_when_low:"\uB0AE\uC744 \uB54C \uCD5C\uC801 (CPU, RAM \uB4F1)",optimal_when_high:"\uB192\uC744 \uB54C \uCD5C\uC801 (\uBC30\uD130\uB9AC \uB4F1)",light:"\uC870\uB3C4",temperature:"\uC628\uB3C4",humidity:"\uC2B5\uB3C4",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"\uC791\uC74C",medium:"\uBCF4\uD1B5",large:"\uD07C"},layout:{horizontal:"\uC218\uD3C9 (\uAE30\uBCF8)",vertical:"\uC218\uC9C1"}}}},tr:{card:{msg:{entityError:"entity: 'entity' parametresi gereklidir!",entityNotFound:"Varl\u0131k bulunamad\u0131",attributeNotFound:"attribute: HA i\xE7inde \xF6znitelik bulunamad\u0131.",minValueError:"min_value: Minimum de\u011Feri kontrol edin.",maxValueError:"max_value: Maksimum de\u011Feri kontrol edin.",decimalError:"decimal: Bu de\u011Fer negatif olamaz."}},editor:{title:{content:"\u0130\xE7erik",interaction:"Etkile\u015Fimler",theme:"G\xF6r\xFCn\xFCm"},field:{entity:"Varl\u0131k",attribute:"\xD6znitelik",name:"Ad",unit:"Birim",decimal:"ondal\u0131k",min_value:"Minimum de\u011Fer",max_value:"Maksimum de\u011Fer",max_value_attribute:"\xD6znitelik (max_value)",tap_action:"K\u0131sa dokunma davran\u0131\u015F\u0131",double_tap_action:"\xC7ift dokunma davran\u0131\u015F\u0131",hold_action:"Uzun basma davran\u0131\u015F\u0131",icon_tap_action:"Simgeye dokunma davran\u0131\u015F\u0131",icon_double_tap_action:"Simgeye \xE7ift dokunma davran\u0131\u015F\u0131",icon_hold_action:"Simgeye uzun basma davran\u0131\u015F\u0131",toggle_icon:"Simge",toggle_name:"Ad",toggle_value:"De\u011Fer",toggle_unit:"Birim",toggle_secondary_info:"Bilgi",toggle_progress_bar:"\xC7ubuk",toggle_force_circular_background:"Dairesel arka plan\u0131 zorla",theme:"Tema",bar_size:"\xC7ubuk boyutu",bar_color:"\xC7ubuk rengi",icon:"Simge",color:"Birincil renk",layout:"Kart d\xFCzeni"},option:{theme:{"":"",optimal_when_low:"D\xFC\u015F\xFCkken en iyi (CPU, RAM...)",optimal_when_high:"Y\xFCksekken en iyi (Pil...)",light:"I\u015F\u0131k",temperature:"S\u0131cakl\u0131k",humidity:"Nem",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"K\xFC\xE7\xFCk",medium:"Orta",large:"B\xFCy\xFCk"},layout:{horizontal:"Yatay (varsay\u0131lan)",vertical:"Dikey"}}}},ar:{card:{msg:{entityError:"\u0627\u0644\u0643\u064A\u0627\u0646: \u0627\u0644\u0645\u0639\u0627\u0645\u0644 'entity' \u0645\u0637\u0644\u0648\u0628!",entityNotFound:"\u0644\u0645 \u064A\u062A\u0645 \u0627\u0644\u0639\u062B\u0648\u0631 \u0639\u0644\u0649 \u0627\u0644\u0643\u064A\u0627\u0646",attributeNotFound:"\u0627\u0644\u0633\u0645\u0629: \u0627\u0644\u0633\u0645\u0629 \u063A\u064A\u0631 \u0645\u0648\u062C\u0648\u062F\u0629 \u0641\u064A HA.",minValueError:"min_value: \u062A\u062D\u0642\u0642 \u0645\u0646 \u0627\u0644\u0642\u064A\u0645\u0629 \u0627\u0644\u062F\u0646\u064A\u0627.",maxValueError:"max_value: \u062A\u062D\u0642\u0642 \u0645\u0646 \u0627\u0644\u0642\u064A\u0645\u0629 \u0627\u0644\u0642\u0635\u0648\u0649.",decimalError:"decimal: \u0644\u0627 \u064A\u0645\u0643\u0646 \u0623\u0646 \u062A\u0643\u0648\u0646 \u0647\u0630\u0647 \u0627\u0644\u0642\u064A\u0645\u0629 \u0633\u0627\u0644\u0628\u0629."}},editor:{title:{content:"\u0627\u0644\u0645\u062D\u062A\u0648\u0649",interaction:"\u0627\u0644\u062A\u0641\u0627\u0639\u0644\u0627\u062A",theme:"\u0627\u0644\u0645\u0638\u0647\u0631"},field:{entity:"\u0627\u0644\u0643\u064A\u0627\u0646",attribute:"\u0627\u0644\u0633\u0645\u0629",name:"\u0627\u0644\u0627\u0633\u0645",unit:"\u0627\u0644\u0648\u062D\u062F\u0629",decimal:"\u0639\u0634\u0631\u064A",min_value:"\u0627\u0644\u0642\u064A\u0645\u0629 \u0627\u0644\u062F\u0646\u064A\u0627",max_value:"\u0627\u0644\u0642\u064A\u0645\u0629 \u0627\u0644\u0642\u0635\u0648\u0649",max_value_attribute:"\u0627\u0644\u0633\u0645\u0629 (max_value)",tap_action:"\u0627\u0644\u0625\u062C\u0631\u0627\u0621 \u0639\u0646\u062F \u0627\u0644\u0646\u0642\u0631 \u0627\u0644\u0642\u0635\u064A\u0631",double_tap_action:"\u0627\u0644\u0625\u062C\u0631\u0627\u0621 \u0639\u0646\u062F \u0627\u0644\u0646\u0642\u0631 \u0627\u0644\u0645\u0632\u062F\u0648\u062C",hold_action:"\u0627\u0644\u0625\u062C\u0631\u0627\u0621 \u0639\u0646\u062F \u0627\u0644\u0636\u063A\u0637 \u0627\u0644\u0645\u0637\u0648\u0644",icon_tap_action:"\u0627\u0644\u0625\u062C\u0631\u0627\u0621 \u0639\u0646\u062F \u0627\u0644\u0646\u0642\u0631 \u0639\u0644\u0649 \u0627\u0644\u0623\u064A\u0642\u0648\u0646\u0629",icon_double_tap_action:"\u0627\u0644\u0625\u062C\u0631\u0627\u0621 \u0639\u0646\u062F \u0627\u0644\u0646\u0642\u0631 \u0627\u0644\u0645\u0632\u062F\u0648\u062C \u0639\u0644\u0649 \u0627\u0644\u0623\u064A\u0642\u0648\u0646\u0629",icon_hold_action:"\u0627\u0644\u0625\u062C\u0631\u0627\u0621 \u0639\u0646\u062F \u0627\u0644\u0636\u063A\u0637 \u0627\u0644\u0645\u0637\u0648\u0644 \u0639\u0644\u0649 \u0627\u0644\u0623\u064A\u0642\u0648\u0646\u0629",toggle_icon:"\u0623\u064A\u0642\u0648\u0646\u0629",toggle_name:"\u0627\u0644\u0627\u0633\u0645",toggle_value:"\u0642\u064A\u0645\u0629",toggle_unit:"\u0627\u0644\u0648\u062D\u062F\u0629",toggle_secondary_info:"\u0645\u0639\u0644\u0648\u0645\u0627\u062A",toggle_progress_bar:"\u0634\u0631\u064A\u0637",toggle_force_circular_background:"\u0641\u0631\u0636 \u062E\u0644\u0641\u064A\u0629 \u062F\u0627\u0626\u0631\u064A\u0629",theme:"\u0627\u0644\u0633\u0645\u0629",bar_size:"\u062D\u062C\u0645 \u0627\u0644\u0634\u0631\u064A\u0637",bar_color:"\u0644\u0648\u0646 \u0627\u0644\u0634\u0631\u064A\u0637",icon:"\u0623\u064A\u0642\u0648\u0646\u0629",color:"\u0627\u0644\u0644\u0648\u0646 \u0627\u0644\u0623\u0633\u0627\u0633\u064A",layout:"\u062A\u062E\u0637\u064A\u0637 \u0627\u0644\u0628\u0637\u0627\u0642\u0629"},option:{theme:{"":"",optimal_when_low:"\u0645\u062B\u0627\u0644\u064A \u0639\u0646\u062F \u0627\u0644\u0627\u0646\u062E\u0641\u0627\u0636 (CPU\u060C RAM...)",optimal_when_high:"\u0645\u062B\u0627\u0644\u064A \u0639\u0646\u062F \u0627\u0644\u0627\u0631\u062A\u0641\u0627\u0639 (\u0627\u0644\u0628\u0637\u0627\u0631\u064A\u0629...)",light:"\u0627\u0644\u0636\u0648\u0621",temperature:"\u062F\u0631\u062C\u0629 \u0627\u0644\u062D\u0631\u0627\u0631\u0629",humidity:"\u0627\u0644\u0631\u0637\u0648\u0628\u0629",pm25:"PM2.5",voc:"VOC"},bar_size:{small:"\u0635\u063A\u064A\u0631",medium:"\u0645\u062A\u0648\u0633\u0637",large:"\u0643\u0628\u064A\u0631"},layout:{horizontal:"\u0623\u0641\u0642\u064A (\u0627\u0641\u062A\u0631\u0627\u0636\u064A)",vertical:"\u0631\u0623\u0633\u064A"}}}}},EDITOR_INPUT_FIELDS={basicConfiguration:{entity:{name:"entity",type:CARD.editor.fields.entity.type,width:"100%",isInGroup:null,schema:[{name:"entity",required:!0,selector:{entity:{}}}]},attribute:{name:"attribute",type:CARD.editor.fields.attribute.type,width:"100%",isInGroup:CARD.editor.keyMappings.attribute}},content:{title:{name:"content",icon:"mdi:text-short"},field:{name:{name:"name",type:CARD.editor.fields.default.type,width:"100%",isInGroup:null},unit:{name:"unit",type:CARD.editor.fields.default.type,width:"calc((100% - 20px) * 0.2)",isInGroup:null},decimal:{name:"decimal",type:CARD.editor.fields.number.type,width:"calc((100% - 20px) * 0.2)",isInGroup:null},min_value:{name:"min_value",type:CARD.editor.fields.number.type,width:"calc((100% - 20px) * 0.6)",isInGroup:null},max_value:{name:"max_value",type:CARD.editor.fields.default.type,width:"100%",isInGroup:null},max_value_attribute:{name:"max_value_attribute",type:CARD.editor.fields.max_value_attribute.type,width:"100%",isInGroup:CARD.editor.keyMappings.max_value_attribute}}},interaction:{title:{name:"interaction",icon:"mdi:gesture-tap-hold"},field:{tap_action:{name:"tap_action",type:CARD.editor.fields.tap_action.type,isInGroup:null,width:"100%",schema:[{name:"tap_action",selector:{"ui-action":{}}}]},hold_action:{name:"hold_action",type:CARD.editor.fields.tap_action.type,isInGroup:null,width:"100%",schema:[{name:"hold_action",selector:{"ui-action":{}}}]},double_tap_action:{name:"double_tap_action",type:CARD.editor.fields.double_tap_action.type,isInGroup:null,width:"100%",schema:[{name:"double_tap_action",selector:{"ui-action":{}}}]},icon_tap_action:{name:"icon_tap_action",type:CARD.editor.fields.icon_tap_action.type,isInGroup:null,width:"100%",schema:[{name:"icon_tap_action",selector:{"ui-action":{}}}]},icon_hold_action:{name:"icon_hold_action",type:CARD.editor.fields.icon_hold_action.type,isInGroup:null,width:"100%",schema:[{name:"icon_hold_action",selector:{"ui-action":{}}}]},icon_double_tap_action:{name:"icon_double_tap_action",type:CARD.editor.fields.icon_double_tap_action.type,isInGroup:null,width:"100%",schema:[{name:"icon_double_tap_action",selector:{"ui-action":{}}}]}}},theme:{title:{name:"theme",icon:"mdi:list-box"},field:{toggleIcon:{name:"toggle_icon",type:CARD.editor.fields.toggle.type,width:"100%",isInGroup:null},toggleName:{name:"toggle_name",type:CARD.editor.fields.toggle.type,width:"100%",isInGroup:null},toggleValue:{name:"toggle_value",type:CARD.editor.fields.toggle.type,width:"100%",isInGroup:null},toggleUnit:{name:"toggle_unit",type:CARD.editor.fields.toggle.type,width:"100%",isInGroup:null},toggleSecondaryInfo:{name:"toggle_secondary_info",type:CARD.editor.fields.toggle.type,width:"100%",isInGroup:null},toggleBar:{name:"toggle_progress_bar",type:CARD.editor.fields.toggle.type,width:"100%",isInGroup:null},toggleCircular:{name:"toggle_force_circular_background",type:CARD.editor.fields.toggle.type,width:"100%",isInGroup:null},theme:{name:"theme",type:CARD.editor.fields.theme.type,width:"100%",isInGroup:null},bar_size:{name:"bar_size",type:CARD.editor.fields.bar_size.type,width:"calc((100% - 10px) * 0.5)",isInGroup:null},bar_color:{name:"bar_color",type:CARD.editor.fields.color.type,width:"calc((100% - 10px) * 0.5)",isInGroup:CARD.editor.keyMappings.theme,schema:[{name:"bar_color",selector:{"ui-color":{}}}]},icon:{name:"icon",type:CARD.editor.fields.icon.type,width:"calc((100% - 10px) * 0.5)",isInGroup:null,schema:[{name:"icon",selector:{icon:{icon_set:["mdi"]}}}]},color:{name:"color",type:CARD.editor.fields.color.type,width:"calc((100% - 10px) * 0.5)",isInGroup:CARD.editor.keyMappings.theme,schema:[{name:"color",selector:{"ui-color":{}}}]},layout:{name:"layout",type:CARD.editor.fields.layout.type,width:"100%",isInGroup:null}}}},FIELD_OPTIONS={theme:[{value:"",icon:"mdi:cancel"},{value:"optimal_when_low",icon:"mdi:arrow-collapse-down"},{value:"optimal_when_high",icon:"mdi:arrow-collapse-up"},{value:"light",icon:"mdi:lightbulb"},{value:"temperature",icon:"mdi:thermometer"},{value:"humidity",icon:"mdi:water-percent"},{value:"pm25",icon:"mdi:air-filter"},{value:"voc",icon:"mdi:air-filter"}],bar_size:[{value:CARD.style.bar.sizeOptions.small.label,icon:CARD.style.bar.sizeOptions.small.mdi},{value:CARD.style.bar.sizeOptions.medium.label,icon:CARD.style.bar.sizeOptions.medium.mdi},{value:CARD.style.bar.sizeOptions.large.label,icon:CARD.style.bar.sizeOptions.large.mdi}],layout:[{value:CARD.layout.orientations.horizontal.label,icon:CARD.layout.orientations.horizontal.mdi},{value:CARD.layout.orientations.vertical.label,icon:CARD.layout.orientations.vertical.mdi}]},ATTRIBUTE_MAPPING={cover:{label:"cover",attribute:"current_position"},light:{label:"light",attribute:"brightness"},fan:{label:"fan",attribute:"percentage"}},CARD_CSS=`
:host {
  /* === SPACING VARIABLES === */
  --epb-gap-default: 10px;
  --epb-gap-entities: 16px;
  --epb-padding-default: 10px;
  
  /* === SIZE VARIABLES === */
  --epb-shape-default-size: 36px;
  --epb-icon-default-size: 24px;
  --epb-entities-shape-size: 40px;
  --epb-badge-size: 16px;
  --epb-badge-icon-size: 12px;
  --epb-badge-offset: -3px;
  --epb-progress-size-s: 8px;
  --epb-progress-size-m: 12px;
  --epb-progress-size-l: 16px;
  --epb-progress-size-xl: 42px;
  
  /* === HEIGHT VARIABLES === */
  --epb-name-height: 20px;
  --epb-detail-height: 16px;
  --epb-entities-height: 22.4px;
  --epb-entities-card-min-height: 44.8px;
  --epb-vertical-name-large-height: 18px;
  --epb-progress-container-height: 16px;
  
  /* === COLOR OPACITY VARIABLES === */
  --epb-shape-opacity: 20%;
  --epb-hover-opacity: 4%;
  --epb-active-opacity: 15%;
  --epb-icon-hover-opacity: 40%;
  --epb-card-hover-mix: 96%;
  --epb-card-active-mix: 85%;
  
  /* === TRANSITION VARIABLES === */
  --epb-progress-transition-width: 0.3s ease;
  --epb-click-transition-background: 0.5s ease;
  
  /* === TYPOGRAPHY VARIABLES === */
  --epb-letter-spacing-name: 0.1px;
  --epb-letter-spacing-detail: 0.4px;
  
  /* === LAYOUT VARIABLES === */
  --epb-detail-max-width: 60%;
  --epb-detail-min-width: 45px;
  --epb-vertical-gap: 1px;

}

 /* === BASE CARD STYLES === */
${CARD.htmlStructure.card.element} {
  height: var(${CARD.style.dynamic.card.height.var}, 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0 var(--epb-padding-default);
  margin: 0 auto;
  overflow: hidden;
  box-sizing: border-box;
  font-family: var(--ha-font-family-body);
  -moz-osx-font-smoothing: var(--ha-font-smoothing);
  -webkit-font-smoothing: antialiased;
  min-width: var(${CARD.style.dynamic.card.minWidth.var}, 100%);
}

/* type-picture-elements integration */

.type-picture-elements {
  min-width: var(${CARD.style.dynamic.card.minWidth.var}, 200px);
}

/* === FRAMELESS & ENTITIES STYLES === */
.type-entities,
.type-custom-vertical-stack-in-card,
.${CARD.style.dynamic.frameless.class} {
  background: transparent;
  border: none !important;
  box-shadow: none !important;
}

.type-entities {
  background: transparent !important;
  padding: 0 !important;
  margin: 0 !important;
  transition: none !important;
}

/* === MAIN CONTAINER === */
.${CARD.htmlStructure.sections.container.class} {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: var(--epb-gap-default);
  width: 100%;
  height: 100%;
  overflow: hidden;
}

.below-container {
  flex-basis: 100%;
  width: 100%;
  display: flex;
  overflow: hidden;
  height: var(--epb-progress-size-xl);
}

.horizontal.xlarge .right  {
  width: calc(100% - 56px);
}
.xlarge .progress-bar-container {
  height: var(--epb-progress-size-xl);
}

.horizontal.xlarge .container {
  flex-wrap: wrap;
  overflow: unset;
  row-gap: 7px;
}

.type-entities .${CARD.htmlStructure.sections.container.class} {
  gap: var(--epb-gap-entities);
  min-height: var(--epb-entities-card-min-height) !important;
}

/* === LAYOUT ORIENTATIONS === */
.${CARD.htmlStructure.sections.container.class} {
  height: var(${CARD.style.dynamic.card.height.var}, unset);
}

.${CARD.layout.orientations.vertical.label} .${CARD.htmlStructure.sections.container.class} {
  min-height: var(${CARD.style.dynamic.card.height.var}, ${CARD.layout.orientations.vertical.minHeight});
  flex-direction: column;
}

.${CARD.layout.orientations.horizontal.label} .${CARD.htmlStructure.sections.container.class} {
  min-height: var(${CARD.style.dynamic.card.height.var}, ${CARD.layout.orientations.horizontal.minHeight});
  flex-direction: row;
}

/* === LEFT SECTION (ICON & SHAPE) === */
.${CARD.htmlStructure.sections.left.class} {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  position: relative;
  width: var(--epb-shape-size, var(--epb-shape-default-size));
  height: var(--epb-shape-size, var(--epb-shape-default-size));
  flex-shrink: 0;
}

.type-entities .${CARD.htmlStructure.sections.left.class} {
  width: var(--epb-shape-size, var(--epb-entities-shape-size)) !important;
  height: var(--epb-shape-size, var(--epb-entities-shape-size)) !important;
}

/* === SHAPE & ICON === */
.${CARD.htmlStructure.elements.shape.class} {
  display: flex;
  align-items: center;
  justify-content: center;
  width: var(--epb-shape-size, var(--epb-shape-default-size));
  height: var(--epb-shape-size, var(--epb-shape-default-size));
  border-radius: 50%;
  background-color: color-mix(in srgb, var(${CARD.style.dynamic.iconAndShape.color.var}, ${CARD.style.dynamic.iconAndShape.color.default}) var(--epb-shape-opacity), transparent);
}

.${CARD.htmlStructure.elements.icon.class} {
  width: var(--epb-icon-size, var(--epb-icon-default-size));
  height: var(--epb-icon-size, var(--epb-icon-default-size));
  color: var(${CARD.style.dynamic.iconAndShape.color.var}, ${CARD.style.dynamic.iconAndShape.color.default});
}

.custom-icon-img {
  width: var(--epb-icon-size, var(--epb-icon-default-size));
  height: var(--epb-icon-size, var(--epb-icon-default-size));
  border-radius: 50%;
  object-fit: cover;
}  

/* === RIGHT SECTION (TEXT CONTENT) === */
.${CARD.htmlStructure.sections.right.class} {
  display: flex;
  flex-direction: column;
  justify-content: center;
  flex-grow: 1;
  flex-shrink: 1;
  min-width: 0;
  overflow: hidden;
  width: 100%;
}

/* === TEXT ELEMENTS === */

.${CARD.htmlStructure.elements.nameGroup.class},
.${CARD.htmlStructure.elements.detailGroup.class} {
  display: flex;
  align-items: center;
  min-width: 0;
  overflow: hidden;
}

.${CARD.htmlStructure.elements.nameGroup.class} {
  width: 100%;
  height: var(--epb-name-height);
  justify-content: flex-start;
}

.${CARD.htmlStructure.elements.detailGroup.class} {
  height: var(--epb-detail-height);
  line-height: var(--epb-detail-height);
  min-width: var(--epb-detail-min-width);
  max-width: var(--epb-detail-max-width);
  justify-content: flex-start;
}

/* === UNIFIED ELLIPSIS === */
.${CARD.htmlStructure.elements.nameCombined.class},
.${CARD.htmlStructure.elements.detailCombined.class} {
  flex: 1;
  min-width: 0;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  text-align: left;
}

.${CARD.htmlStructure.elements.nameCombined.class} {
  color: var(--primary-text-color);
  font-size: var(--ha-font-size-m);
  font-weight: var(--ha-font-weight-medium);
  height: var(--epb-name-height);
  line-height: var(--epb-name-height);
  letter-spacing: var(--epb-letter-spacing-name);
}

.${CARD.htmlStructure.elements.detailCombined.class} {
  color: var(--primary-text-color);
  font-size: var(--ha-font-size-s);
  font-weight: var(--ha-font-weight-body);
  height: var(--epb-detail-height);
  line-height: var(--epb-detail-height);
  vertical-align: middle;
  letter-spacing: var(--epb-letter-spacing-detail);
}

/* === ENTITIES TYPE SPECIFIC === */
.type-entities  :is(
  .${CARD.htmlStructure.elements.nameGroup.class},
  .${CARD.htmlStructure.elements.nameGroup.class} > span,
  .${CARD.htmlStructure.elements.detailGroup.class},
  .${CARD.htmlStructure.elements.detailGroup.class} > span
) {
  height: var(--epb-entities-height) !important;
}

.type-entities :is(
  .${CARD.htmlStructure.elements.nameCombined.class},
  .${CARD.htmlStructure.elements.detailCombined.class}
) {
  font-weight: var(--ha-font-weight-normal) !important;
  line-height: var(--ha-line-height-normal) !important;
}

.type-entities .${CARD.htmlStructure.elements.detailCombined.class} {
  color: var(--secondary-text-color) !important;
  font-size: var(--ha-font-size-m) !important;
}

/* === SECONDARY INFO === */
.${CARD.htmlStructure.elements.secondaryInfo.class} {
  display: flex;
  flex-direction: var(--epb-secondary-info-row-reverse, row);
  align-items: center;
  gap: var(--epb-gap-default);
}

.${CARD.layout.orientations.vertical.label} .${CARD.htmlStructure.elements.secondaryInfo.class} {
  flex-direction: column;
  align-items: stretch;
  width: 100%;
  min-width: 0;
  gap: unset;
}

.${CARD.layout.orientations.vertical.label} .${CARD.htmlStructure.sections.right.class} {
  gap: var(--epb-vertical-gap);
}

.multiline {
  display: inline-block;
  height: 16px;
  line-height: 0.95;
  font-size: 8px;
  margin: 0;
  padding: 0;
}

.secondary-info:has(.multiline),
.secondary-info:has(.multiline) * {
  height: 18px;
  font-size: 9px;
}

.vertical :is(
  .secondary-info:has(.multiline),
  .secondary-info:has(.multiline) .secondary-info-detail-group,
  .secondary-info:has(.multiline) .secondary-info-custom-info
) {
  height: unset !important;
}

.vertical .secondary-info:has(.multiline) .progress-bar-container {
  height: 16px;
}

/* === PROGRESS BAR === */
.${CARD.htmlStructure.elements.progressBar.container.class} {
  flex-grow: 1;
  height: var(--epb-progress-container-height);
  display: flex;
  justify-content: center;
  align-items: center;
}

.${CARD.layout.orientations.vertical.label} .${CARD.htmlStructure.elements.progressBar.container.class} {
  justify-content: center;
  align-items: center;
}

.${CARD.htmlStructure.elements.progressBar.bar.class} {
  width: 100%;
  background-color: var(${CARD.style.dynamic.progressBar.background.var}, var(--divider-color));
  overflow: hidden;
  position: relative;
}

.${CARD.layout.orientations.vertical.label} .${CARD.htmlStructure.elements.progressBar.bar.class}  {
  flex-grow: 0;
}

/* Progress bar size variants */

.${CARD.style.bar.sizeOptions.small.label} {
  --epb-progress-size: var(--epb-progress-size-s);
}

.${CARD.style.bar.sizeOptions.medium.label} {
  --epb-progress-size: var(--epb-progress-size-m);
}

.${CARD.style.bar.sizeOptions.large.label} {
  --epb-progress-size: var(--epb-progress-size-l);
}

.${CARD.style.bar.sizeOptions.xlarge.label} {
  --epb-progress-size: var(--epb-progress-size-xl);
}

.${CARD.htmlStructure.elements.progressBar.inner.class},
.${CARD.htmlStructure.elements.progressBar.positiveInner.class},
.${CARD.htmlStructure.elements.progressBar.negativeInner.class},
.${CARD.htmlStructure.elements.progressBar.bar.class} {
  height: var(--epb-progress-size);
  max-height: var(--epb-progress-size);
}

.${CARD.layout.orientations.vertical.label} .${CARD.htmlStructure.elements.progressBar.container.class} {
  height: var(--epb-progress-size); /* 8px */
}

.${CARD.layout.orientations.vertical.label} .${CARD.htmlStructure.sections.container.class} {
  padding-top: var(--epb-progress-size); /* center the content */
}

.${CARD.layout.orientations.vertical.label}.${CARD.style.bar.sizeOptions.xlarge.label} .${CARD.htmlStructure.elements.progressBar.container.class} {
  margin-top: 23px;
}

.${CARD.layout.orientations.vertical.label}.${CARD.style.bar.sizeOptions.xlarge.label} .${CARD.htmlStructure.sections.container.class} {
  padding-top: unset;
  justify-content: center;
  align-items: center;
}

.${CARD.style.dynamic.progressBar.orientation.rtl} .${CARD.htmlStructure.elements.progressBar.bar.class} {
  transform: scaleX(-1);
}

.${CARD.htmlStructure.elements.progressBar.inner.class},
.${CARD.htmlStructure.elements.progressBar.positiveInner.class},
.${CARD.htmlStructure.elements.progressBar.negativeInner.class} {
  background: var(${CARD.style.dynamic.progressBar.color.var}, ${CARD.style.dynamic.progressBar.color.default});
  transition: width var(--epb-progress-transition-width);
  will-change: width;
}

.${CARD.htmlStructure.elements.progressBar.inner.class} {
  width: var(${CARD.style.dynamic.progressBar.size.var}, ${CARD.style.dynamic.progressBar.size.default});
}

.${CARD.htmlStructure.elements.progressBar.negativeInner.class} {
  position: absolute;
  right: 50%;
  width: var(${CARD.style.dynamic.progressBar.nSize.var}, ${CARD.style.dynamic.progressBar.pSize.default});
  transform-origin: left;
}

.${CARD.htmlStructure.elements.progressBar.positiveInner.class} {
  position: absolute;
  left: 50%;
  width: var(${CARD.style.dynamic.progressBar.pSize.var}, ${CARD.style.dynamic.progressBar.nSize.default});
  transform-origin: right;
}

.${CARD.htmlStructure.elements.progressBar.bar.class},
.${CARD.style.dynamic.progressBar.effect.radius.class} .${CARD.htmlStructure.elements.progressBar.inner.class} {
  border-radius: calc(var(--epb-progress-size) / 2);
}

.${CARD.style.dynamic.progressBar.effect.glass.class} .${CARD.htmlStructure.elements.progressBar.inner.class} {
  background: linear-gradient(90deg, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0.1));
}

.${CARD.style.dynamic.progressBar.effect.gradient.class} .${CARD.htmlStructure.elements.progressBar.inner.class} {
  background: linear-gradient(
    90deg,
    color-mix(in srgb, white 40%, var(${CARD.style.dynamic.progressBar.color.var}, ${CARD.style.dynamic.progressBar.color.default})),
    var(${CARD.style.dynamic.progressBar.color.var}, ${CARD.style.dynamic.progressBar.color.default})
  );
} 

.${CARD.style.dynamic.progressBar.effect.shimmer.class} .${CARD.htmlStructure.elements.progressBar.inner.class} {
  overflow: hidden;
  position: relative;
}

.${CARD.style.dynamic.progressBar.effect.shimmer.class} .${CARD.htmlStructure.elements.progressBar.inner.class}::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
  animation: shimmer 2s infinite;
}

@keyframes shimmer {
    0% { transform: translateX(-100%); }
    100% { transform: translateX(100%); }
}

/* === WATERMARKS === */

:is(
  .${CARD.htmlStructure.elements.progressBar.zeroMark.class},
  .${CARD.htmlStructure.elements.progressBar.lowWatermark.class},
  .${CARD.htmlStructure.elements.progressBar.highWatermark.class}
) {
  position: absolute;
  height: var(--epb-progress-size);
  max-height: var(--epb-progress-size);
  top: 0;
  opacity: var(--epb-watermark-opacity-value, 0.8);
}

.${CARD.htmlStructure.elements.progressBar.zeroMark.class} {
  display: flex;
  width: 1px;
  background-color: white;
  left: 50%;
}

:is(
  .${CARD.htmlStructure.elements.progressBar.lowWatermark.class},
  .${CARD.htmlStructure.elements.progressBar.highWatermark.class}
) {
  display: none;
  max-width: 100%;
  box-sizing: border-box;
  clip-path: inset(0);
}

.${CARD.htmlStructure.elements.progressBar.lowWatermark.class} {
  background-color: var(--epb-low-watermark-color, var(--red-color));
}

.${CARD.htmlStructure.elements.progressBar.highWatermark.class} {
  background-color: var(--epb-high-watermark-color, var(--red-color));
}

/* Watermark area styles */
.${CARD.style.dynamic.show}-lwm-area-${CARD.htmlStructure.elements.progressBar.watermark.class} .${CARD.htmlStructure.elements.progressBar.lowWatermark.class} {
  left: 0;
  width: var(--epb-low-watermark-value, 20%);
}

.${CARD.style.dynamic.show}-hwm-area-${CARD.htmlStructure.elements.progressBar.watermark.class} .${CARD.htmlStructure.elements.progressBar.highWatermark.class} {
  right: 0;
  width: calc(100% - var(--epb-high-watermark-value, 80%));
}

/* Watermark blended styles */

.${CARD.style.dynamic.show}-lwm-blended-${CARD.htmlStructure.elements.progressBar.watermark.class} .${CARD.htmlStructure.elements.progressBar.lowWatermark.class} {
  left: 0;
  width: var(--epb-low-watermark-value, 20%);
  mix-blend-mode: hard-light;
}

.${CARD.style.dynamic.show}-hwm-blended-${CARD.htmlStructure.elements.progressBar.watermark.class} .${CARD.htmlStructure.elements.progressBar.highWatermark.class} {
  right: 0;
  width: calc(100% - var(--epb-high-watermark-value, 80%));
  mix-blend-mode: hard-light;
}

/* Watermark striped styles */
.${CARD.style.dynamic.show}-lwm-striped-${CARD.htmlStructure.elements.progressBar.watermark.class} .${CARD.htmlStructure.elements.progressBar.lowWatermark.class} {
  left: 0;
  width: var(--epb-low-watermark-value, 20%);
  background: repeating-linear-gradient( -45deg, var(--epb-low-watermark-color, var(--red-color)) 0px, var(--epb-low-watermark-color, var(--red-color)) 3px, transparent 3px, transparent 6px );
}

.${CARD.style.dynamic.show}-hwm-striped-${CARD.htmlStructure.elements.progressBar.watermark.class} .${CARD.htmlStructure.elements.progressBar.highWatermark.class} {
  right: 0;
  width: calc(100% - var(--epb-high-watermark-value, 80%));
  background: repeating-linear-gradient( -45deg, var(--epb-high-watermark-color, var(--red-color)) 0px, var(--epb-high-watermark-color, var(--red-color)) 3px, transparent 3px, transparent 6px );
}

/* Watermark line styles */
.${CARD.style.dynamic.show}-hwm-line-${CARD.htmlStructure.elements.progressBar.watermark.class} .${CARD.htmlStructure.elements.progressBar.highWatermark.class} {
  right: calc(100% - var(--epb-high-watermark-value, 80%) + var(--epb-watermark-line-size, 1px) / 2);
  width: var(--epb-watermark-line-size, 1px);
  height: 100%; /* Gardons 100% pour la ligne compl\xE8te */
  background-color: var(--epb-high-watermark-color, var(--red-color));
  top: 0;       /* Retour au top: 0 pour ligne compl\xE8te */
  transform: none; /* Pas de transform pour ligne compl\xE8te */
  border: none;
  position: absolute; /* Force le positionnement */
}

.${CARD.style.dynamic.show}-lwm-line-${CARD.htmlStructure.elements.progressBar.watermark.class} .${CARD.htmlStructure.elements.progressBar.lowWatermark.class} {
  left: calc(var(--epb-low-watermark-value, 20%) - var(--epb-watermark-line-size, 1px) / 2);
  width: var(--epb-watermark-line-size, 1px);
  height: 100%;
  background-color: var(--epb-low-watermark-color, var(--red-color));
  top: 0;
  transform: none;
  border: none;
  position: absolute;
}

/* Watermark round style */
.${CARD.style.dynamic.show}-hwm-round-${CARD.htmlStructure.elements.progressBar.watermark.class} .${CARD.htmlStructure.elements.progressBar.highWatermark.class} {
  right: calc(100% - var(--epb-high-watermark-value, 80%) + var(--epb-watermark-circle-size, 5px) / 2);
  width: var(--epb-watermark-circle-size, 5px);
  height: var(--epb-watermark-circle-size, 5px);
  background-color: var(--epb-high-watermark-color, var(--red-color));
  border-radius: 50%;
  top: 50%;
  transform: translateY(-50%);
  border: none;
}

.${CARD.style.dynamic.show}-lwm-round-${CARD.htmlStructure.elements.progressBar.watermark.class} .${CARD.htmlStructure.elements.progressBar.lowWatermark.class} {
  left: calc(var(--epb-low-watermark-value, 20%) - var(--epb-watermark-circle-size, 5px) / 2);
  width: var(--epb-watermark-circle-size, 5px);
  height: var(--epb-watermark-circle-size, 5px);
  background-color: var(--epb-low-watermark-color, var(--red-color));
  border-radius: 50%;
  top: 50%;
  transform: translateY(-50%);
  border: none;
}

/* Watermark triangle styles */
.${CARD.style.dynamic.show}-hwm-triangle-${CARD.htmlStructure.elements.progressBar.watermark.class} .${CARD.htmlStructure.elements.progressBar.highWatermark.class} {
  right: calc(100% - var(--epb-high-watermark-value, 80%) + var(--epb-watermark-triangle-size, 8px) / 2);
  width: 0;
  height: 0;
  background-color: transparent;
  border-left: calc(var(--epb-watermark-triangle-size, 8px) / 2) solid transparent;
  border-right: calc(var(--epb-watermark-triangle-size, 8px) / 2) solid transparent;
  border-top: var(--epb-watermark-triangle-size, 8px) solid var(--epb-high-watermark-color, var(--red-color));
  top: 0;
}

.${CARD.style.dynamic.show}-lwm-triangle-${CARD.htmlStructure.elements.progressBar.watermark.class} .${CARD.htmlStructure.elements.progressBar.lowWatermark.class} {
  left: calc(var(--epb-low-watermark-value, 20%) - var(--epb-watermark-triangle-size, 8px) / 2);
  width: 0;
  height: 0;
  background-color: transparent;
  border-left: calc(var(--epb-watermark-triangle-size, 8px) / 2) solid transparent;
  border-right: calc(var(--epb-watermark-triangle-size, 8px) / 2) solid transparent;
  border-top: var(--epb-watermark-triangle-size, 8px) solid var(--epb-low-watermark-color, var(--red-color));
  top: 0;
}

/* === VERTICAL LAYOUT ADJUSTMENTS === */
.${CARD.layout.orientations.vertical.label} .${CARD.htmlStructure.sections.right.class} {
  flex-grow: 0;
}

.${CARD.layout.orientations.vertical.label} :is(
  .${CARD.htmlStructure.elements.nameGroup.class},
  .${CARD.htmlStructure.elements.detailGroup.class}
) {
  flex-grow: 0;
  width: 100%;
  max-width: none;
  text-align: center;
  align-items: center;
  justify-content: center;
  min-width: 0;
  box-sizing: border-box;
}

.${CARD.layout.orientations.vertical.label} .${CARD.htmlStructure.elements.detailGroup.class} {
  max-width: 100%;
  overflow: hidden;
}
  
.${CARD.layout.orientations.vertical.label} .${CARD.style.bar.sizeOptions.large.label} .${CARD.htmlStructure.elements.nameGroup.class} {
  height: var(--epb-vertical-name-large-height);
}

:is(.${CARD.layout.orientations.horizontal.label}, .${CARD.layout.orientations.vertical.label}) 
  :is(.${CARD.htmlStructure.elements.nameGroup.class} > span, .${CARD.htmlStructure.elements.detailGroup.class} > span) {
  flex-shrink: 1;
  min-width: 0;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.${CARD.layout.orientations.vertical.label} :is(
  .${CARD.htmlStructure.elements.nameCombined.class},
  .${CARD.htmlStructure.elements.detailCombined.class}
) {
  text-align: center;
  width: 100%;
  display: block; /* Simplifie le layout vertical */
}

/* === BADGE === */
.${CARD.htmlStructure.elements.badge.container.class} {
  position: absolute;
  z-index: 2;
  top: var(--epb-badge-offset);
  right: var(--epb-badge-offset);
  inset-inline-end: var(--epb-badge-offset);
  inset-inline-start: initial;
  width: var(--epb-badge-size);
  height: var(--epb-badge-size);
  border-radius: 50%;
  background-color: var(${CARD.style.dynamic.badge.backgroundColor.var}, ${CARD.style.dynamic.badge.backgroundColor.default});
  display: none;
  align-items: center;
  justify-content: center;
}

.${CARD.htmlStructure.elements.badge.container.class} .${CARD.htmlStructure.elements.badge.icon.class} {
  width: var(--epb-badge-icon-size);
  height: var(--epb-badge-icon-size);
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(${CARD.style.dynamic.badge.color.var}, ${CARD.style.dynamic.badge.color.default});
}

/* === MARGINLESS === */

.${CARD.style.dynamic.marginless.class} .${CARD.htmlStructure.sections.container.class},
.${CARD.layout.orientations.vertical.label}.${CARD.style.dynamic.marginless.class} .${CARD.htmlStructure.sections.container.class},
.${CARD.layout.orientations.horizontal.label}.${CARD.style.dynamic.marginless.class} .${CARD.htmlStructure.sections.container.class} {
  min-height: unset;
  padding-top: unset;
}

.${CARD.layout.orientations.vertical.label}.${CARD.style.dynamic.marginless.class} .${CARD.htmlStructure.sections.left.class} {
  margin-top: unset;
}

/* === VISIBILITY CONTROLS === */
.${CARD.style.dynamic.hiddenComponent.icon.class} :is(.${CARD.htmlStructure.sections.left.class}, .${CARD.htmlStructure.elements.shape.class}),
.${CARD.style.dynamic.hiddenComponent.name.class} .${CARD.htmlStructure.elements.nameGroup.class},
.${CARD.style.dynamic.hiddenComponent.secondary_info.class} .${CARD.htmlStructure.elements.detailGroup.class},
.${CARD.style.dynamic.hiddenComponent.progress_bar.class} .${CARD.htmlStructure.elements.progressBar.bar.class} {
  display: none;
}

/* Shape transparency when hidden */
.${CARD.style.dynamic.hiddenComponent.shape.class} .${CARD.htmlStructure.elements.shape.class} {
  background-color: transparent;
}

/* Show elements when needed */
.${CARD.style.dynamic.show}-${CARD.htmlStructure.elements.badge.container.class} .${CARD.htmlStructure.elements.badge.container.class},
[class*="${CARD.style.dynamic.show}-hwm-"] .${CARD.htmlStructure.elements.progressBar.highWatermark.class},
[class*="${CARD.style.dynamic.show}-lwm-"] .${CARD.htmlStructure.elements.progressBar.lowWatermark.class} {
  display: flex;
}

/* === INTERACTIVE STATES === */
.${CARD.style.dynamic.clickable.card}:hover,
.${CARD.style.dynamic.clickable.icon} .${CARD.htmlStructure.sections.left.class}:hover {
  cursor: pointer;
  background-color: color-mix(in srgb, var(--card-background-color) var(--epb-card-hover-mix), var(${CARD.style.dynamic.iconAndShape.color.var}, ${CARD.style.dynamic.iconAndShape.color.default}) var(--epb-hover-opacity));
}

.${CARD.style.dynamic.clickable.card}:active {
  background-color: color-mix(in srgb, var(--card-background-color) var(--epb-card-active-mix), var(${CARD.style.dynamic.iconAndShape.color.var}, ${CARD.style.dynamic.iconAndShape.color.default}) var(--epb-active-opacity));
  transition: background-color var(--epb-click-transition-background);
}

.${CARD.style.dynamic.clickable.icon} .${CARD.htmlStructure.sections.left.class}:hover .${CARD.htmlStructure.elements.shape.class} {
  background-color: color-mix(in srgb, var(${CARD.style.dynamic.iconAndShape.color.var}, ${CARD.style.dynamic.iconAndShape.color.default}) var(--epb-icon-hover-opacity), transparent);
}
`,CARD_EDITOR_CSS=`
 :host {
   --accordion-padding: 18px;
   --accordion-gap: 10px;
   --border-radius: 6px;
   --transition-duration: 0.2s;
   --transition-easing: cubic-bezier(0.33, 0, 0.2, 1);
   --icon-size: 20px;
   --button-size: 48px;
   --small-icon-size: 24px;
 }
 
 /* Container principal */
 .${CARD.editor.fields.container.class} {
   display: flex;
   flex-direction: column;
   gap: 25px;
   padding-bottom: 70px;
 }
 
 /* Ic\xF4nes communes */
 .${CARD.editor.fields.iconItem.class},
 .${CARD.editor.fields.accordion.icon.class} {
   margin-right: 8px;
   color: var(--secondary-text-color);
 }
 
 .${CARD.editor.fields.iconItem.class} {
   width: var(--icon-size);
   height: var(--icon-size);
 }
 
 /* Documentation */
 .${CARD.documentation.link.class} {
   position: absolute;
   top: 0;
   right: 0;
   z-index: 600;
   text-decoration: none;
   display: flex;
 }
 
 .${CARD.documentation.shape.class} {
   width: var(--button-size);
   height: var(--button-size);
   display: flex;
   align-items: center;
   justify-content: center;
   border-radius: 50%;
   cursor: pointer;
   transition: background-color var(--transition-duration) ease;
 }
 
 .${CARD.documentation.shape.class}:hover {
   background-color: color-mix(in srgb, var(--card-background-color) 90%, var(--secondary-text-color) 10%);
 }
 
 .${CARD.documentation.questionMark.class} {
   color: var(--primary-text-color);
 }
 
 /* Accord\xE9on */
 .${CARD.editor.fields.accordion.item.class} {
   display: block;
   width: 100%;
   border: 1px solid color-mix(in srgb, var(--card-background-color) 80%, var(--secondary-text-color) 20%);
   border-radius: var(--border-radius);
   overflow: visible;
 }
 
 .${CARD.editor.fields.accordion.title.class} {
   display: flex;
   align-items: center;
   gap: var(--accordion-gap);
   position: relative;
   background-color: transparent;
   color: var(--primary-text-color);
   cursor: pointer;
   padding: var(--accordion-padding);
   width: 100%;
   height: var(--button-size);
   border: none;
   text-align: left;
   font-size: 15px;
   transition: background-color 0.4s ease;
 }
 
 .${CARD.editor.fields.accordion.title.class}:focus {
   background-color: var(--secondary-background-color);
 }
 
 .${CARD.editor.fields.accordion.arrow.class} {
   display: inline-block;
   width: var(--small-icon-size);
   height: var(--small-icon-size);
   margin-left: auto;
   color: var(--primary-text-color);
   transition: transform var(--transition-duration) ease-out;
 }
 
 .accordion.expanded .${CARD.editor.fields.accordion.arrow.class} {
   transform: rotate(180deg);
 }
 
 .${CARD.editor.fields.accordion.content.class} {
   display: flex;
   flex-direction: row;
   flex-wrap: wrap;
   align-content: flex-start;
   column-gap: var(--accordion-gap);
   row-gap: 20px;
   padding: 0 var(--accordion-padding);
   background-color: transparent;
   max-height: 0;
   opacity: 0;
   overflow: hidden;
   transition: 
     max-height var(--transition-duration) var(--transition-easing),
     padding var(--transition-duration) var(--transition-easing),
     opacity var(--transition-duration) ease;
 }
 
 .accordion.expanded .${CARD.editor.fields.accordion.content.class} {
   /* max-height: d\xE9fini par script JS */
   padding-top: 30px;
   padding-bottom: 30px;
   opacity: 1;
   overflow: visible;
 }
 
 /* Animation des \xE9l\xE9ments enfants de l'accord\xE9on */
 .${CARD.editor.fields.accordion.content.class} > * {
   opacity: 0;
   transition: opacity var(--transition-duration) ease 0.15s;
 }
 
 .accordion.expanded .${CARD.editor.fields.accordion.content.class} > * {
   opacity: 1;
 }
 
 .accordion.collapsing .${CARD.editor.fields.accordion.content.class} > * {
   opacity: 0 !important;
   transition: opacity 0.1s ease; /* Transition rapide pendant le repli */
 }
 
 /* S\xE9lecteur ha-select */
 ha-select {
   --mdc-menu-max-height: 250px;
 }
 
 /* Classes show/hide optimis\xE9es */
 .${CARD.style.dynamic.hide}-${CARD.editor.keyMappings.attribute} .${CARD.editor.keyMappings.attribute},
 .${CARD.style.dynamic.hide}-${CARD.editor.keyMappings.max_value_attribute} .${CARD.editor.keyMappings.max_value_attribute},
 .${CARD.style.dynamic.hide}-${CARD.editor.keyMappings.theme} .${CARD.editor.keyMappings.theme} {
   display: none;
 }
 
 /* Toggle corrig\xE9 */
 .${CARD.editor.fields.toggle.class} {
   display: flex;
   align-items: center; /* Correction du typo */
   gap: 8px;
 }
 `;CARD.config.dev&&(CARD.meta.card.typeName=`${CARD.meta.card.typeName}-dev`,CARD.meta.card.name=`${CARD.meta.card.typeName} (dev)`,CARD.meta.card.editor=`${CARD.meta.card.editor}-dev`,CARD.meta.template.typeName=`${CARD.meta.template.typeName}-dev`,CARD.meta.template.name=`${CARD.meta.template.typeName} (dev)`,CARD.meta.badge.typeName=`${CARD.meta.badge.typeName}-dev`,CARD.meta.badge.editor=`${CARD.meta.badge.editor}-dev`);const is={nullish:r=>r==null,boolean:r=>typeof r=="boolean",string:r=>typeof r=="string",nonEmptyString:r=>typeof r=="string"&&r.trim()!=="",nullishOrEmptyString:r=>r==null||typeof r=="string"&&r.trim()==="",numericString:r=>typeof r=="string"&&r.trim()!==""&&!isNaN(parseFloat(r)),number:r=>Number.isFinite(r),func:r=>typeof r=="function",array:r=>Array.isArray(r),nonEmptyArray:r=>Array.isArray(r)&&r.length>0,nonEmptySet:r=>r instanceof Set&&r.size>0,jinja:r=>typeof r!="string"?!1:/({{.*?}}|{#.*?#}|{%.+?%})/s.test(r)},has={own:(r,e)=>Object.hasOwn(r,e),method:(r,e)=>typeof r?.[e]=="function",validKey:(r,e)=>typeof e=="string"&&e!==""&&has.own(r,e)};class RegistrationHelper{static#e={customCards:"customCards",customBadges:"customBadges"};static#t(e,t){window[t]=window[t]||[],window[t].push({type:e.typeName,name:e.name,preview:!0,description:e.description})}static registerCard(e){RegistrationHelper.#t(e,RegistrationHelper.#e.customCards)}static registerBadge(e){RegistrationHelper.#t(e,RegistrationHelper.#e.customBadges)}}const Element=(r,e="")=>{const t=`${r.class} ${e}`.trim();return{tag:r.element,class:t,html:(i="",a="")=>`<${r.element} class="${t}" ${a}>${i}</${r.element}>`}},StructureElements={container:()=>Element(CARD.htmlStructure.sections.container).html("{{content}}"),belowContainer:()=>Element(CARD.htmlStructure.sections.belowContainer).html("{{content}}"),left:()=>Element(CARD.htmlStructure.sections.left).html("{{content}}"),iconAndShape:()=>Element(CARD.htmlStructure.elements.shape).html(Element(CARD.htmlStructure.elements.icon).html()),badge:()=>Element(CARD.htmlStructure.elements.badge.container).html(Element(CARD.htmlStructure.elements.badge.icon).html()),right:()=>Element(CARD.htmlStructure.sections.right).html("{{content}}"),nameGroup:()=>Element(CARD.htmlStructure.elements.nameGroup).html(Element(CARD.htmlStructure.elements.nameCombined).html(Element(CARD.htmlStructure.elements.name).html()+Element(CARD.htmlStructure.elements.nameCustomInfo).html())),nameGroupMinimal:()=>Element(CARD.htmlStructure.elements.nameGroup).html(Element(CARD.htmlStructure.elements.nameCombined).html(Element(CARD.htmlStructure.elements.name).html())),detailGroup:()=>Element(CARD.htmlStructure.elements.detailGroup).html(Element(CARD.htmlStructure.elements.detailCombined).html(Element(CARD.htmlStructure.elements.customInfo).html()+Element(CARD.htmlStructure.elements.stateAndProgressInfo).html())),detailGroupMinimal:()=>Element(CARD.htmlStructure.elements.detailGroup).html(Element(CARD.htmlStructure.elements.detailCombined).html(Element(CARD.htmlStructure.elements.customInfo).html())),standardProgressBar:()=>Element(CARD.htmlStructure.elements.progressBar.container).html(Element(CARD.htmlStructure.elements.progressBar.bar,"default").html(Element(CARD.htmlStructure.elements.progressBar.inner).html()+Element(CARD.htmlStructure.elements.progressBar.lowWatermark).html()+Element(CARD.htmlStructure.elements.progressBar.highWatermark).html())),centerZeroProgressBar:()=>Element(CARD.htmlStructure.elements.progressBar.container).html(Element(CARD.htmlStructure.elements.progressBar.bar,"center-zero").html(Element(CARD.htmlStructure.elements.progressBar.negativeInner).html()+Element(CARD.htmlStructure.elements.progressBar.positiveInner).html()+Element(CARD.htmlStructure.elements.progressBar.lowWatermark).html()+Element(CARD.htmlStructure.elements.progressBar.highWatermark).html()+Element(CARD.htmlStructure.elements.progressBar.zeroMark).html())),progressBar:r=>{switch(r.barType){case"centerZero":return StructureElements.centerZeroProgressBar();case"default":default:return StructureElements.standardProgressBar()}},secondaryInfo:r=>r.layout==="vertical"?Element(CARD.htmlStructure.elements.secondaryInfo).html(StructureElements.detailGroup())+StructureElements.progressBar(r):r.barPosition==="below"?Element(CARD.htmlStructure.elements.secondaryInfo).html(StructureElements.detailGroup()):Element(CARD.htmlStructure.elements.secondaryInfo).html(StructureElements.detailGroup()+StructureElements.progressBar(r)),secondaryInfoMinimal:r=>r.layout==="vertical"?Element(CARD.htmlStructure.elements.secondaryInfo).html(StructureElements.detailGroupMinimal())+StructureElements.progressBar(r):r.barPosition==="below"?Element(CARD.htmlStructure.elements.secondaryInfo).html(StructureElements.detailGroupMinimal()):Element(CARD.htmlStructure.elements.secondaryInfo).html(StructureElements.detailGroupMinimal()+StructureElements.progressBar(r)),rightFull:r=>Element(CARD.htmlStructure.sections.right).html(StructureElements.nameGroup()+StructureElements.secondaryInfo(r)),rightMinimal:r=>Element(CARD.htmlStructure.sections.right).html(StructureElements.nameGroupMinimal()+StructureElements.secondaryInfoMinimal(r)),leftFull:()=>Element(CARD.htmlStructure.sections.left).html(StructureElements.iconAndShape()+StructureElements.badge()),leftNoBadge:()=>Element(CARD.htmlStructure.sections.left).html(StructureElements.iconAndShape())},StructureTemplates={card:(r={})=>r.barPosition==="below"?StructureElements.container().replace("{{content}}",StructureElements.leftFull()+StructureElements.rightFull(r)+StructureElements.belowContainer().replace("{{content}}",StructureElements.progressBar(r))):StructureElements.container().replace("{{content}}",StructureElements.leftFull()+StructureElements.rightFull(r)),badge:(r={})=>StructureElements.container().replace("{{content}}",StructureElements.leftNoBadge()+StructureElements.rightFull(r)),template:(r={})=>r.barPosition==="below"?StructureElements.container().replace("{{content}}",StructureElements.leftFull()+StructureElements.rightMinimal(r)+StructureElements.belowContainer().replace("{{content}}",StructureElements.progressBar(r))):StructureElements.container().replace("{{content}}",StructureElements.leftFull()+StructureElements.rightMinimal(r))};class ObjStructure{_options={};_cardType="card";get options(){return this._options}set options(e){this._options=e}get innerHTML(){return StructureTemplates[this._cardType](this.options)}}class CardStructure extends ObjStructure{_cardType="card"}class BadgeStructure extends ObjStructure{_cardType="badge"}class TemplateStructure extends ObjStructure{_cardType="template"}class NumberFormatter{static unitsNoSpace={"fr-FR":new Set(["j","d","h","min","ms","\u03BCs","\xB0"]),"de-DE":new Set(["d","h","min","ms","\u03BCs","\xB0"]),"en-US":new Set(["d","h","min","ms","\u03BCs","\xB0","%"])};static getSpaceCharacter(e,t){return(NumberFormatter.unitsNoSpace[e]||NumberFormatter.unitsNoSpace["en-US"]).has(t.toLowerCase())?"":CARD.config.unit.space}static formatValueAndUnit(e,t=2,i="",a="en-US",n=CARD.config.unit.unitSpacing.auto){if(is.nullish(e))return"";const o=new Intl.NumberFormat(a,{minimumFractionDigits:t,maximumFractionDigits:t,useGrouping:a!=="en"}).format(e);if(!i)return o;const l={space:CARD.config.unit.space,"no-space":"",auto:()=>NumberFormatter.getSpaceCharacter(a,i)},s=has.method(l,n)?l[n]():l[n];return`${o}${s}${i}`}static formatTiming(e,t=0,i="en-US",a=!1,n=CARD.config.unit.unitSpacing.auto){const o=Math.floor(e/3600),l=Math.floor(e%3600/60);let s=(e%60).toFixed(t);const c=(h,m=2)=>String(h).padStart(m,"0"),[u,d]=s.split(".");if(s=d!==void 0?`${c(u)}.${d}`:c(s),a){if(e<60)return NumberFormatter.formatValueAndUnit(parseFloat(s),t,"s",i,n);if(e<3600)return`${c(l)}:${s}`}return[c(o),c(l),s].join(":")}static durationToSeconds(e,t){switch(t){case"d":return e*86400;case"h":return e*3600;case"min":return e*60;case"s":return e;case"ms":return e*.001;case"\u03BCs":return e*1e-6;default:throw new Error("Unknown case")}}static convertDuration(e){const t=e.split(":").map(Number),[i,a,n]=t;return(i*3600+a*60+n)*CARD.config.msFactor}}class ValueHelper{#e=null;#t=!1;#i=null;constructor(e=null){ValueHelper.#a(e)&&(this.#i=e)}set value(e){this.#t=ValueHelper.#a(e),this.#e=this.#t?e:null}get value(){return this.#t?this.#e:this.#i}get isValid(){return this.#t}static#a(e){return Number.isFinite(e)}}class DecimalHelper{#e=CARD.config.decimal.percentage;#t=!1;#i=null;constructor(e=null){DecimalHelper.#a(e)&&(this.#i=e)}set value(e){this.#t=DecimalHelper.#a(e),this.#e=this.#t?e:null}get value(){return this.#t?this.#e:this.#i}get isValid(){return this.#t}static#a(e){return Number.isInteger(e)&&e>=0}}class UnitHelper{#e=CARD.config.unit.default;#t=!1;set value(e){this.#e=e.trim()??CARD.config.unit.default}get value(){return this.#t?"":this.#e}set isDisabled(e){this.#t=is.boolean(e)?e:!1}get isDisabled(){return this.#t}get isTimerUnit(){return this.#e.toLowerCase()===CARD.config.unit.timer}get isFlexTimerUnit(){return this.#e.toLowerCase()===CARD.config.unit.flexTimer}toString(){return this.#t?"":this.#e}}class PercentHelper{#e=null;#t=new ValueHelper(CARD.config.value.min);#i=new ValueHelper(CARD.config.value.max);#a=new ValueHelper(0);#r=new UnitHelper;#n=new DecimalHelper(CARD.config.decimal.percentage);#s=0;#o=!1;#u=!1;#l=!1;unitSpacing=CARD.config.unit.unitSpacing.auto;constructor(){this.#e=HassProviderSingleton.getInstance()}set isTimer(e){this.#o=is.boolean(e)?e:!1}get isTimer(){return this.#o}set isReversed(e){this.#u=is.boolean(e)?e:CARD.config.reverse}get isReversed(){return this.#u}set min(e){this.#t.value=e}get min(){return this.#t.value}set max(e){this.#i.value=e}get max(){return this.#i.value}set current(e){this.#a.value=e}get current(){return this.#a.value}get actual(){return this.#u?this.max-this.current:this.current}get unit(){return this.#r.value}set unit(e){this.#r.value=e??""}set hasDisabledUnit(e){this.#r.isDisabled=e}get hasDisabledUnit(){return this.#r.isDisabled}set decimal(e){this.#n.value=e}get decimal(){return this.#n.value}get isValid(){return this.range!==0}get range(){return this.isCenterZero?this.current>=0?this.max:-this.min:this.max-this.min}get correctedValue(){return this.isCenterZero?this.current:this.actual-this.min}get percent(){return this.isValid?this.#s:null}get hasTimerUnit(){return this.#o&&this.#r.isTimerUnit}get hasFlexTimerUnit(){return this.#o&&this.#r.isFlexTimerUnit}get hasTimerOrFlexTimerUnit(){return this.hasTimerUnit||this.hasFlexTimerUnit}get processedValue(){return this.unit===CARD.config.unit.default?this.percent:this.actual}set isCenterZero(e){this.#l=is.boolean(e)?e:!1}get isCenterZero(){return this.#l}valueForThemes(e,t){let i=this.actual;return e?i:(this.unit===CARD.config.unit.fahrenheit&&(i=(i-32)*5/9),t||[CARD.config.unit.default,CARD.config.unit.disable].includes(this.unit)?this.percent:i)}refresh(){this.#s=this.isValid?Number((this.correctedValue/this.range*100).toFixed(this.decimal)):0}calcWatermark(e){return[CARD.config.unit.default,CARD.config.unit.disable].includes(this.unit)?e:(e-this.min)/this.range*100}toString(){if(this.isValid){if(this.hasTimerOrFlexTimerUnit)return NumberFormatter.formatTiming(this.actual,this.decimal,this.#e.numberFormat,this.hasFlexTimerUnit,this.unitSpacing)}else return"Div0";return NumberFormatter.formatValueAndUnit(this.processedValue,this.decimal,this.unit,this.#e.numberFormat,this.unitSpacing)}}class ThemeManager{#e=null;#t=null;#i=null;#a=null;#r=0;#n=!1;#s=!1;#o=!1;#u=!1;#l=null;set theme(e){if(e={battery:"optimal_when_high",memory:"optimal_when_low",cpu:"optimal_when_low"}[e]||e,!has.validKey(THEME,e)){[this.#t,this.#a,this.#i,this.#e]=[null,null,null,null];return}this.#n=!0,this.#e=e,this.#l=THEME[e].style,this.#s=THEME[e].linear,this.#o=THEME[e].percent}get theme(){return this.#e}set customTheme(e){ThemeManager.#m(e)&&(this.#e=CARD.theme.default,this.#l=e,this.#n=!0,this.#s=!1,this.#u=!0)}get customTheme(){return this.#l}get isLinear(){return this.#s}get isBasedOnPercentage(){return this.#o}get isCustomTheme(){return this.#u}get isValid(){return this.#n}set value(e){this.#r=e,this.#d()}get value(){return this.#r}get icon(){return this.#t}get iconColor(){return this.#i}get barColor(){return this.#a}#d(){if(!this.#n)return;(this.isLinear?this.#c:this.#h).call(this)}#c(){const e=this.#l.length-1,t=CARD.config.value.max/e,i=Math.max(0,Math.min(this.#r,CARD.config.value.max)),a=this.#l[Math.floor(i/t)];this.#t=a.icon,this.#i=a.color,this.#a=a.color}#h(){let e=null;this.#r>=this.#l[this.#l.length-1].max?e=this.#l[this.#l.length-1]:this.#r<this.#l[0].min?e=this.#l[0]:e=this.#l.find(t=>this.#r>=t.min&&this.#r<t.max),e&&(this.#t=e.icon||null,this.#i=e.icon_color||e.color||null,this.#a=e.bar_color||e.color||null)}static#m(e){if(!is.nonEmptyArray(e))return!1;let t=!0,i=null;return e.every(a=>a===null||typeof a!="object"||!CARD.theme.customTheme.expectedKeys.every(n=>n in a)||!CARD.theme.customTheme.colorKeys.some(n=>n in a)||a.min>=a.max||!t&&a.min!==i?!1:(t=!1,i=a.max,!0))}static adaptColor(e){return e==null?null:DEF_COLORS.has(e)?`var(--${e}-color)`:e}}class HassProviderSingleton{static#e=null;static#t=!1;#i=null;#a=!1;constructor(){if(!HassProviderSingleton.#t)throw new Error("Use HassProviderSingleton.getInstance() instead of new.");HassProviderSingleton.#t=!1}set hass(e){e&&(this.#i=e,this.#a=!0)}get hass(){return this.#i}get isValid(){return this.#a}get systemLanguage(){return this.#i?.config?.language in LANGUAGES?this.#i.config.language:CARD.config.language}get language(){return this.#i?.language in LANGUAGES?this.#i.language:CARD.config.language}get numberFormat(){const e=this.#i?.locale?.number_format;return e&&{decimal_comma:"de-DE",comma_decimal:"en-US",space_comma:"fr-FR",language:CARD.config.languageMap[this.language],system:Intl.NumberFormat().resolvedOptions().locale,none:"en"}[e]||CARD.config.languageMap[CARD.config.language]}get version(){return this.#i?.config?.version??null}get hasNewShapeStrategy(){const[e,t]=(this.version??"0.0").split(".").map(Number);return e>2025||e===2025&&t>=3}static getInstance(){return HassProviderSingleton.#e||(HassProviderSingleton.#t=!0,HassProviderSingleton.#e=new HassProviderSingleton),HassProviderSingleton.#e}getEntityStateObj(e){return this.#i?.states?.[e]??null}getEntityStateValue(e){return this.getEntityStateObj(e)?.state??null}getEntityAttribute(e,t){if(!t)return;const i=this.getEntityStateObj(e)?.attributes;return i&&t in i?i[t]:void 0}hasEntity(e){return e in(this.#i?.states||{})}isEntityAvailable(e){const t=this.getEntityStateObj(e)?.state;return t!=="unavailable"&&t!=="unknown"}static getEntityDomain(e){return is.string(e)&&e.includes(".")?e.split(".")[0]:null}getDeviceClass(e){return this.getEntityAttribute(e,"device_class")??null}getEntityName(e){return this.getEntityAttribute(e,"friendly_name")??null}getEntityIcon(e){return this.getEntityAttribute(e,"icon")??null}getFormatedEntityState(e){const t=this.getEntityStateObj(e);return t?this.#i?.formatEntityState?.(t):LANGUAGES[this.language].card.msg.entityNotFound}getFormatedEntityAttributeName(e,t){const i=this.getEntityStateObj(e);return this.#i?.formatEntityAttributeName?.(i,t)??""}getFormatedAttributeValue(e,t){const i=this.getEntityStateObj(e);return this.#i?.formatEntityAttributeValue?.(i,t)??""}getTimerFinishAt(e){return this.getEntityAttribute(e,"finishes_at")??null}getTimerDuration(e){return this.getEntityAttribute(e,"duration")??null}getTimerRemaining(e){return this.getEntityAttribute(e,"remaining")??null}getUnit(e){return this.getEntityAttribute(e,"unit_of_measurement")??null}getPrecision(e){return this.#i?.entities?.[e]?.display_precision??null}getNumericAttributes(e){const t=this.getEntityStateObj(e)?.attributes??{};return Object.fromEntries(Object.entries(t).filter(([,i])=>is.number(i)||is.numericString(i)).map(([i,a])=>{const n=is.number(a)?a:parseFloat(a);return[i,n]}))}}class ChangeTracker{#e=!0;#t=new Set;#i={};#a=!1;#r={isUpdated:!1};constructor(){}set hassState(e){this.#a=!1,e&&(this._hasChanged(e)&&(this._updateCache(e),this.#a=!0),this.#r={isUpdated:this.#a})}get hassState(){return this.#r}get isUpdated(){return this.#a}_hasChanged(e){if(this.#e)return this.#e=!1,!0;if(!is.nonEmptySet(this.#t))return!0;for(const t of this.#t){const i=e?.states?.[t],a=this.#i?.[t];if(!i||!a||JSON.stringify(i)!==JSON.stringify(a))return!0}return!1}_updateCache(e){this.#i={};for(const t of this.#t)this.#i[t]=e.states?.[t]??null}watchEntity(e){e&&this.#t.add(e)}}class EntityHelper{#e=null;#t=!1;#i={};#a=null;#r=null;#n=null;#s=null;stateContent=[];constructor(){this.#e=HassProviderSingleton.getInstance()}set entityId(e){this.#a=e,this.#i=0,this.#s=HassProviderSingleton.getEntityDomain(e),this.#t=this.#e.hasEntity(this.#a)}get entityId(){return this.#a}set attribute(e){this.#r=e}get attribute(){return this.#r}get value(){return this.#t?this.#i:0}get state(){return this.#n}get isValid(){return this.#t}get isAvailable(){return this.#e.isEntityAvailable(this.#a)}refresh(){if(this.#t=this.#e.hasEntity(this.#a),!this.#t){this.#n=CARD.config.entity.state.notFound;return}this.#t=this.#r?this.#t&&this.#e.getEntityAttribute(this.#a,this.#r)!==void 0:this.#t,this.#n=this.#e.getEntityStateValue(this.#a),!(!this.isValid||!this.isAvailable)&&(this.isTimer?this.#u():this.isDuration?this.#d():this.isCounter?this.#l("minimum","maximum"):this.isNumber?this.#l("min","max"):this.#o())}#o(){if(this.#r=this.#r||ATTRIBUTE_MAPPING[this.#s]?.attribute,!this.#r){this.#i=parseFloat(this.#n)||0;return}const e=this.#e.getEntityAttribute(this.#a,this.#r);is.numericString(e)||is.number(e)?(this.#i=parseFloat(e),this.#s===ATTRIBUTE_MAPPING.light.label&&this.#r===ATTRIBUTE_MAPPING.light.attribute&&(this.#i=100*this.#i/255)):(this.#i=0,this.#t=!1)}#u(){let e=null,t=null;switch(this.#n){case CARD.config.entity.state.idle:{t=CARD.config.value.min,e=CARD.config.value.max;break}case CARD.config.entity.state.active:{const i=new Date(this.#e.getTimerFinishAt(this.#a)).getTime();e=NumberFormatter.convertDuration(this.#e.getTimerDuration(this.#a));const a=i-e;t=new Date().getTime()-a;break}case CARD.config.entity.state.paused:{const i=NumberFormatter.convertDuration(this.#e.getTimerRemaining(this.#a));e=NumberFormatter.convertDuration(this.#e.getTimerDuration(this.#a)),t=e-i;break}default:throw new Error("Timer entity - Unknown case")}this.#i={current:t/CARD.config.msFactor,min:CARD.config.value.min,max:e/CARD.config.msFactor,state:this.#n}}#l(e,t){this.#i={current:parseFloat(this.state),min:this.#e.getEntityAttribute(this.#a,e),max:this.#e.getEntityAttribute(this.#a,t)}}#d(){const e=this.#e.getEntityAttribute(this.#a,"unit_of_measurement"),t=parseFloat(this.#n);this.#i=e===void 0?0:NumberFormatter.durationToSeconds(t,e),this.#t=e!==void 0}get attributes(){return this.#t&&!this.isCounter&&!this.isNumber&&!this.isDuration&&!this.isTimer?this.#e.getNumericAttributes(this.#a):{}}get attributesListForEditor(){const e=this.attributes;return[{value:"",label:""},...Object.keys(e).map(t=>({value:t,label:this.#e.getFormatedEntityAttributeName(this.#a,t)}))]}get hasAttribute(){return this.#t&&Object.keys(this.attributes??{}).length>0}get defaultAttribute(){return ATTRIBUTE_MAPPING[this.#s]?.attribute??null}get name(){return this.#e.getEntityName(this.#a)}get stateObj(){return this.#e.getEntityStateObj(this.#a)}get formatedEntityState(){return this.#e.getFormatedEntityState(this.#a)}get unit(){return this.#t?this.isTimer?CARD.config.unit.flexTimer:this.isDuration?CARD.config.unit.second:this.isCounter?CARD.config.unit.disable:this.#e.getUnit(this.#a):null}get precision(){return this.#t?this.#e.getPrecision(this.#a)??null:null}get isTimer(){return this.#s===CARD.config.entity.type.timer}get isDuration(){return!this.isTimer&&this.#e.getDeviceClass(this.#a)==="duration"&&this.#r==null}get isNumber(){return this.#s===CARD.config.entity.type.number}get isCounter(){return this.#s===CARD.config.entity.type.counter}get hasShapeByDefault(){return[CARD.config.entity.type.light,CARD.config.entity.type.fan].includes(this.#s)}#c(){return{heat_cool:CARD.style.color.active,dry:CARD.style.color.climate.dry,cool:CARD.style.color.climate.cool,heat:CARD.style.color.climate.heat,fan_only:CARD.style.color.climate.fanOnly}[this.#n]||CARD.style.color.inactive}#h(){return!this.#i||this.#i<=30?CARD.style.color.battery.low:this.#i<=70?CARD.style.color.battery.medium:CARD.style.color.battery.high}get defaultColor(){const e={[CARD.config.entity.type.timer]:this.value&&this.value.state===CARD.config.entity.state.active?CARD.style.color.active:CARD.style.color.inactive,[CARD.config.entity.type.cover]:this.value&&this.value>0?CARD.style.color.coverActive:CARD.style.color.inactive,[CARD.config.entity.type.light]:this.value&&this.value>0?CARD.style.color.lightActive:CARD.style.color.inactive,[CARD.config.entity.type.fan]:this.value&&this.value>0?CARD.style.color.fanActive:CARD.style.color.inactive,[CARD.config.entity.type.climate]:this.#c(),[CARD.config.entity.class.battery]:this.#h()};return e[this.#s]??e[this.#e.getDeviceClass(this.#a)]??null}get stateContentToString(){const e=[];for(const t of this.stateContent)switch(t){case"state":e.push(this.#e.getFormatedEntityState(this.#a));break;default:e.push(this.#e.getFormatedAttributeValue(this.#a,t));break}return e.length!==0?e.join(CARD.config.separator):""}}class EntityCollectionHelper{#e=[];addEntity(e,t=null){const i=new EntityHelper;i.entityId=e,t&&(i.attribute=t),this.#e.push(i)}refreshAll(){this.#e.forEach(e=>e.refresh())}getTotalValue(){return this.#e.filter(e=>e.isValid&&e.isAvailable).reduce((e,t)=>{const i=t.value;return e+(is.number(i)?i:i?.current??0)},0)}getAvailableEntities(){return this.#e.filter(e=>e.isValid&&e.isAvailable)}getPercentages(){const e=this.getTotalValue();return e===0?[]:this.getAvailableEntities().map(t=>{const i=t.value,a=is.number(i)?i:i?.current??0,n=a/e*100;return{entityId:t.entityId,value:a,percent:n}})}getEntitiesColor(e){const t=this.getPercentages();if(!t.length||!e)return null;const i=t.length,a=[];let n=0;for(let o=0;o<i;o++){const l=t[o],s=Math.round((1-o/(i-1||1))*50),c=100-s,u=`color-mix(in srgb, ${e} ${c}%, black ${s}%)`,d=n,h=n+l.percent;a.push(`${u} ${d.toFixed(2)}%`,`${u} ${h.toFixed(2)}%`),n=h}return`linear-gradient(to right, ${a.join(", ")})`}getAvailableCount(){return this.getAvailableEntities().length}get count(){return this.#e.length}get validEntities(){return this.#e.filter(e=>e.isValid&&e.isAvailable)}get all(){return this.#e}clear(){this.#e=[]}}class EntityOrValue{#e=null;#t={entity:"entity",value:"value"};#i=null;#a(e){const t=e===this.#t.entity?EntityHelper:ValueHelper;this.#e instanceof t||(this.#e=new t,this.#i=e===this.#t.entity)}set value(e){is.string(e)?(this.#a(this.#t.entity),this.#e.entityId=e):is.number(e)?(this.#a(this.#t.value),this.#e.value=e):this.#e=null}get value(){return this.#e?this.#e.value:null}get isEntity(){return this.#i}set attribute(e){this.#e&&this.#i&&(this.#e.attribute=e)}get attribute(){return this.#i?this.#e.attribute:null}get state(){return this.#e&&this.#i?this.#e.state:null}get isValid(){return this.#e?this.#e.isValid:!1}get isAvailable(){return this.#e?this.#i&&this.#e.isAvailable||this.#e.isValid:!1}get precision(){return this.#e&&this.#i?this.#e.precision:null}get name(){return this.#e&&this.#i?this.#e.name:null}get formatedEntityState(){return this.#e&&this.#i?this.#e.formatedEntityState:null}set stateContent(e){this.#e&&this.#i&&(this.#e.stateContent=e)}get stateContent(){return this.#e&&this.#i?this.#e.stateContent:null}get stateContentToString(){return this.#e&&this.#i?this.#e.stateContentToString:null}get isTimer(){return this.#e&&this.#i?this.#e.isTimer:!1}get isDuration(){return this.#e&&this.#i?this.#e.isDuration:!1}get isCounter(){return this.#e&&this.#i?this.#e.isCounter:!1}get isNumber(){return this.#e&&this.#i?this.#e.isNumber:!1}get hasShapeByDefault(){return this.#e&&this.#i?this.#e.hasShapeByDefault:!1}get defaultColor(){return this.#e&&this.#i?this.#e.defaultColor:!1}get hasAttribute(){return this.#e&&this.#i?this.#e.hasAttribute:!1}get defaultAttribute(){return this.#e&&this.#i?this.#e.defaultAttribute:null}get attributes(){return this.#e&&this.#i?this.#e.attributes:null}get attributesListForEditor(){return this.#e&&this.#i?this.#e.attributesListForEditor:null}get unit(){return this.#e&&this.#i?this.#e.unit:null}get stateObj(){return this.#e&&this.#i?this.#e.stateObj:null}refresh(){this.#e&&this.#i&&this.#e.refresh()}}class BaseConfigHelper{#e={};#t=!1;#i=null;#a=!1;#r=HassProviderSingleton.getInstance();get config(){return this.#e}set config(e){this.#a=!0,this.#e=this.constructor.applyDefaults(e)}get isValid(){return this.#t}get msg(){return this.#i}get hasDisabledUnit(){return this.#e.disable_unit}get cardTapAction(){return this.#n("tap_action")}get cardDoubleTapAction(){return this.#n("double_tap_action")}get cardHoldAction(){return this.#n("hold_action")}get iconTapAction(){return this.#n("icon_tap_action")}get iconDoubleTapAction(){return this.#n("icon_double_tap_action")}get iconHoldAction(){return this.#n("icon_hold_action")}#n(e){return(this.#e[e]?.action??null)===null?CARD.interactions.action.default:this.#e[e]?.action}static get _allowedKeys(){return new Set(["entity"])}static filterConfig(e){return Object.fromEntries(Object.entries(e).filter(([t])=>this._allowedKeys.has(t)))}static getEnumValidations(){return{}}static validateEnums(e,t){const i=this.getEnumValidations();if(Object.entries(i).forEach(([a,n])=>{e[a]&&!has.own(n.validValues,e[a])&&(t[a]=n.defaultValue)}),!is.jinja(t.bar_effect)&&is.string(t.bar_effect)&&(t.bar_effect=[t.bar_effect]),e.watermark!==void 0){const{watermark:a}=CARD.config.defaults;t.watermark={...a,...e.watermark}}return t}static applyDefaults(e){throw console.error("applyDefaults must be implemented in subclass",e),new Error("applyDefaults must be implemented in subclass")}checkConfig(){if(!this.#a)return;this.#a=!1,this.#t=!1;const e=this.getValidationRules();for(const t of e)if(!t.valid){this.#i=t.msg;return}this.#t=!0,this.#i=null}getValidationRules(){return[]}get _hassProvider(){return this.#r}get _config(){return this.#e}}class CardConfigHelper extends BaseConfigHelper{get max_value(){if(!this._config.max_value)return CARD.config.value.max;if(Number.isFinite(this._config.max_value))return this._config.max_value;if(is.string(this._config.max_value)){const e=this._hassProvider.getEntityStateValue(this._config.max_value),t=parseFloat(e);if(!isNaN(t))return t}return null}get stateContent(){return(is.string(this._config?.state_content)?[this._config?.state_content]:this._config?.state_content??[]).filter(t=>is.string(t))}static get _allowedKeys(){return new Set(["entity","attribute","name","unit","unit_spacing","decimal","min_value","max_value","max_value_attribute","bar_size","bar_color","icon","force_circular_background","color","layout","frameless","additions","marginless","min_width","height","reverse","reverse_secondary_info_row","decimal","custom_theme","state_content","disable_unit","bar_orientation","hide","badge_icon","badge_color","name_info","custom_info","watermark","bar_effect","tap_action","double_tap_action","hold_action","icon_tap_action","icon_double_tap_action","icon_hold_action","center_zero"])}static getEnumValidations(){return{bar_orientation:{validValues:CARD.style.dynamic.progressBar.orientation,defaultValue:null},bar_size:{validValues:CARD.style.bar.sizeOptions,defaultValue:CARD.style.bar.sizeOptions.small.label},layout:{validValues:CARD.layout.orientations,defaultValue:CARD.layout.orientations.horizontal.label},unit_spacing:{validValues:Object.fromEntries(Object.values(CARD.config.unit.unitSpacing).map(e=>[e,e])),defaultValue:CARD.config.unit.unitSpacing.auto}}}static applyDefaults(e){const t=HassProviderSingleton.getEntityDomain(e.entity),a=["light","switch","fan","input_boolean","media_player"].includes(t),{watermark:n,...o}=this.filterConfig(CARD.config.defaults);e.center_zero===!0&&typeof e.min_value>"u"&&(o.min_value=-100);const l=this.filterConfig(e),s={...o,...a&&{icon_tap_action:{action:"toggle"}},...l};return this.validateEnums(e,s)}getValidationRules(){const e=this._hassProvider.getEntityStateObj(this._config.entity),t=is.nonEmptyString(this._config.max_value)?this._hassProvider.getEntityStateObj(this._config.max_value):null;return[{valid:this._config.entity!==null,msg:{content:LANGUAGES[this._hassProvider.language].card.msg.entityError,sev:"info"}},{valid:!this._config.attribute||e&&has.own(e.attributes,this._config.attribute),msg:{content:LANGUAGES[this._hassProvider.language].card.msg.attributeNotFound,sev:"error"}},{valid:Number.isFinite(this._config.min_value),msg:{content:LANGUAGES[this._hassProvider.language].card.msg.minValueError,sev:"error"}},{valid:Number.isFinite(this.max_value)||t&&(this._config.max_value_attribute?has.own(t.attributes,this._config.max_value_attribute):!0),msg:{content:LANGUAGES[this._hassProvider.language].card.msg.maxValueError,sev:"warning"}},{valid:!this._config.decimal||Number.isFinite(this._config.decimal)&&this._config.decimal>0,msg:{content:LANGUAGES[this._hassProvider.language].card.msg.decimalError,sev:"error"}}]}}class BadgeConfigHelper extends CardConfigHelper{static get _allowedKeys(){const e=super._allowedKeys,t=new Set(["icon_tap_action","icon_double_tap_action","icon_hold_action"]);return new Set([...e].filter(a=>!t.has(a)))}}class MinimalCardView{_configHelper=null;_currentValue=new EntityOrValue;set config(e){this._configHelper.config=e}get config(){return this._configHelper.config}get layout(){return this.config.layout}get barOrientation(){return this._currentValue.isTimer&&this.config.bar_orientation===null||this.config.bar_orientation==="rtl"?"rtl":null}get barSize(){return this.config.bar_size}get entityStateObj(){return this._currentValue.value=this.config.entity,this._currentValue.stateObj}get hasClickableIcon(){return this._hasAnyAction([this._configHelper.iconTapAction,this._configHelper.iconHoldAction,this._configHelper.iconDoubleTapAction])}get hasClickableCard(){return this._hasAnyAction([this._configHelper.cardTapAction,this._configHelper.cardHoldAction,this._configHelper.cardDoubleTapAction])}get hasReversedSecondaryInfoRow(){return this.config.reverse_secondary_info_row===!0}get hasVisibleShape(){return this.config.force_circular_background===!0||this._hasDefaultShape||this._hasInteractiveShape}get _hasDefaultShape(){return this._currentValue.hasShapeByDefault&&this._hasAction(this._configHelper.iconTapAction)}get _hasInteractiveShape(){return[CARD.interactions.action.navigate.action,CARD.interactions.action.url.action,CARD.interactions.action.moreInfo.action,CARD.interactions.action.assist.action,CARD.interactions.action.toggle.action,CARD.interactions.action.performAction.action].includes(this._configHelper.iconTapAction)}get hasWatermark(){return this.config.watermark!==void 0}get barEffectsEnabled(){return this.config.bar_effect!==void 0}get watermark(){if(!this.config.watermark)return null;const{watermark:e}=this.config;return{low:this.config.center_zero===!0?50+e.low/2:e.low,low_color:ThemeManager.adaptColor(e.low_color),high:this.config.center_zero===!0?50+e.high/2:e.high,high_color:ThemeManager.adaptColor(e.high_color),opacity:e.opacity,type:e.type,line_size:e.line_size,disable_low:e.disable_low,disable_high:e.disable_high}}hasComponentHiddenFlag(e){return this._hasInConfigArray("hide",e)}hasBarEffect(e){return this._hasInConfigArray("bar_effect",e)}_hasInConfigArray(e,t){return is.array(this.config?.[e])&&this.config[e].includes(t)}_hasAction(e){return e!==CARD.interactions.action.none.action}_hasAnyAction(e){return e.some(t=>this._hasAction(t))}}class BaseCardView extends MinimalCardView{#e=HassProviderSingleton.getInstance();#t=new PercentHelper;#i=new ThemeManager;#a=new EntityOrValue;#r=new EntityCollectionHelper;#n=CARD.config.language;get hasValidatedConfig(){return this._configHelper.isValid}get msg(){return this._configHelper.msg}set config(e){this._configHelper.config=e,this._configHelper.config.additions&&(this._configHelper.config.additions.forEach(({entity:t,attribute:i})=>{this.#r.addEntity(t,i)}),this.#r.addEntity(e.entity,e.attribute)),Object.assign(this.#t,{unitSpacing:this._configHelper.config.unit_spacing,hasDisabledUnit:this._configHelper.hasDisabledUnit,isCenterZero:this._configHelper.config.center_zero===!0}),Object.assign(this.#i,{theme:e.theme,customTheme:e.custom_theme}),Object.assign(this._currentValue,{value:e.entity,stateContent:this._configHelper.stateContent}),this._currentValue.isTimer?this.#a.value=CARD.config.value.max:(this._currentValue.attribute=e.attribute,Object.assign(this.#a,{value:e.max_value??CARD.config.value.max,attribute:e.max_value_attribute}))}get config(){return this._configHelper.config}get isUnknown(){return this._currentValue.state===CARD.config.entity.state.unknown||this.#a.state===CARD.config.entity.state.unknown}get isUnavailable(){return this._currentValue.state===CARD.config.entity.state.unavailable||this.#a.state===CARD.config.entity.state.unavailable}get isNotFound(){return this._currentValue.state===CARD.config.entity.state.notFound||this.#a.state===CARD.config.entity.state.notFound}get isAvailable(){return!(!this._currentValue.isAvailable||!this.#a.isAvailable&&this._configHelper.maxValue)}get hasStandardEntityError(){return this.isUnavailable||this.isNotFound||this.isUnknown}set currentLanguage(e){Object.keys(LANGUAGES).includes(e)&&(this.#n=e)}get currentLanguage(){return this.#n}get entity(){return this._configHelper.config.entity}get icon(){return(this.isNotFound?CARD.style.icon.notFound.icon:null)||this.#i.icon||this._configHelper.config.icon}get iconColor(){return this.isUnavailable?CARD.style.color.unavailable:this.isNotFound?CARD.style.color.notFound:ThemeManager.adaptColor(this.#i.iconColor||this._configHelper.config.color)||this._currentValue.defaultColor||CARD.style.color.default}get barColor(){if(!this.isAvailable)return this.isUnknown?CARD.style.color.default:CARD.style.color.disabled;const e=ThemeManager.adaptColor(this.#i.barColor||this._configHelper.config.bar_color)||this._currentValue.defaultColor||CARD.style.color.default;return this.hasEntityCollection?this.#r.getEntitiesColor(e):e}get percent(){return this.isAvailable?this.#t.isCenterZero?Math.max(-100,Math.min(100,this.#t.percent)):Math.max(0,Math.min(100,this.#t.percent)):0}get stateAndProgressInfo(){if(this.hasStandardEntityError||this._currentValue.isTimer&&this._currentValue.value.state===CARD.config.entity.state.idle)return this._currentValue.formatedEntityState;const e=this._currentValue.stateContentToString;if(this.hasComponentHiddenFlag(CARD.style.dynamic.hiddenComponent.value.label))return e;const t=this._currentValue.isDuration&&!this._configHelper.config.unit?this._currentValue.formatedEntityState:this.#t.toString();return e===""?t:[e,t].join(CARD.config.separator)}get entityStateObj(){return this._currentValue.stateObj}get name(){return this._configHelper.config.name||this._currentValue.name||this._configHelper.config.entity}get isBadgeEnable(){return this.isUnavailable||this.isNotFound||this._configHelper.config.badge_icon!==null||this._currentValue.isTimer&&[CARD.config.entity.state.paused,CARD.config.entity.state.active].includes(this._currentValue.value.state)}get badgeInfo(){if(this.isNotFound)return CARD.style.icon.badge.notFound;if(this.isUnavailable)return CARD.style.icon.badge.unavailable;if(this._currentValue.isTimer){const{state:e}=this._currentValue.value,{paused:t,active:i}=CARD.config.entity.state;if(e===t)return CARD.style.icon.badge.timer.paused;if(e===i)return CARD.style.icon.badge.timer.active}return null}get isActiveTimer(){return this._currentValue.isTimer&&this._currentValue.state===CARD.config.entity.state.active}get refreshSpeed(){const e=this._currentValue.value.duration/CARD.config.refresh.ratio,t=Math.min(CARD.config.refresh.max,Math.max(CARD.config.refresh.min,e));return Math.max(100,Math.round(t/100)*100)}get show_more_info(){return[CARD.interactions.action.default,CARD.interactions.action.moreInfo.action].includes(this._configHelper.cardTapAction)}get hasVisibleShape(){return this.#e.hasNewShapeStrategy?super.hasVisibleShape:!0}get timerIsReversed(){return this._configHelper.config.reverse!==!1&&this._currentValue.value.state!==CARD.config.entity.state.idle}get hasWatermark(){return this._configHelper.config.watermark!==void 0}get watermark(){if(!this._configHelper.config.watermark)return null;const{watermark:e}=this._configHelper.config;return{low:this.#t.calcWatermark(e.low),low_color:ThemeManager.adaptColor(e.low_color),high:this.#t.calcWatermark(e.high),high_color:ThemeManager.adaptColor(e.high_color),opacity:e.opacity,type:e.type,line_size:e.line_size,disable_low:e.disable_low===!0,disable_high:e.disable_high===!0}}get hasEntityCollection(){return this.#r.count>=2}get entityCollectionPercentage(){return this.#r.getPercentages()}refresh(e){this.#e.hass=e,this.currentLanguage=this.#e.language,this._currentValue.refresh(),this.#a.refresh(),this._configHelper.checkConfig(),this.#r.refreshAll(),this.isAvailable&&(this.#s(),this.#i.value=this.#t.valueForThemes(this.#i.isCustomTheme,this.#i.isBasedOnPercentage))}#s(){this.#t.isTimer=this._currentValue.isTimer||this._currentValue.isDuration;const e=this.#d();this.#t.unit=e,this.#t.decimal=this.#c(e),this._currentValue.isTimer?this.#o():this._currentValue.isCounter||this._currentValue.isNumber?this.#u():this.#l(),this.#t.refresh()}#o(){Object.assign(this.#t,{isReversed:this.timerIsReversed,current:this._currentValue.value.current,min:this._currentValue.value.min,max:this._currentValue.value.max})}#u(){Object.assign(this.#t,{current:this._currentValue.value.current,min:this._currentValue.value.min,max:this.#a.isEntity?this.#a.value?.current??this.#a.value:this._currentValue.value.max})}#l(){const e=this.hasEntityCollection?this.#r.getTotalValue():this._currentValue.value;Object.assign(this.#t,{current:e,min:this._configHelper.config.min_value,max:this.#a.value?.current??this.#a.value})}#d(){if(this._configHelper.config.unit)return this._configHelper.config.unit;if(this.#a.isEntity)return CARD.config.unit.default;const e=this._currentValue.unit;return e===null?CARD.config.unit.default:e}#c(e){return this._configHelper.config.decimal!==null?this._configHelper.config.decimal:this._currentValue.precision?this._currentValue.precision:this._currentValue.isTimer?CARD.config.decimal.timer:this._currentValue.isCounter?CARD.config.decimal.counter:this._currentValue.isDuration||["j","d","h","min","s","ms","\u03BCs"].includes(this._currentValue.unit)?CARD.config.decimal.duration:this._configHelper.config.unit?this._configHelper.config.unit===CARD.config.unit.default?CARD.config.decimal.percentage:CARD.config.decimal.other:e===CARD.config.unit.default?CARD.config.decimal.percentage:CARD.config.decimal.other}}class CardView extends BaseCardView{_configHelper=new CardConfigHelper}class BadgeView extends BaseCardView{_configHelper=new BadgeConfigHelper}class ResourceManager{#e=new Map;#t=new Map;constructor(){}get list(){return[...this.#e.keys()]}get count(){return this.#e.size}add(e,t){if(!is.func(e))throw new Error("Resource must be a function");const i=t||this.#i();return this.#e.has(i)&&this.remove(i),this.#e.set(i,e),i}setInterval(e,t,i){const a=setInterval(e,t);return this.add(()=>{clearInterval(a)},i),i}has(e){return this.#e.has(e)}setTimeout(e,t,i){const a=setTimeout(e,t);return this.add(()=>clearTimeout(a),i)}addEventListener(e,t,i,a,n){return e.addEventListener(t,i,a),this.add(()=>e.removeEventListener(t,i,a),n)}addSubscription(e,t){return this.add(()=>{e()},t)}throttle(e,t,i){this.#t.has(i)||(this.#t.set(i,{lastCall:0}),this.add(()=>this.resetThrottle(i),i));const a=this.#t.get(i),n=Date.now();n-a.lastCall>=t&&(a.lastCall=n,e())}resetThrottle(e){this.#t.delete(e)}remove(e){const t=this.#e.get(e);if(t){try{t()}catch(i){console.error(`[ResourceManager] Error while removing '${e}'`,i)}this.#e.delete(e)}}cleanup(){for(const[e,t]of this.#e)try{t()}catch(i){console.error(`[ResourceManager] Error while clearing '${e}'`,i)}this.#e.clear(),this.#t.clear()}#i(){let e=null;do e=Math.random().toString(36).slice(2,8);while(this.#e.has(e));return e}}class ActionHelper{#e=null;#t=null;#i=null;#a=0;#r=null;#n=null;#s=null;#o=0;#u=0;#l=new Set(["shape","ha-svg-icon","img"]);#d=!1;#c={mousedown:e=>this.#f(e),mouseup:e=>this.#_(e),mousemove:e=>this.#b(e),touchstart:e=>this.#f(e),touchend:e=>this.#_(e),touchmove:e=>this.#b(e)};constructor(e){this.#i=e}init(e,t,i,a){this.#e=e,this.#t=t,this.#d=a,this.#h(i)}cleanup(){this.#e?.cleanup()}#h(e){if(e)if(is.array(e))for(const t of e)t&&this.#m(t);else this.#m(e)}#m(e){this.#e.addEventListener(e,"mousedown",this.#c.mousedown,{passive:!0}),this.#e.addEventListener(e,"mouseup",this.#c.mouseup,{passive:!0}),this.#e.addEventListener(e,"mousemove",this.#c.mousemove,{passive:!0}),this.#e.addEventListener(e,"touchstart",this.#c.touchstart,{passive:!0}),this.#e.addEventListener(e,"touchend",this.#c.touchend,{passive:!0}),this.#e.addEventListener(e,"touchmove",this.#c.touchmove,{passive:!0})}#f(e){const t=e.composedPath()[0].localName;this.#s=this.#d?CARD.interactions.event.from.card:this.#l.has(t)?CARD.interactions.event.from.icon:CARD.interactions.event.from.card,this.#r=Date.now(),this.#o=e.clientX,this.#u=e.clientY,this.#n=!1,this.#e.setTimeout(()=>{this.#n=!0},500,"holdTimeout")}#p(){this.#r=null,this.#n=!1}#_(e){this.#e.remove("holdTimeout");const i=Date.now()-this.#r,a=5,n=i<500&&Math.abs(e.clientX-this.#o)<a&&Math.abs(e.clientY-this.#u)<a;if(this.#n){this.#g(e,CARD.interactions.event.tap.holdAction),this.#p(),this.#a=0;return}if(!n){this.#p();return}this.#a++,this.#a===1?this.#e.setTimeout(()=>{this.#g(e,CARD.interactions.event.tap.tapAction),this.#a=0},300,"tapTimeout"):this.#a===2&&(this.#e.remove("tapTimeout"),this.#g(e,CARD.interactions.event.tap.doubleTapAction),this.#a=0),this.#p()}#b(e){this.#r&&(Math.abs(e.clientX-this.#o)>5||Math.abs(e.clientY-this.#u)>5)&&(this.#e.remove("holdTimeout"),this.#n=!1,this.#r=null)}#g(e,t){let a=`${this.#s===CARD.interactions.event.from.icon?`${CARD.interactions.event.from.icon}_`:""}${t}`,n=null;[CARD.interactions.event.tap.iconTapAction,CARD.interactions.event.tap.iconHoldAction,CARD.interactions.event.tap.iconDoubleTapAction,CARD.interactions.event.tap.doubleTapAction].includes(a)?(a!==CARD.interactions.event.tap.doubleTapAction&&this.#t[`${a}_action`].action==="none"&&(a=t),n={entity:this.#t.entity,tap_action:this.#t[`${a}_action`]},t="tap"):n=this.#t,this.#i.dispatchEvent(new CustomEvent("hass-action",{bubbles:!0,composed:!0,detail:{config:n,action:t,originalEvent:e}}))}}class EntityProgressCardBase extends HTMLElement{static _cardStructure=new CardStructure;static _cardStyle=CARD_CSS;static _hasDisabledIconTap=!1;static _hasDisabledBadge=!1;static _baseClass=CARD.meta.card.typeName;static _cardLayout=CARD.layout.orientations;_resourceManager=null;_icon=null;_cardView=new CardView;_domElements=new Map;_hass=null;_clickableTarget=null;_actionHelper=null;_changeTracker=new ChangeTracker;#e=null;#t=!1;constructor(){super(),this.attachShadow({mode:CARD.config.shadowMode}),this._actionHelper=new ActionHelper(this),EntityProgressCardBase._initializeModule()}connectedCallback(){this.render(),this._updateDynamicElementsSync(),this._resourceManager||(this._resourceManager=new ResourceManager),this._setupClickableTarget(),this._actionHelper.init(this._resourceManager,this._cardView.config,this._clickableTarget,this.hasDisabledIconTap),this.hass&&(this._handleHassUpdate(),this._watchWebSocket())}disconnectedCallback(){this._resourceManager?.cleanup(),this._resourceManager=null}setConfig(e){if(!e)throw new Error("setConfig: invalid config");this.isRendered&&this.reset(),this._cardView.config={...e},is.string(e.entity)&&this._changeTracker.watchEntity(e.entity),is.string(e.max_value)&&this._changeTracker.watchEntity(e.max_value),this.render()}set hass(e){const t=!this.hass;this._changeTracker.hassState=e,(t||this._changeTracker.hassState.isUpdated)&&(this._assignHass(e),this._handleHassUpdate()),this._wsInitialized||this._watchWebSocket()}get hass(){return this._hass}_assignHass(e){this._hass=e}_handleHassUpdate(){const e="hass-update-throttle";this._resourceManager||(this._resourceManager=new ResourceManager),this._resourceManager.throttle(()=>{this._doHandleHassUpdate()},100,e)}_doHandleHassUpdate(){this.refresh(),this._cardView.isActiveTimer?this._resourceManager.has("autoRefresh")||this._startAutoRefresh():this._stopAutoRefresh()}refresh(){this._cardView.refresh(this.hass),!this._manageErrorMessage()&&this._updateDynamicElements()}getCardSize(){return this.constructor._cardLayout[this._cardView.layout].grid.grid_rows}getLayoutOptions(){const e=structuredClone(this.constructor._cardLayout[this._cardView.layout]);return this._cardView.hasComponentHiddenFlag(CARD.style.dynamic.hiddenComponent.icon.label)&&(e.grid.grid_min_rows=1),this._cardView.config.bar_size===CARD.style.bar.sizeOptions.xlarge.label&&(e.grid.grid_min_rows=e.grid.grid_min_rows+1),e.grid}get isRendered(){return this.#t}reset(){this.#t=!1,this._domElements.clear(),this._icon=null,this.shadowRoot&&(this.shadowRoot.innerHTML="")}get innerHTML(){return this.constructor._cardStructure.innerHTML}get cardStyle(){return this.constructor._cardStyle}get hasDisabledIconTap(){return this.constructor._hasDisabledIconTap}get baseClass(){return this.constructor._baseClass}static _initializeModule(){EntityProgressCardBase._moduleLoaded||(console.groupCollapsed(CARD.console.message,CARD.console.css),console.log(CARD.console.link),console.groupEnd(),EntityProgressCardBase._moduleLoaded=!0)}_setupClickableTarget(){this._clickableTarget=this}_startAutoRefresh(){this._resourceManager&&this._resourceManager.setInterval(()=>{this.refresh(this.hass),this._cardView.isActiveTimer||this._stopAutoRefresh()},this._cardView.refreshSpeed,"autoRefresh")}_stopAutoRefresh(){this._resourceManager&&this._resourceManager.remove("autoRefresh")}_manageErrorMessage(){return this._cardView.entity===null||this._cardView.isAvailable&&!this._cardView.hasValidatedConfig?(this._renderMessage(this._cardView.msg),!0):(this.#e=null,!1)}_renderMessage(e){if(e===this.#e)return;this.#e=e;let t=this.shadowRoot.querySelector("ha-alert");t||(t=document.createElement("ha-alert"),this.shadowRoot.replaceChildren(t)),t.setAttribute("alert-type",e.sev),t.textContent=e.content}render(){if(this.isRendered)return;this.#t=!0,this._manageStructureOptions();const{style:e,card:t}=this._createCardElements();this.shadowRoot.replaceChildren(e,t),this._storeDOM(t)}_manageStructureOptions(){this.constructor._cardStructure.options={barType:this._cardView.config.center_zero===!0?"centerZero":"default",layout:this._cardView.config.layout,barPosition:this._cardView.config.layout===CARD.layout.orientations.horizontal.label&&this._cardView.config.bar_size===CARD.style.bar.sizeOptions.xlarge.label?"below":"default"}}_createCardElements(){const e=document.createElement(CARD.style.element);e.textContent=this.cardStyle;const t=document.createElement(CARD.htmlStructure.card.element);return this._buildStyle(t),t.innerHTML=this.innerHTML,{style:e,card:t}}_buildStyle(e){this._addBaseClasses(e),this._addBaseParameter(e),this._applyConditionalClasses(e),this._handleHiddenComponents(e),this._handleWatermarkClasses(e),this._handleBarEffect(e)}_addBaseClasses(e){const t=[this.baseClass];this._cardView.barOrientation&&t.push(CARD.style.dynamic.progressBar.orientation[this._cardView.barOrientation]),t.push(this._cardView.layout,this._cardView.barSize),e.classList.add(...t)}_addBaseParameter(e){this._cardView.hasReversedSecondaryInfoRow&&this._setStylePropertyIfChanged(e.style,"--epb-secondary-info-row-reverse","row-reverse"),this._cardView.config.min_width&&this._setStylePropertyIfChanged(e.style,CARD.style.dynamic.card.minWidth.var,this._cardView.config.min_width),this._cardView.config.height&&this._setStylePropertyIfChanged(e.style,CARD.style.dynamic.card.height.var,this._cardView.config.height)}get conditionalStyle(){return new Map([[CARD.style.dynamic.clickable.card,this._cardView.hasClickableCard],[CARD.style.dynamic.clickable.icon,this._cardView.hasClickableIcon],[CARD.style.dynamic.secondaryInfoError.class,this._cardView.hasStandardEntityError],[CARD.style.dynamic.frameless.class,this._cardView.config.frameless===!0],[CARD.style.dynamic.marginless.class,this._cardView.config.marginless===!0]])}_applyConditionalClasses(e){this.conditionalStyle.forEach((t,i)=>{e.classList.toggle(i,t)})}_handleHiddenComponents(e){[CARD.style.dynamic.hiddenComponent.icon,CARD.style.dynamic.hiddenComponent.name,CARD.style.dynamic.hiddenComponent.secondary_info,CARD.style.dynamic.hiddenComponent.progress_bar].forEach(i=>{this._toggleHiddenComponent(e,i)})}_handleWatermarkClasses(e){if(!this._cardView.hasWatermark)return;const t=["area","blended","striped","line","triangle","round"].includes(this._cardView.watermark.type)?`${this._cardView.watermark.type}`:"blended",i=CARD.htmlStructure.elements.progressBar.watermark.class,a=CARD.style.dynamic.show;e.classList.toggle(`${a}-hwm-${t}-${i}`,!this._cardView.watermark.disable_high),e.classList.toggle(`${a}-lwm-${t}-${i}`,!this._cardView.watermark.disable_low)}_handleBarEffect(e,t=null){if(!this._cardView.barEffectsEnabled)return;const i=is.jinja(this._cardView.config.bar_effect);if(i&&!t)return;Object.values(CARD.style.dynamic.progressBar.effect).forEach(n=>{i?e.classList.toggle(n.class,t.includes(n.label)):e.classList.toggle(n.class,this._cardView.hasBarEffect(n.label))})}_toggleHiddenComponent(e,t){e.classList.toggle(t.class,this._cardView.hasComponentHiddenFlag(t.label))}_setStylePropertyIfChanged(e,t,i){e.getPropertyValue(t)!==i&&e.setProperty(t,i)}static _setTextContentIfChanged(e,t){e.textContent!==t&&(e.textContent=t)}static _setInnerHTMLIfChanged(e,t){e.innerHTML!==t&&(e.innerHTML=t)}static _batchDOMUpdates(e){requestAnimationFrame(()=>{e.forEach(t=>t())})}_storeDOM(e){const t=CARD.htmlStructure.elements;this._domElements.clear(),this._domElements.set(CARD.htmlStructure.card.element,e);const i=[t.icon,t.shape,t.badge.icon,t.name,t.nameCustomInfo,t.customInfo,t.stateAndProgressInfo],a=this.shadowRoot,n=Array.from(a.querySelectorAll("*"));for(const{class:o}of i){const l=n.find(s=>s.classList.contains(o));l&&this._domElements.set(o,l)}}_updateElement(e,t){const i=this._domElements.get(e);i&&t(i)}_updateDynamicElementsSync(){this._showIcon(),this._showBadge(),this._manageShape(),this._updateCSS(),this._processJinjaFields(),this._processStandardFields()}_updateDynamicElements(){EntityProgressCardBase._batchDOMUpdates([()=>this._showIcon(),()=>this._showBadge(),()=>this._manageShape(),()=>this._updateCSS()]),this._processJinjaFields(),this._processStandardFields()}_updateCSSValue(e,t){this._updateElement(CARD.htmlStructure.card.element,i=>{this._setStylePropertyIfChanged(i.style,e,t)})}_updateCSS(){this._updateElement(CARD.htmlStructure.card.element,e=>{const t=e.style,i=this._cardView,a=i.config.center_zero===!0,n=i.percent<0,o=[[CARD.style.dynamic.progressBar.color.var,i.barColor],[CARD.style.dynamic.iconAndShape.color.var,i.iconColor]];if(a?o.push([n?CARD.style.dynamic.progressBar.nSize.var:CARD.style.dynamic.progressBar.pSize.var,`${Math.abs(i.percent/2)}%`],[n?CARD.style.dynamic.progressBar.pSize.var:CARD.style.dynamic.progressBar.nSize.var,"0%"]):o.push([CARD.style.dynamic.progressBar.size.var,`${i.percent}%`]),i.hasWatermark){const l=i.watermark,s=EntityProgressCardBase._getWatermarkProperties(l,a);o.push(...s)}o.forEach(([l,s])=>{this._setStylePropertyIfChanged(t,l,s)})})}static _getWatermarkProperties(e,t=!1){const i=t?50+e.high/2:e.high,a=t?50+e.low/2:e.low;return[[CARD.style.dynamic.watermark.high.value.var,`${i}%`],[CARD.style.dynamic.watermark.high.color.var,e.high_color],[CARD.style.dynamic.watermark.low.value.var,`${a}%`],[CARD.style.dynamic.watermark.low.color.var,e.low_color],[CARD.style.dynamic.watermark.opacity.var,e.opacity],[CARD.style.dynamic.watermark.lineSize.var,e.line_size]]}_createImgIcon(e,t="custom-icon-img"){const i=document.createElement("img");return i.className=t,i.loading="lazy",i.decoding="async",i.alt=e,i}_handleImgIcon(e,t,i){const a=e?.attributes?.friendly_name||"Entity picture";this._icon?.tagName!=="IMG"&&(this._icon?.remove(),this._icon=this._createImgIcon(a),t.replaceChildren(this._icon),this._updateCSSValue(CARD.style.dynamic.iconAndShape.icon.size.var,"36px")),this._icon.src=i,this._icon.alt=a}_createStateObjIcon(e,t,i,a){if(!e)return this.isConnected?{entity_id:"sensor.dummy",state:"unknown",attributes:{icon:t||"mdi:help-circle-outline",friendly_name:"Unknown Entity"}}:null;if(!i&&!a)return e;if(i)return{entity_id:"sensor.for_picture",state:"on",attributes:{icon:t}};const n={...e.attributes};return a&&!i&&delete n.entity_picture,{...e,attributes:n}}_cleanupImgIcon(){this._icon?.tagName==="IMG"&&(this._icon.remove(),this._icon=null)}_handleStateIcon(e,t){this._cleanupImgIcon(),this._icon||(this._icon=document.createElement("ha-state-icon"),e.replaceChildren(this._icon)),this._icon.hass=this._hass,this._icon.stateObj=t}_showIcon(){if(!this._cardView||!this._domElements)return;const{entityStateObj:e,icon:t}=this._cardView,i=is.nonEmptyString(t),a=e?.attributes?.entity_picture,n=is.nonEmptyString(a),o=this._domElements.get(CARD.htmlStructure.elements.icon.class);if(!o){console.error("Icon container not found for _showIcon.");return}if(i){const s=this._createStateObjIcon(e,t,i,n);s&&this._handleStateIcon(o,s);return}if(n){this._handleImgIcon(e,o,a);return}const l=this._createStateObjIcon(e,t,i,n);l&&this._handleStateIcon(o,l)}_manageShape(){this._domElements.get(CARD.htmlStructure.card.element)?.classList.toggle(CARD.style.dynamic.hiddenComponent.shape.class,!this._cardView.hasVisibleShape||this.hasDisabledIconTap)}_showBadge(){if(this.constructor._hasDisabledBadge)return;const{badgeInfo:e,isBadgeEnable:t}=this._cardView;if(!(t&&e===null)&&(this._domElements.get(CARD.htmlStructure.card.element)?.classList.toggle(`${CARD.style.dynamic.show}-${CARD.htmlStructure.elements.badge.container.class}`,t),t)){if(!e)return;this._setBadge(e.icon,e.color,e.backgroundColor)}}_setBadge(e,t,i){this._setBadgeIcon(e),this._setBadgeColor(t,i)}_setBadgeIcon(e){this._updateElement(CARD.htmlStructure.elements.badge.icon.class,t=>{t.getAttribute(CARD.style.icon.badge.default.attribute)!==e&&t.setAttribute(CARD.style.icon.badge.default.attribute,e)})}_setBadgeColor(e,t){this._updateElement(CARD.htmlStructure.card.element,i=>{const a=i.style;this._setStylePropertyIfChanged(a,CARD.style.dynamic.badge.backgroundColor.var,t),this._setStylePropertyIfChanged(a,CARD.style.dynamic.badge.color.var,e)})}_renderJinja(e,t){const a=this._getRenderHandlers(t)[e];a?a():console.error(`Jinja - Unknown case: ${e}`)}_getRenderHandlers(e){return{badge_icon:()=>this._renderBadgeIcon(e),badge_color:()=>this._renderBadgeColor(e),custom_info:()=>this._renderCustomInfo(e),name_info:()=>this._renderNameInfo(e),bar_effect:()=>this._refreshBarEffect(e)}}_renderCustomInfo(e){const t=`${e}&nbsp;`;this._updateElement(CARD.htmlStructure.elements.customInfo.class,i=>{EntityProgressCardBase._setInnerHTMLIfChanged(i,t)})}_renderNameInfo(e){const t=`&nbsp;${e}`;this._updateElement(CARD.htmlStructure.elements.nameCustomInfo.class,i=>{EntityProgressCardBase._setInnerHTMLIfChanged(i,t)})}_renderBadgeIcon(e){const t=this._cardView.badgeInfo,i=this._cardView.isBadgeEnable,a=e.includes("mdi:");t===null&&a&&(this._domElements.get(CARD.htmlStructure.card.element)?.classList.toggle(`${CARD.style.dynamic.show}-${CARD.htmlStructure.elements.badge.container.class}`,i),this._setBadgeIcon(e))}_renderBadgeColor(e){const t=ThemeManager.adaptColor(e);this._setBadgeColor("var(--white-color)",t)}_refreshBarEffect(e){const t=this._domElements.get(CARD.htmlStructure.card.element),i=e.split(",").map(a=>a.trim());this._handleBarEffect(t,i)}get _wsInitialized(){return this._resourceManager?.has("ws-disconnected")&&this._resourceManager?.has("ws-ready")}_unwatchWebSocket(){this._resourceManager&&(this._resourceManager.remove("ws-disconnected"),this._resourceManager.remove("ws-ready"))}_watchWebSocket(){this._unwatchWebSocket(),this._resourceManager.addEventListener(this.hass.connection,"disconnected",()=>{const e=this._getTemplateFields();for(const t of Object.keys(e))this._resourceManager.remove(`template-${t}`)},{passive:!0},"ws-disconnected"),this._resourceManager.addEventListener(this.hass.connection,"ready",()=>{this._resourceManager||(this._resourceManager=new ResourceManager),this._processJinjaFields()},{passive:!0},"ws-ready")}_validateProcessJinjaFields(){return!(this._cardView.hasStandardEntityError||!this._resourceManager)}async _processJinjaFields(){if(!this._validateProcessJinjaFields())return;const e=this._getTemplateFields();for(const[t,i]of Object.entries(e))is.nonEmptyString(i)&&await this._subscribeToTemplate(t,i)}_getTemplateContext(){const e=this._cardView?.config?.entity;return e?{entity:e}:{}}_getTemplateFields(){const e=this._cardView.config;return{name_info:e.name_info||"",custom_info:e.custom_info||"",badge_icon:e.badge_icon||"",badge_color:e.badge_color||"",bar_effect:e.bar_effect||""}}async _subscribeToTemplate(e,t){const i=`template-${e}`;if(this.hass?.connection?.connected&&this._resourceManager)try{const a=await this.hass.connection.subscribeMessage(n=>this._renderJinja(e,n.result),{type:"render_template",template:t,variables:this._getTemplateContext()});if(this._resourceManager)if(this.isConnected)this._resourceManager.remove(i),this._resourceManager.addSubscription(a,i);else{a();return}else{a();return}}catch(a){this._log.error(`Failed to subscribe to template ${e}:`,a)}}_processStandardFields(){[{className:CARD.htmlStructure.elements.name.class,value:this._cardView.name},{className:CARD.htmlStructure.elements.stateAndProgressInfo.class,value:this._cardView.stateAndProgressInfo}].forEach(({className:t,value:i})=>{this._updateElement(t,a=>{EntityProgressCardBase._setTextContentIfChanged(a,i)})})}}class EntityProgressCard extends EntityProgressCardBase{_cardView=new CardView;static _baseClass=CARD.meta.card.typeName;static getConfigElement(){return document.createElement(CARD.meta.card.editor)}static getStubEntity(e){return Object.keys(e.states).find(t=>/^(sensor\..*battery|fan\.|cover\.|light\.)/i.test(t))||"sensor.temperature"}static getStubConfig(e){return{type:`custom:${CARD.meta.card.typeName}`,entity:EntityProgressCard.getStubEntity(e)}}}class EntityProgressBadge extends EntityProgressCardBase{_cardView=new BadgeView;static _baseClass=CARD.meta.badge.typeName;static _hasDisabledIconTap=!0;static _hasDisabledBadge=!0;static _cardLayout=CARD.layout.orientations.horizontal.grid;static _cardStructure=new BadgeStructure;static _cardStyle=`
    :host {
      --epb-icon-size: 18px;
      --epb-shape-size: 18px;
    }

    ${CARD_CSS}

    ${CARD.htmlStructure.card.element},
    .${CARD.htmlStructure.sections.container.class} {
      min-height: 36px !important;
      max-height: 36px !important;
      height: var(--ha-badge-size, 36px);
      min-width: var(--epb-card-min-width, var(--ha-badge-size, 110px));
      width: 100%;
      border-radius: var(--ha-badge-border-radius,calc(var(--ha-badge-size,36px)/ 2));
    }

    .icon ha-state-icon {
      --mdc-icon-size: var(--epb-icon-size);
      --ha-icon-display: flex;
      height: var(--epb-icon-size);
      width: var(--epb-icon-size);
      display: flex !important;
      align-items: center !important;
      justify-content: center !important;
    }

    .${CARD.htmlStructure.elements.nameGroup.class},
    .${CARD.htmlStructure.elements.nameGroup.class} > span {
      height: 10px !important;
      font-size: 10px !important;
      font-style: normal !important;
      font-weight: 500 !important;
      line-height: 10px !important;
      color: var(--secondary-text-color) !important;
      margin-right: 5px !important;
    }

    .${CARD.htmlStructure.elements.detailGroup.class},
    .${CARD.htmlStructure.elements.detailGroup.class} > span {
      font-size: var(--ha-badge-font-size, var(--ha-font-size-s)) !important;
      font-style: normal !important;
      font-weight: 500 !important;
      letter-spacing: 0.1px !important;
      color: var(--primary-text-color)
    }
    .${CARD.htmlStructure.elements.secondaryInfo.class} {
    gap: 5px !important;
    }
    .${CARD.htmlStructure.elements.detailGroup.class} {
      min-width: unset !important;
      max-width: unset !important;
    }
    .${CARD.style.dynamic.clickable.icon} .${CARD.htmlStructure.sections.left.class}:hover .${CARD.htmlStructure.elements.shape.class} {
      background-color: unset !important;
    }
    `;setConfig(e){super.setConfig(e),this._hass&&setTimeout(()=>this.refresh(),0)}_rebuildStyle(){const e=this._domElements.get(CARD.htmlStructure.card.element);e&&this._buildStyle(e)}static getConfigElement(){return document.createElement(CARD.meta.badge.editor)}getCardSize(){return this._cardLayout.grid_rows}getLayoutOptions(){return this._cardLayout}static getStubConfig(e){return{type:`custom:${CARD.meta.badge.typeName}`,entity:EntityProgressCard.getStubEntity(e)}}}EntityProgressCardBase.version=VERSION,EntityProgressCardBase._moduleLoaded=!1,customElements.define(CARD.meta.card.typeName,EntityProgressCard),customElements.define(CARD.meta.badge.typeName,EntityProgressBadge),RegistrationHelper.registerCard(CARD.meta.card),RegistrationHelper.registerBadge(CARD.meta.badge);class TemplateConfigHelper extends BaseConfigHelper{static get _allowedKeys(){return new Set(["entity","name","icon","secondary","badge_icon","badge_color","percent","color","bar_color","hide","bar_orientation","bar_size","layout","watermark","bar_effect","frameless","marginless","min_width","height","tap_action","hold_action","double_tap_action","icon_tap_action","icon_hold_action","icon_double_tap_action","reverse_secondary_info_row","center_zero"])}static getEnumValidations(){return{bar_orientation:{validValues:CARD.style.dynamic.progressBar.orientation,defaultValue:null},bar_size:{validValues:CARD.style.bar.sizeOptions,defaultValue:CARD.style.bar.sizeOptions.small.label},layout:{validValues:CARD.layout.orientations,defaultValue:CARD.layout.orientations.horizontal.label}}}static applyDefaults(e){const t=HassProviderSingleton.getEntityDomain(e.entity),a=["light","switch","fan","input_boolean","media_player"].includes(t),{watermark:n,...o}=this.filterConfig(CARD.config.defaults),l={name:"Template Card"},s=this.filterConfig(e),c={...o,...l,...a&&{icon_tap_action:{action:"toggle"}},...s};return this.validateEnums(e,c)}}class TemplateCardView extends MinimalCardView{_configHelper=new TemplateConfigHelper;icon=null}class EntityProgressTemplate extends EntityProgressCardBase{static _cardStructure=new TemplateStructure;_firstIconRefresh=!0;_cardView=new TemplateCardView;_hassProvider=HassProviderSingleton.getInstance();connectedCallback(){this._resourceManager||(this._resourceManager=new ResourceManager),this.render(),this._showIcon(),this._updateWatermark(),this._manageShape(),this._setupClickableTarget(),this._actionHelper.init(this._resourceManager,this._cardView.config,this._clickableTarget),this.hass&&Promise.resolve().then(()=>{this._processJinjaFields()}),this.hass&&!this._wsInitialized&&this._watchWebSocket()}setConfig(e){this._cardView.config=e}set hass(e){const t=!this.hass;this._hassProvider.hass=e,this._handleHassUpdate(),t&&!this._wsInitialized&&this._watchWebSocket()}get hass(){return this._hassProvider.hass}_handleHassUpdate(){this._resourceManager||(this._resourceManager=new ResourceManager),this._resourceManager.throttle(()=>{this._processJinjaFields()},50,"hass-update-throttle")}static getStubConfig(e){return{type:`custom:${CARD.meta.template.typeName}`,entity:EntityProgressCard.getStubEntity(e),...CARD.config.stub.template}}get conditionalStyle(){return new Map([[CARD.style.dynamic.clickable.card,this._cardView.hasClickableCard],[CARD.style.dynamic.clickable.icon,this._cardView.hasClickableIcon],[CARD.style.dynamic.frameless.class,this._cardView.config.frameless===!0],[CARD.style.dynamic.marginless.class,this._cardView.config.marginless===!0]])}_updateWatermark(){if(!this._cardView.hasWatermark)return;const e=this._cardView.watermark;EntityProgressCardBase._getWatermarkProperties(e).forEach(([i,a])=>{this._updateCSSValue(i,a)})}_renderBadgeIcon(e){const t=e.includes("mdi:"),i=`${CARD.style.dynamic.show}-${CARD.htmlStructure.elements.badge.container.class}`;this._domElements.get(CARD.htmlStructure.card.element)?.classList.toggle(i,t),t&&this._setBadgeIcon(e)}_showIcon(e=null){const t=this._cardView.config.icon!==null&&e===null;if(this._firstIconRefresh&&t){this._firstIconRefresh=!1;return}this._cardView.icon=t?"mdi:alert-circle-outline":e,super._showIcon()}_forceJinjaProcessing(){this._resourceManager||(this._resourceManager=new ResourceManager),this._processJinjaFields()}_getRenderHandlers(e){return{badge_icon:()=>this._renderBadgeIcon(e),badge_color:()=>this._renderBadgeColor(e),secondary:()=>this._renderSecondary(e),name:()=>this._renderName(e),icon:()=>this._showIcon(e),percent:()=>this._renderPercentCSS(e),color:()=>this._updateCSSValue(CARD.style.dynamic.iconAndShape.color.var,ThemeManager.adaptColor(e)),bar_color:()=>this._updateCSSValue(CARD.style.dynamic.progressBar.color.var,ThemeManager.adaptColor(e)),bar_effect:()=>this._refreshBarEffect(e)}}_renderPercentCSS(e){const t=this._cardView.config.center_zero===!0,i=Math.abs(e),a=`${i/2}%`;t?(this._updateCSSValue(e>=0?CARD.style.dynamic.progressBar.pSize.var:CARD.style.dynamic.progressBar.nSize.var,a),this._updateCSSValue(e>=0?CARD.style.dynamic.progressBar.nSize.var:CARD.style.dynamic.progressBar.pSize.var,"0%")):this._updateCSSValue(CARD.style.dynamic.progressBar.size.var,`${i}%`)}_renderSecondary(e){const i=/<br\s*\/?>/i.test(e)?`<span class="multiline">${e}</span>`:`${e}`;this._renderTextContent(CARD.htmlStructure.elements.customInfo.class,i)}_renderName(e){this._renderTextContent(CARD.htmlStructure.elements.name.class,`${e}`)}_renderTextContent(e,t){this._updateElement(e,i=>{const a=is.string(t)?t.trim():"";EntityProgressCardBase._setInnerHTMLIfChanged(i,a)})}_validateProcessJinjaFields(){return!!this.hass}_getTemplateFields(){const e=this._cardView.config;return{name:e.name||"",secondary:e.secondary||"",badge_icon:e.badge_icon||"",badge_color:e.badge_color||"",icon:e.icon||"",percent:e.percent||"",color:e.color||"",bar_color:e.bar_color||"",bar_effect:e.bar_effect||""}}}EntityProgressTemplate.version=VERSION,EntityProgressTemplate._moduleLoaded=!1,customElements.define(CARD.meta.template.typeName,EntityProgressTemplate),RegistrationHelper.registerCard(CARD.meta.template);class ConfigUpdateEventHandler{constructor(e){this.config=structuredClone(e),this.updateFunctions=new Map([[EDITOR_INPUT_FIELDS.basicConfiguration.attribute.name,this.updateField.bind(this)],[EDITOR_INPUT_FIELDS.content.field.max_value_attribute.name,this.updateField.bind(this)],[EDITOR_INPUT_FIELDS.content.field.name.name,this.updateField.bind(this)],[EDITOR_INPUT_FIELDS.content.field.unit.name,this.updateField.bind(this)],[EDITOR_INPUT_FIELDS.theme.field.bar_size.name,this.updateField.bind(this)],[EDITOR_INPUT_FIELDS.theme.field.layout.name,this.updateField.bind(this)],[EDITOR_INPUT_FIELDS.theme.field.theme.name,this.updateField.bind(this)],[EDITOR_INPUT_FIELDS.content.field.decimal.name,this.updateNumericField.bind(this)],[EDITOR_INPUT_FIELDS.content.field.min_value.name,this.updateNumericField.bind(this)],[EDITOR_INPUT_FIELDS.content.field.max_value.name,this.updateMaxValueField.bind(this)],[EDITOR_INPUT_FIELDS.interaction.field.icon_tap_action.name,this.updateInteractionField.bind(this)],[EDITOR_INPUT_FIELDS.interaction.field.icon_double_tap_action.name,this.updateInteractionField.bind(this)],[EDITOR_INPUT_FIELDS.interaction.field.icon_hold_action.name,this.updateInteractionField.bind(this)],[EDITOR_INPUT_FIELDS.interaction.field.tap_action.name,this.updateInteractionField.bind(this)],[EDITOR_INPUT_FIELDS.interaction.field.double_tap_action.name,this.updateInteractionField.bind(this)],[EDITOR_INPUT_FIELDS.interaction.field.hold_action.name,this.updateInteractionField.bind(this)],[EDITOR_INPUT_FIELDS.basicConfiguration.entity.name,this.updateEntityOrValueField.bind(this)],[EDITOR_INPUT_FIELDS.theme.field.icon.name,this.updateEntityOrValueField.bind(this)],[EDITOR_INPUT_FIELDS.theme.field.bar_color.name,this.updateEntityOrValueField.bind(this)],[EDITOR_INPUT_FIELDS.theme.field.color.name,this.updateEntityOrValueField.bind(this)],[EDITOR_INPUT_FIELDS.theme.field.toggleBar.name,this.updateToggleField.bind(this)],[EDITOR_INPUT_FIELDS.theme.field.toggleIcon.name,this.updateToggleField.bind(this)],[EDITOR_INPUT_FIELDS.theme.field.toggleName.name,this.updateToggleField.bind(this)],[EDITOR_INPUT_FIELDS.theme.field.toggleValue.name,this.updateToggleField.bind(this)],[EDITOR_INPUT_FIELDS.theme.field.toggleSecondaryInfo.name,this.updateToggleField.bind(this)],[EDITOR_INPUT_FIELDS.theme.field.toggleCircular.name,this.updateCircularField.bind(this)],[EDITOR_INPUT_FIELDS.theme.field.toggleUnit.name,this.updateUnitField.bind(this)]])}updateConfig(e){const t=e.target.id;if(this.updateFunctions.has(t))this.updateFunctions.get(t).call(this,t,e);else throw new Error("Unknown case in message update");if(e.target.id===EDITOR_INPUT_FIELDS.basicConfiguration.entity.name||e.target.id===EDITOR_INPUT_FIELDS.content.field.max_value.name){const i=e.target.id===EDITOR_INPUT_FIELDS.basicConfiguration.entity.name?EDITOR_INPUT_FIELDS.basicConfiguration.attribute.name:EDITOR_INPUT_FIELDS.content.field.max_value_attribute.name,a=new EntityOrValue;a.value=e.target.value,a.hasAttribute||delete this.config[i],e.target.id===EDITOR_INPUT_FIELDS.basicConfiguration.entity.name&&a.unit&&this.config.unit===null&&(this.config.unit=a.unit)}return this.config}updateField(e,t){is.nullishOrEmptyString(t.target.value)?delete this.config[e]:this.config[e]=t.target.value}updateNumericField(e,t){const i=parseFloat(t.target.value);isNaN(i)?delete this.config[e]:this.config[e]=i}updateMaxValueField(e,t){is.numericString(t.target.value)?this.config[e]=parseFloat(t.target.value):is.nonEmptyString(t.target.value)?this.config[e]=t.target.value:delete this.config[e]}updateInteractionField(e,t){this.config[e]=t.detail.value[e]}updateEntityOrValueField(e,t){t?.detail?.value&&is.nonEmptyString(t.detail.value[e])?this.config[e]=t.detail.value[e]:delete this.config[e]}updateToggleField(e,t){const i=e.replace("toggle_",""),a=structuredClone(this.config);a.hide=is.nonEmptyArray(a.hide)?[...a.hide]:[],t.target.checked?a.hide=a.hide.filter(o=>o!==i):a.hide.includes(i)||a.hide.push(i),a.hide.length===0&&delete a.hide,this.config=a}updateCircularField(e,t){t.target.checked?this.config.force_circular_background=!0:delete this.config.force_circular_background}updateUnitField(e,t){t.srcElement.checked?delete this.config.disable_unit:this.config.disable_unit=!0}}class EntityProgressCardEditor extends HTMLElement{static _editorStyle=CARD_EDITOR_CSS;static _editorFields=EDITOR_INPUT_FIELDS;#e=null;#t=null;#i=null;#a={};#r={entity:null,max_value:null};#n=!1;#s=!1;#o=new Map;#u=[];#l=[];#d=CARD.config.language;#c=!1;constructor(){super(),this.attachShadow({mode:CARD.config.shadowMode}),this.#e=HassProviderSingleton.getInstance()}connectedCallback(){this.#t||(this.#t=new ResourceManager),this.#n&&!this.#c&&this.#s&&(this.#g(),this.#c=!0,this.#s=!1)}disconnectedCallback(){this.#t?.cleanup(),this.#t=null,this.#c=!1,this.#s=!0}set hass(e){e&&((!this.#e.hass||this.#e.hass.entities!==e.entities)&&(this.#e.hass=e),this.#d=this.#e.language)}get hass(){return this.#e.hass}setConfig(e){this.#a={...e},this.#e.isValid&&(this.#n||(this.#o=new Map,this.#u=[],this.#l=[],this.render(),this.#n=!0,this.#c=!1),this.isConnected||(this.#s=!0),!this.#c&&this.isConnected&&(this.#g(),this.#c=!0),this.#E())}get editorStyle(){return this.constructor._editorStyle}get editorFields(){return this.constructor._editorFields}render(){const e=document.createElement(CARD.style.element);e.textContent=this.editorStyle;const t=document.createDocumentFragment();t.appendChild(e),this.#i=document.createElement(CARD.editor.fields.container.element),this.#i.classList.add(CARD.editor.fields.container.class),this.#m(this.#i,this.editorFields.basicConfiguration);for(const i of Object.keys(this.editorFields))i!=="basicConfiguration"&&this.#h(this.#i,this.editorFields[i]);this.#i.appendChild(EntityProgressCardEditor.#b()),t.appendChild(this.#i),this.shadowRoot.appendChild(t)}#h(e,t){const i=document.createElement(CARD.editor.fields.accordion.item.element);i.classList.add(CARD.editor.fields.accordion.item.class),this.#u.push(i);const a=document.createElement(CARD.editor.fields.accordion.title.element);this.#l.push(a),a.classList.add(CARD.editor.fields.accordion.title.class);const n=document.createElement(CARD.editor.fields.accordion.icon.element);n.setAttribute("icon",t.title.icon),n.classList.add(CARD.editor.fields.accordion.icon.class),a.appendChild(n);const o=document.createTextNode(LANGUAGES[this.#d].editor.title[t.title.name]);a.appendChild(o);const l=document.createElement(CARD.editor.fields.accordion.arrow.element);l.classList.add(CARD.editor.fields.accordion.arrow.class),l.setAttribute("icon",CARD.editor.fields.accordion.arrow.icon),a.appendChild(l),i.appendChild(a);const s=document.createElement(CARD.editor.fields.accordion.content.element);s.classList.add(CARD.editor.fields.accordion.content.class),this.#m(s,t.field),i.appendChild(s),e.appendChild(i)}#m(e,t){Object.values(t).forEach(i=>{e.appendChild(this.#f({name:i.name,label:LANGUAGES[this.#d].editor.field[i.name],type:i.type,isInGroup:i.isInGroup,width:i.width,schema:i.schema!==void 0?i.schema:null}))})}#f({name:e,label:t,type:i,required:a,isInGroup:n,width:o,schema:l=null}){let s=null;const c=this.#a[e]??"";switch(i){case CARD.editor.fields.entity.type:case CARD.editor.fields.color.type:case CARD.editor.fields.icon.type:case CARD.editor.fields.tap_action.type:case CARD.editor.fields.double_tap_action.type:case CARD.editor.fields.hold_action.type:case CARD.editor.fields.icon_tap_action.type:case CARD.editor.fields.icon_double_tap_action.type:case CARD.editor.fields.icon_hold_action.type:return s=document.createElement(CARD.editor.fields.tap_action.element),n&&s.classList.add(n),s.style.width=o,Object.assign(s,{id:e,hass:this.#e.hass,schema:l,computeLabel:u=>EntityProgressCardEditor.#p(u,t),data:{}}),this.#o.set(e,s),s;case CARD.editor.fields.layout.type:case CARD.editor.fields.bar_size.type:case CARD.editor.fields.theme.type:case CARD.editor.fields.attribute.type:case CARD.editor.fields.max_value_attribute.type:s=document.createElement(CARD.editor.fields[i].element),s.popperOptions="",this.#_(s,i);break;case CARD.editor.fields.number.type:s=document.createElement(CARD.editor.fields.number.element),s.type=CARD.editor.fields.number.type;break;case CARD.editor.fields.toggle.type:{s=document.createElement(CARD.editor.fields.container.element),s.classList.add(CARD.editor.fields.toggle.class),n?s.classList.add(n):Object.assign(s.style,{display:"flex",alignItems:"center",gap:"8px"});const u=document.createElement(CARD.editor.fields.text.element);u.textContent=t;const d=document.createElement(CARD.editor.fields.toggle.element);return d.setAttribute("checked",!0),d.id=e,s.appendChild(u),s.appendChild(d),this.#o.set(e,d),s}default:s=document.createElement(CARD.editor.fields.default.element),s.type=CARD.editor.fields.default.type;break}return this.#o.set(e,s),s.style.width=o,Object.assign(s,{required:a,label:t,value:c,id:e}),n&&s.classList.add(n),s}static#p(e,t){return t}#_(e,t,i=null){const a=document.createDocumentFragment(),n=[CARD.editor.fields.attribute.type,CARD.editor.fields.max_value_attribute.type].includes(t)?i:FIELD_OPTIONS[t];n&&(n.forEach(o=>{const l=document.createElement(CARD.editor.fields.listItem.element),s=o.value!==void 0?o.value:o;switch(l.setAttribute("value",String(s)),t){case CARD.editor.fields.layout.type:case CARD.editor.fields.theme.type:case CARD.editor.fields.bar_size.type:{const c=LANGUAGES[this.#d].editor.option[t][o.value],u=document.createElement(CARD.editor.fields.iconItem.element);u.setAttribute(CARD.editor.fields.iconItem.attribute,o.icon),u.classList.add(CARD.editor.fields.iconItem.class),l.appendChild(u),l.append(c);break}case CARD.editor.fields.attribute.type:case CARD.editor.fields.max_value_attribute.type:l.innerHTML=`${o.label}`;break;default:throw new Error("Choices: Unknown case")}a.appendChild(l)}),e.replaceChildren(a))}static#b(){const e=document.createElement(CARD.documentation.link.element);e.href=CARD.documentation.link.documentationUrl,e.target=CARD.documentation.link.linkTarget,e.classList.add(CARD.documentation.link.class);const t=document.createElement(CARD.documentation.shape.element);t.classList.add(CARD.documentation.shape.class);const i=document.createElement(CARD.documentation.questionMark.element);return i.classList.add(CARD.documentation.questionMark.class),i.setAttribute("icon",CARD.documentation.questionMark.icon),Object.assign(i.style,CARD.documentation.questionMark.style),t.appendChild(i),e.appendChild(t),e}#g(){[...Object.values(this.editorFields.basicConfiguration),...Object.values(this.editorFields.content.field),...Object.values(this.editorFields.interaction.field),...Object.values(this.editorFields.theme.field)].forEach(t=>{this.#k(t.name,t.type)}),this.#l.forEach((t,i)=>{this.#t.addEventListener(t,CARD.interactions.event.click,()=>{this.toggleAccordion(i)},{passive:!0},`accordionTitle-${i}`)})}#k(e,t){if(!this.#o.get(e)){console.error(`Element ${e} not found!`);return}const i=CARD.editor.fields[t]?.element===CARD.editor.fields.select.element,a=CARD.editor.fields[t]?.element===CARD.editor.fields.toggle.element,n=i?CARD.interactions.event.HASelect:a?CARD.interactions.event.toggle:CARD.interactions.event.other;i&&this.#t.addEventListener(this.#o.get(e),CARD.interactions.event.closed,o=>{o.stopPropagation()},{passive:!0},`close-StopPropa-${e}`),n.forEach(o=>{this.#t.addEventListener(this.#o.get(e),o,this.#S.bind(this),{passive:!0},`${o}-${e}`)})}#S(e){const i=new ConfigUpdateEventHandler(Object.assign({},this.#a)).updateConfig(e);this.#x(i)}#x(e){let t=e;if(e.grid_options){const{grid_options:a,...n}=e;t={...n,grid_options:a}}const i=new CustomEvent(CARD.interactions.event.configChanged,{detail:{config:t},bubbles:!0,composed:!0});this.dispatchEvent(i)}#E(){const e=new Set(["ha-select","ha-textfield"]),t=new Set([CARD.editor.keyMappings.attribute,CARD.editor.keyMappings.max_value_attribute]),i=[];for(const[a,n]of this.#o)if(e.has(n.localName)&&!t.has(a)){const o=this.#C(a,n);o&&i.push(o)}else if(n.localName==="ha-form"){const o=this.#A(n,a,this.#a[a]);o&&i.push(o)}i.forEach(a=>a()),this.#z()}#C(e,t){const i=has.own(this.#a,e)?this.#a[e]:"",a=t.value;return(is.string(a)?a!==String(i):a!==i)?()=>{t.value=i}:null}#A(e,t,i){const a=e.data;return a===void 0||i!==void 0&&a[t]!==i||i===void 0&&a[t]!==void 0?()=>{e.data={...a,[t]:i}}:null}#z(){this.#y(CARD.editor.keyMappings.theme,this.#a.theme!==void 0);const e=this.#v("entity","attribute");this.#y(this.editorFields.basicConfiguration.attribute.isInGroup,!e);const t=this.#v("max_value","max_value_attribute");this.#y(this.editorFields.content.field.max_value_attribute.isInGroup,!t),this.#V()}#y(e,t){this.#i.classList.toggle(`${CARD.style.dynamic.hide}-${e}`,t)}#v(e,t){const i=new EntityOrValue;i.value=this.#a[e];const a=i.attributesListForEditor;if(this.#r[e]!==this.#a[e]&&i.hasAttribute){this.#r[e]=this.#a[e];const n=this.#o.get(t);n&&this.#_(n,t,a)}return this.#a[t]===void 0&&i.hasAttribute&&this.#I(this.#o.get(t),i.defaultAttribute),i.hasAttribute&&has.validKey(i.attributes,this.#a[t])&&this.#o.get(t).value!==this.#a[t]&&(this.#o.get(t).value=this.#a[t]),i.hasAttribute}async#I(e,t){await e.updateComplete,Array.from(e.children).map(a=>a.getAttribute("value")).includes(t)&&(e.value=t)}#V(){const e=this.#a.hide||[],t={toggle_force_circular_background:this.#a.force_circular_background===!0,toggle_unit:this.#a.disable_unit!==!0,toggle_icon:!e.includes("icon"),toggle_name:!e.includes("name"),toggle_value:!e.includes("value"),toggle_secondary_info:!e.includes("secondary_info"),toggle_progress_bar:!e.includes("progress_bar")},i=[];for(const[a,n]of Object.entries(t)){const o=this.#o.get(a);o&&o.checked!==n&&i.push(()=>o.checked=n)}i.forEach(a=>a())}toggleAccordion(e){const t=this.#u[e],i=t.querySelector(".accordion-content");if(!i)return;const a=!t.classList.contains("expanded");this.#t.remove(`accordionTransition-${e}`),a?this.#$(t,i,e):this.#T(t,i,e)}#$(e,t,i){Object.assign(t.style,{display:"flex",maxHeight:"0",paddingTop:"0",paddingBottom:"0",opacity:"0"});const a=t.offsetHeight;e.classList.add("expanded"),requestAnimationFrame(()=>{Object.assign(t.style,{maxHeight:`${t.scrollHeight}px`,paddingTop:"30px",paddingBottom:"30px",opacity:"1"})}),this.#w(t,i,()=>{t.style.maxHeight="none"})}#T(e,t,i){e.classList.add("collapsing"),t.style.maxHeight=`${t.scrollHeight}px`;const a=t.offsetHeight;requestAnimationFrame(()=>{Object.assign(t.style,{maxHeight:"0",paddingTop:"0",paddingBottom:"0",opacity:"0"})}),this.#w(t,i,()=>{e.classList.remove("expanded","collapsing"),Object.assign(t.style,{display:"",maxHeight:"",paddingTop:"",paddingBottom:"",opacity:""})})}#w(e,t,i){this.#t.addEventListener(e,"transitionend",a=>{a.target===e&&(i(),this.#t.remove(`accordionTransition-${t}`))},{passive:!0},`accordionTransition-${t}`)}}class EntityProgressBadgeEditor extends EntityProgressCardEditor{static _editorStyle=`
   ${CARD_EDITOR_CSS}
 
   .hide {
     display: none;
   }`;static _editorFields=(()=>{const e=structuredClone(EntityProgressCardEditor._editorFields),t="hide";return["icon_tap_action","icon_hold_action","icon_double_tap_action","toggleCircular","bar_size","layout"].forEach(a=>{e.interaction?.field?.[a]&&(e.interaction.field[a].isInGroup=t),e.theme?.field?.[a]&&(e.theme.field[a].isInGroup=t)}),e})()}customElements.define(CARD.meta.card.editor,EntityProgressCardEditor),customElements.define(CARD.meta.badge.editor,EntityProgressBadgeEditor);
