/*global cordova, module*/

module.exports = {
    greet: function (name, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "PushStatus", "greet", [name]);
    },
    isPushNotificationsAvailabale: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "PushStatus", "isPushNotificationsAvailabale");
    }
};
