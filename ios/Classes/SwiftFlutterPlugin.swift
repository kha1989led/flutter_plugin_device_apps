import Flutter
import UIKit
    
public class SwiftFlutterPlugin: NSObject, Flutter.FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    FlutterMethodChannel* channel = [FlutterMethodChannel
          methodChannelWithName:@"g123k/device_apps"
                binaryMessenger:[registrar messenger]];
      DeviceAppsPlugin* instance = [[DeviceAppsPlugin alloc] init];
      [registrar addMethodCallDelegate:instance channel:channel];
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    var uriSchema = ""
    let arguments = call.arguments as? NSDictionary
    switch call.method {
      case "checkAvailability":
        uriSchema = (arguments!["uri"] as? String)!
        result(checkAvailability(uri: uriSchema))
        break
      case "launchApp":
        uriSchema = (arguments!["uri"] as? String)!
        launchApp(uri: uriSchema, result: result)
        break
      default:
        break
    }
  }
  
  public func checkAvailability (uri: String) -> Bool {
    let url = URL(string: uri)
    return UIApplication.shared.canOpenURL(url!)
  }
  
  public func launchApp (uri: String, result: @escaping FlutterResult) {
    let url = URL(string: uri)
    if (checkAvailability(uri: uri)) {
      UIApplication.shared.openURL(url!)
      result(true)
    }
    result(false)
  }
  
}
