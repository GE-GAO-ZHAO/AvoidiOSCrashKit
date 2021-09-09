//
//  Zombie.m
//  AvoidAPPCrashDefenseSDK
//
//  Created by 葛高召 on 2021/7/25.
//

#import "Zombie.h"

@implementation Zombie

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"[僵尸对象：%p 调用了函数： %@]",self,NSStringFromSelector(aSelector));
    return [[NSObject new] methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [anInvocation invokeWithTarget:[NSObject new]];
}

@end
