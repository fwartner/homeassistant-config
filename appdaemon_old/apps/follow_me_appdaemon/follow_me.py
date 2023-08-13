import appdaemon.plugins.hass.hassapi as hass

# Simple app to have entities follow the state of another

class Follow(hass.Hass):
    def initialize(self):
        for entity in self.split_device_list(self.args["leader"]):
            self.listen_state(self.state_change, entity)

        # Defaults
        self.delay = 0
        self.invert = False
        self.follow_on = True
        self.follow_off = True

        if "delay" in self.args:
            self.delay = int(self.args["delay"])

        if "invert" in self.args and self.args["invert"] == True:
            self.invert = True

        if "follow_on" in self.args:
            self.follow_on = self.args["follow_on"]

        if "follow_off" in self.args:
            self.follow_off = self.args["follow_off"]

    def turn_on_handler(self, kwargs):
        self.turn_on(kwargs["entity_id"])

    def turn_off_handler(self, kwargs):
        self.turn_off(kwargs["entity_id"])

    def state_change(self, entity, attribute, old, new, kwargs):
        if new == "on" and old != "unavailable" and old != "Unavailable":
            if not self.follow_on:
                return

            for device in self.split_device_list(self.args["follower"]):
                if self.invert:
                    self.log(f"Turning off {device}{f' in {self.delay} seconds' if self.delay > 0 else ''}")
                    self.run_in(self.turn_off_handler, self.delay, entity_id=device)
                else:
                    self.log(f"Turning on {device}{f' in {self.delay} seconds' if self.delay > 0 else ''}")
                    self.run_in(self.turn_on_handler, self.delay, entity_id=device)

        elif new == "off" and old != "unavailable" and old != "Unavailable":
            if not self.follow_off:
                return

            for device in self.split_device_list(self.args["follower"]):
                if self.invert:
                    self.log(f"Turning on {device}{f' in {self.delay} seconds' if self.delay > 0 else ''}")
                    self.run_in(self.turn_on_handler, self.delay, entity_id=device)
                else:
                    self.log(f"Turning off {device}{f' in {self.delay} seconds' if self.delay > 0 else ''}")
                    self.run_in(self.turn_off_handler, self.delay, entity_id=device)
