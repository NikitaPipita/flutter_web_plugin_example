#import "FlutterWebPluginExamplePlugin.h"
#if __has_include(<flutter_web_plugin_example/flutter_web_plugin_example-Swift.h>)
#import <flutter_web_plugin_example/flutter_web_plugin_example-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_web_plugin_example-Swift.h"
#endif

@implementation FlutterWebPluginExamplePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterWebPluginExamplePlugin registerWithRegistrar:registrar];
}
@end
