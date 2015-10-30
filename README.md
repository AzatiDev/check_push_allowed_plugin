IOS Push notifications availability status plugin
======

> This plugin helps you to check if push notifications is disabled in phone settings

PhoneGap Build
--------------
To include the PushStatus plugin in your PhoneGap Build application, add this to your config.xml:

    <gap:plugin name="com.azati.push_status" />
 
Methods
-------

- navigator.push_status.isPushNotificationsAvailable

Supported Platforms
-------------------

- iOS 7, 8, 9

Quick Example
-------------

    navigator.push_status.isPushNotificationsAvailable(function(result) {
            result = (result.toLowerCase() === 'true');
            if (!result) {
				//notifications disabled
            } else {
				//notifications enabled
            }
        }, function(err) {
			alert(err);
        });


    