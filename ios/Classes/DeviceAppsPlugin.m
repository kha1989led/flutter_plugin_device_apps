#import "DeviceAppsPlugin.h"

@implementation AppAvailability : NSObject
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"g123k/device_apps"
            binaryMessenger:[registrar messenger]];
  DeviceAppsPlugin* instance = [[DeviceAppsPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
  [SwiftFlutterPlugin registerWithRegistrar:registrar];
}
@end
