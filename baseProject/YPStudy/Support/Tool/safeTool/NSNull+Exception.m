//
//  NSNull+Exception.m
//  CrashDemo
//
//  Created by Zack on 2017/6/22.
//  Copyright © 2017年 Bruce. All rights reserved.
//

#import "NSNull+Exception.h"
#import "NSObject+Swizzling.h"

@implementation NSNull (Exception)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("NSNull") swizzleMethod:@selector(length) swizzledSelector:@selector(replace_length)];
            [objc_getClass("NSNull") swizzleMethod:@selector(integerValue) swizzledSelector:@selector(replace_integerValue)];
            [objc_getClass("NSNull") swizzleMethod:@selector(objectForKey:) swizzledSelector:@selector(replace_objectForKey:)];
            [objc_getClass("NSNull") swizzleMethod:@selector(objectAtIndex:) swizzledSelector:@selector(replace_objectAtIndex:)];
        }
    });
}

- (NSInteger)replace_length {
    NSAssert(NO, @"what the fuck!!!");
    return 0;
}

- (NSInteger)replace_integerValue {
    NSAssert(NO, @"what the fuck!!!");
    return 0;
}

- (id)replace_objectForKey:(id)key{
    NSAssert(NO, @"what the fuck!!!");
    return nil;
}

- (id)replace_objectAtIndex:(NSInteger)index{
    NSAssert(NO, @"what the fuck!!!");
    return nil;
}

@end
