//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_archive/FlutterArchivePlugin.h>)
#import <flutter_archive/FlutterArchivePlugin.h>
#else
@import flutter_archive;
#endif

#if __has_include(<path_provider/FLTPathProviderPlugin.h>)
#import <path_provider/FLTPathProviderPlugin.h>
#else
@import path_provider;
#endif

#if __has_include(<unrar_file/UnrarFilePlugin.h>)
#import <unrar_file/UnrarFilePlugin.h>
#else
@import unrar_file;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterArchivePlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterArchivePlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [UnrarFilePlugin registerWithRegistrar:[registry registrarForPlugin:@"UnrarFilePlugin"]];
}

@end
