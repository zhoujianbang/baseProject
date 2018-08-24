//
//  NSMutableAttributedString+Exception.m
//  CrashDemo
//
//  Created by Zack on 2017/6/22.
//  Copyright © 2017年 Bruce. All rights reserved.
//

#import "NSMutableAttributedString+Exception.h"
#import "NSObject+Swizzling.h"

@implementation NSMutableAttributedString (Exception)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("NSConcreteMutableAttributedString") swizzleMethod:@selector(replaceCharactersInRange:withString:) swizzledSelector:@selector(alert_replaceCharactersInRange:withString:)];
        }
    });
}

- (void)alert_replaceCharactersInRange:(NSRange)range withString:(NSString *)aString {
    if ((range.location + range.length) > self.length) {
        NSAssert(NO, @"what the fuck!!!");
        return;
    }
    if (!aString) {
        NSAssert(NO, @"what the fuck!!!");
        return;
    }
    return [self alert_replaceCharactersInRange:range withString:aString];
}
@end
