//
//  NSObject+Swizzling.h
//  MeicaiStore
//
//  Created by Zack on 2017/6/21.
//  Copyright © 2017年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (Swizzling)

+ (void)swizzleMethod:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;

@end
