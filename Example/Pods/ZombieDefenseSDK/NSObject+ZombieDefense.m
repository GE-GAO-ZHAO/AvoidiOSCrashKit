//
//  NSObject+ZombieDefense.m
//  AvoidAPPCrashDefenseSDK
//
//  Created by 葛高召 on 2021/7/25.
//

#import "NSObject+ZombieDefense.h"
#import <objc/runtime.h>
#import "Zombie.h"

@implementation NSObject (ZombieDefense)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        //reday
        SEL originSel = NSSelectorFromString(@"dealloc");
        SEL swizzleSel = NSSelectorFromString(@"swizzleDealloc");
        Method originMethod = class_getInstanceMethod(class, originSel);
        Method swizzleMethod = class_getInstanceMethod(class, swizzleSel);
        
        //swizzling
        BOOL addMethod = class_addMethod(class, swizzleSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
        if (addMethod) {
            class_replaceMethod(class, swizzleSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        } else {
            method_exchangeImplementations(originMethod, swizzleMethod);
        }
    });
}


- (void)swizzleDealloc {
    object_setClass(self, [Zombie class]);
}

@end
