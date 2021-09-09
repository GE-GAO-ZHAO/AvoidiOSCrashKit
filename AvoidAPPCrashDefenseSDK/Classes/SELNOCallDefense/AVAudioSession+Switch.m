//
//  AVAudioSession+Switch.m
//  ZegoLiveWithRongCloud
//
//  Created by Sky on 2019/9/20.
//  Copyright © 2019 zego. All rights reserved.
//

#import "AVAudioSession+Switch.h"
#import <objc/runtime.h>

@implementation AVAudioSession (Switch)

+ (void)load {
    BOOL res = [self swizzleMethod:AVAudioSession.class orgSel:@selector(setCategory:error:) swizzSel:@selector(zg_setCategory:error:)];
    res = [self swizzleMethod:AVAudioSession.class orgSel:@selector(setCategory:withOptions:error:) swizzSel:@selector(zg_setCategory:withOptions:error:)];
    res = [self swizzleMethod:AVAudioSession.class orgSel:@selector(setCategory:mode:options:error:) swizzSel:@selector(zg_setCategory:mode:options:error:)];
    res = [self swizzleMethod:AVAudioSession.class orgSel:@selector(setMode:error:) swizzSel:@selector(zg_setMode:error:)];
    res = [self swizzleMethod:AVAudioSession.class orgSel:@selector(setActive:error:) swizzSel:@selector(zg_setActive:error:)];
    res = [self swizzleMethod:AVAudioSession.class orgSel:@selector(setActive:withOptions:error:) swizzSel:@selector(zg_setActive:withOptions:error:)];
    res = [self swizzleMethod:AVAudioSession.class orgSel:@selector(activateWithOptions:completionHandler:) swizzSel:@selector(zg_activateWithOptions:completionHandler:)];
    NSLog(@"交换方法:%d",res);
}

+ (BOOL)swizzleMethod:(Class)class orgSel:(SEL)origSel swizzSel:(SEL)altSel {
    Method origMethod = class_getInstanceMethod(class, origSel);
    Method altMethod = class_getInstanceMethod(class, altSel);
    if (!origMethod || !altMethod) {
        return NO;
    }
    BOOL didAddMethod = class_addMethod(class,origSel,
                                        method_getImplementation(altMethod),
                                        method_getTypeEncoding(altMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,altSel,
                            method_getImplementation(origMethod),
                            method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, altMethod);
    }
    
    return YES;
}

- (BOOL)zg_setCategory:(AVAudioSessionCategory)category error:(NSError * _Nullable __autoreleasing *)outError {
    NSLog(@"调用:setCategory:%@,error:", category);
    NSLog(@"%@", [NSThread callStackSymbols]);
    return [self zg_setCategory:category error:outError];
}

- (BOOL)zg_setCategory:(AVAudioSessionCategory)category withOptions:(AVAudioSessionCategoryOptions)options error:(NSError *__autoreleasing  _Nullable *)outError {
    NSLog(@"调用:setCategory:%@withOptions:%d, error:", category, (int)options);
    NSLog(@"%@", [NSThread callStackSymbols]);
    return [self zg_setCategory:category withOptions:options error:outError];
}

- (BOOL)zg_setCategory:(AVAudioSessionCategory)category mode:(AVAudioSessionMode)mode options:(AVAudioSessionCategoryOptions)options error:(NSError *__autoreleasing  _Nullable *)outError {
    NSLog(@"调用:setCategory:%@,mode:%d,options:%d,error:", category, (int)mode, (int)options);
    NSLog(@"%@", [NSThread callStackSymbols]);
    return [self zg_setCategory:category mode:mode options:options error:outError];
}

- (BOOL)zg_setMode:(AVAudioSessionMode)mode error:(NSError *__autoreleasing  _Nullable *)outError {
    NSLog(@"调用:setMode:%d,error:", (int)mode);
    NSLog(@"%@", [NSThread callStackSymbols]);
    return [self zg_setMode:mode error:outError];
}

- (BOOL)zg_setActive:(BOOL)active error:(NSError *__autoreleasing  _Nullable *)outError {
    NSLog(@"调用:setActive:%d,error:", active);
    NSLog(@"%@", [NSThread callStackSymbols]);
    return [self zg_setActive:active error:outError];
}

- (BOOL)zg_setActive:(BOOL)active withOptions:(AVAudioSessionSetActiveOptions)options error:(NSError *__autoreleasing  _Nullable *)outError {
    NSLog(@"调用:setActive:%d,withOptions:%d,error:", active, (int)options);
    NSLog(@"%@", [NSThread callStackSymbols]);
    return [self zg_setActive:active withOptions:options error:outError];
}

- (void)zg_activateWithOptions:(AVAudioSessionActivationOptions)options completionHandler:(void (^)(BOOL activated, NSError * _Nullable error))handler {
    NSLog(@"调用:activateWithOptions:%d,completionHandler:", (int)options);
    NSLog(@"%@", [NSThread callStackSymbols]);
    [self zg_activateWithOptions:options completionHandler:handler];
}

@end
