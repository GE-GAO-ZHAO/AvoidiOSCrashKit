//
//  NSObject+InterceptingInvalidMethods.m
//  AvoidAPPCrashDefenseSDK
//
//  Created by 葛高召 on 2021/6/19.
//

#import "NSObject+InterceptingInvalidMethods.h"

@implementation NSObject (InterceptingInvalidMethods)

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if ([self respondsToSelector:aSelector]) {
        return [self methodSignatureForSelector:aSelector];
    }
    return [NSMethodSignature methodSignatureForSelector:@"v@:"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"找不到%@方法",NSStringFromSelector(anInvocation.selector));
}

@end

