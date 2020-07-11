//
//  NSObject+MethodSwizzling.h
//  ios-resolveMehtods-forwardMessage-Demo
//
//  Created by xes on 2020/7/3.
//  Copyright © 2020 xes. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MethodSwizzling)

/**
 * @des 交换两个类方法的实现
 *
 * @param originalSelector  原始方法的 SEL
 * @param swizzledSelector  交换方法的 SEL
 * @param targetClass  类
 */
+ (void)talDefenderSwizzlingClassMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector withClass:(Class)targetClass;

/**
 * @des 交换两个对象方法的实现
 *
 * @param originalSelector  原始方法的 SEL
 * @param swizzledSelector 交换方法的 SEL
 * @param targetClass  类
 */
+ (void)talDefenderSwizzlingInstanceMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector withClass:(Class)targetClass;


@end

NS_ASSUME_NONNULL_END
