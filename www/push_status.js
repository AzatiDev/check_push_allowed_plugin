/*global cordova, module*/

module.exports = {
    isPushNotificationsAvailabale: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "PushStatus", "isPushNotificationsAvailabale");
    }
};
