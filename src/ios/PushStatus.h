#import <Cordova/CDV.h>

@interface PushStatus : CDVPlugin

- (void) isPushNotificationsAvailabale:(CDVInvokedUrlCommand*)command;

@end