#import "FlutterAppsCoreLibPlugin.h"
#if __has_include(<flutter_apps_core_lib/flutter_apps_core_lib-Swift.h>)
#import <flutter_apps_core_lib/flutter_apps_core_lib-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_apps_core_lib-Swift.h"
#endif

@implementation FlutterAppsCoreLibPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterAppsCoreLibPlugin registerWithRegistrar:registrar];
}
@end
