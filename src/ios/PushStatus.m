#import "PushStatus.h"

@implementation PushStatus

- (void)greet:(CDVInvokedUrlCommand*)command
{

    NSString* callbackId = [command callbackId];
    NSString* name = [[command arguments] objectAtIndex:0];
    NSString* msg = [NSString stringWithFormat: @"Hello, %@", name];

    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:msg];

    [self success:result callbackId:callbackId];
}

- (void)isPushNotificationsAvailabale:(CDVInvokedUrlCommand*)command
{
	UIApplication *application = [UIApplication sharedApplication];
	CDVPluginResult* pluginResult = nil;
	BOOL isEnabled;

	if ([application respondsToSelector:@selector(currentUserNotificationSettings)]){
		UIUserNotificationSettings *notificationSettings = [[UIApplication sharedApplication] currentUserNotificationSettings];

		if (!notificationSettings || (notificationSettings.types == UIUserNotificationTypeNone)) {
		isEnabled = NO;
		} else {
		isEnabled = YES;
		}
		NSString* msg = [NSString stringWithFormat: @"first Is Enabled, %@", isEnabled];
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:msg];
	}
	else if ([application respondsToSelector:@selector(isRegisteredForRemoteNotifications)])
	{
		isEnabled = [application isRegisteredForRemoteNotifications];
		NSString* msg = [NSString stringWithFormat: @"second Is Enabled, %@", isEnabled];
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:msg];
	}
	else if([application respondsToSelector:@selector(enabledRemoteNotificationTypes)])
	{
		UIRemoteNotificationType types = [application enabledRemoteNotificationTypes];
		isEnabled = types & UIRemoteNotificationTypeAlert;
		NSString* msg = [NSString stringWithFormat: @"third Is Enabled, %@", isEnabled];
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:msg];
	} else {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Such platform is not supported"];
	}
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end