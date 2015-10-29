#import <Cordova/CDV.h>

@interface PushStatus : CDVPlugin

- (void) greet:(CDVInvokedUrlCommand*)command;
- (void) isPushNotificationsAvailabale:(CDVInvokedUrlCommand*)command;

@end