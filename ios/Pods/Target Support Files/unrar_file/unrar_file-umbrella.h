#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "UnrarFilePlugin.h"

FOUNDATION_EXPORT double unrar_fileVersionNumber;
FOUNDATION_EXPORT const unsigned char unrar_fileVersionString[];

