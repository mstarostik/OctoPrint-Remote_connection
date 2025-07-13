#
# OctoPrint-Remote_connection plugin
# 
# Author: Malte Starostik
# License: AGPL-3.0-or-later

import octoprint.plugin
import serial

from octoprint.util.comm import BufferedReadlineWrapper

class RemoteConnectionPlugin(octoprint.plugin.SettingsPlugin, octoprint.plugin.AssetPlugin, octoprint.plugin.TemplatePlugin):
    def get_settings_defaults(self):
        return {
            "remotes": []
        }

    def get_assets(self):
        return dict(
            js=["js/remote_connection.js"]
        )

    def is_template_autoescaped(self):
        return True

    def get_update_information(self):
        return {
            "remote_connection": {
                "displayName": "Remote Connection Plugin",
                "displayVersion": self._plugin_version,

                # version check: github repository
                "type": "github_release",
                "user": "mstarostik",
                "repo": "OctoPrint-Remote_connection",
                "current": self._plugin_version,

                # update method: pip
                "pip": "https://github.com/mstarostik/OctoPrint-Remote_connection/archive/{target_version}.zip",
            }
        }

    def get_additional_port_names(self, candidates, *args, **kwargs):
        return [
            f"REMOTE:{remote['protocol']}://{remote['host']}:{remote['port']}" for remote in self._settings.get(["remotes"]) 
        ]

    def remote_connection_factory(self, comm_instance, port, baudrate, read_timeout):
        if not port.startswith("REMOTE:"):
            return None

        args = {
            "baudrate": baudrate,
            "timeout": read_timeout
        }

        return BufferedReadlineWrapper(serial.serial_for_url(port[7:], **args))


__plugin_name__ = "Remote Connection"
__plugin_author__ = "Malte Starostik"
__plugin_pythoncompat__ = ">=3.7,<4"

def __plugin_load__():
    global __plugin_implementation__
    __plugin_implementation__ = RemoteConnectionPlugin()

    global __plugin_hooks__
    __plugin_hooks__ = {
        "octoprint.plugin.softwareupdate.check_config": __plugin_implementation__.get_update_information,
        "octoprint.comm.transport.serial.additional_port_names": __plugin_implementation__.get_additional_port_names,
        "octoprint.comm.transport.serial.factory": __plugin_implementation__.remote_connection_factory
    }
