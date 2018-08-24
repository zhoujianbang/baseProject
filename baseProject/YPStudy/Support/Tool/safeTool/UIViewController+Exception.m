//
//  UIViewController+Exception.m
//  MeicaiStore
//
//  Created by Zack on 2017/12/27.
//  Copyright © 2017年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import "UIViewController+Exception.h"
#import "NSObject+Swizzling.h"

@implementation UIViewController (Exception)

#ifdef DEBUG
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("UIViewController") swizzleMethod:NSSelectorFromString(@"dealloc")  swizzledSelector:@selector(replace_dealloc)];
        }
    });
}


- (void)replace_dealloc
{
    Log(@"Dealloc: %@",self);
    return [self replace_dealloc];
}

#endif

@end
