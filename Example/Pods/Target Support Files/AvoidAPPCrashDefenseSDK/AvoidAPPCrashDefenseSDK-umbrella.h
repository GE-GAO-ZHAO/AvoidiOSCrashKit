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

#import "NSObject+IMPDefender.h"
#import "NSObject+InterceptingInvalidMethods.h"
#import "NSObject+MethodSwizzling.h"
#import "NSObject+SelectorDefender.h"

FOUNDATION_EXPORT double AvoidAPPCrashDefenseSDKVersionNumber;
FOUNDATION_EXPORT const unsigned char AvoidAPPCrashDefenseSDKVersionString[];

