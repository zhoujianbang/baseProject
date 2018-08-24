//
//  NSString+Exception.m
//  CrashDemo
//
//  Created by Zack on 2017/6/22.
//  Copyright © 2017年 Bruce. All rights reserved.
//

#import "NSString+Exception.h"
#import "NSObject+Swizzling.h"

@implementation NSString (Exception)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSCFConstantString") swizzleMethod:@selector(substringFromIndex:) swizzledSelector:@selector(replace_NSCFConstantString_substringFromIndex:)];
            [objc_getClass("__NSCFConstantString") swizzleMethod:@selector(substringToIndex:) swizzledSelector:@selector(replace_NSCFConstantString_substringToIndex:)];
            [objc_getClass("__NSCFConstantString") swizzleMethod:@selector(substringWithRange:) swizzledSelector:@selector(replace_NSCFConstantString_substringWithRange:)];
            [objc_getClass("__NSCFConstantString") swizzleMethod:@selector(rangeOfString:options:range:locale:) swizzledSelector:@selector(replace_NSCFConstantString_rangeOfString:options:range:locale:)];
            
            
            [objc_getClass("NSTaggedPointerString") swizzleMethod:@selector(substringFromIndex:) swizzledSelector:@selector(replace_NSTaggedPointerString_substringFromIndex:)];
            [objc_getClass("NSTaggedPointerString") swizzleMethod:@selector(substringToIndex:) swizzledSelector:@selector(replace_NSTaggedPointerString_substringToIndex:)];
            [objc_getClass("NSTaggedPointerString") swizzleMethod:@selector(substringWithRange:) swizzledSelector:@selector(replace_NSTaggedPointerString_substringWithRange:)];
            [objc_getClass("NSTaggedPointerString") swizzleMethod:@selector(rangeOfString:options:range:locale:) swizzledSelector:@selector(replace_NSTaggedPointerString_rangeOfString:options:range:locale:)];
            
            
        }
    });
}

- (NSString*)replace_NSCFConstantString_substringFromIndex:(NSInteger)from{
    // 保证有数据返回
    NSUInteger fromIndex = MIN(self.length, from);
    return [self replace_NSCFConstantString_substringFromIndex:fromIndex];
    
}
- (NSString*)replace_NSCFConstantString_substringToIndex:(NSUInteger)to {
    // 保证有数据返回
    NSUInteger toIndex = MIN(self.length, to);
    return [self replace_NSCFConstantString_substringToIndex:toIndex];
}

- (NSString *)replace_NSCFConstantString_substringWithRange:(NSRange)range{
    if (range.location > self.length) {
        NSAssert(NO, @"what the fuck!!!");
        return nil;
    }
    if (range.length > self.length) {
        NSAssert(NO, @"what the fuck!!!");
        return nil;
    }
    if ((range.location + range.length) > self.length) {
        NSAssert(NO, @"what the fuck!!!");
        return nil;
    }
    return [self replace_NSCFConstantString_substringWithRange:range];
    
}

- (NSRange)replace_NSCFConstantString_rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch locale:(nullable NSLocale *)locale{
    if (!searchString) {
        return NSMakeRange(0, 0);
    }
    if ((rangeOfReceiverToSearch.location + rangeOfReceiverToSearch.length) > self.length) {
        return NSMakeRange(0, 0);
    }
    return [self replace_NSCFConstantString_rangeOfString:searchString options:mask range:rangeOfReceiverToSearch locale:locale];
}


- (NSString*)replace_NSTaggedPointerString_substringFromIndex:(NSInteger)from{
    // 保证有数据返回
    NSUInteger fromIndex = MIN(self.length, from);
    return [self replace_NSTaggedPointerString_substringFromIndex:fromIndex];
    
}
- (NSString*)replace_NSTaggedPointerString_substringToIndex:(NSUInteger)to {
    // 保证有数据返回
    NSUInteger toIndex = MIN(self.length, to);
    return [self replace_NSTaggedPointerString_substringToIndex:toIndex];
}

- (NSString *)replace_NSTaggedPointerString_substringWithRange:(NSRange)range{
    if (range.location > self.length) {
        NSAssert(NO, @"what the fuck!!!");
        return nil;
    }
    if (range.length > self.length) {
        NSAssert(NO, @"what the fuck!!!");
        return nil;
    }
    if ((range.location + range.length) > self.length) {
        NSAssert(NO, @"what the fuck!!!");
        return nil;
    }
    return [self replace_NSTaggedPointerString_substringWithRange:range];
    
}

- (NSRange)replace_NSTaggedPointerString_rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch locale:(nullable NSLocale *)locale{
    if (!searchString) {
        return NSMakeRange(0, 0);
    }
    if ((rangeOfReceiverToSearch.location + rangeOfReceiverToSearch.length) > self.length) {
        return NSMakeRange(0, 0);
    }
    return [self replace_NSTaggedPointerString_rangeOfString:searchString options:mask range:rangeOfReceiverToSearch locale:locale];
}

@end
