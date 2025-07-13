/*
 * View model for OctoPrint-Remote_connection
 *
 * Author: Malte Starostik
 * License: AGPL-3.0-or-later
 */
$(function() {
    function RemoteConnectionSettingsModel(parameters) {
        var self = this;

        self.settingsViewModel = parameters[0];

        self.remotes = ko.observableArray([]);

        self.addRemote = function() {
            self.remotes.push({
                host: "",
                port: 0,
                protocol: "socket"
            });
        }

        self.removeRemote = function(remote) {
            self.remotes.remove(remote);
        };

        self.onBeforeBinding = function() {
            self.remotes(self.settingsViewModel.settings.plugins.remote_connection.remotes());
        };
    }

    OCTOPRINT_VIEWMODELS.push([
        RemoteConnectionSettingsModel,
        [ "settingsViewModel" ],
        [ "#settings_plugin_remote_connection" ]
    ]);
});
