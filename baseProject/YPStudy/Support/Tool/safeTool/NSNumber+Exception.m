//
//  NSNumber+Exception.m
//  CrashDemo
//
//  Created by Zack on 2017/6/21.
//  Copyright © 2017年 Bruce. All rights reserved.
//

#import "NSNumber+Exception.h"

@implementation NSNumber (Exception)


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("NSNumber") swizzleMethod:@selector(length) swizzledSelector:@selector(replace_length)];
        }
    });
}

- (NSInteger)replace_length {
    NSAssert(NO, @"what the fuck!!!");
    return 0;
}

@end
