//
//  NSDate+SUIAdditions.m
//  SUIUtilsDemo
//
//  Created by RandomSuio on 16/2/16.
//  Copyright © 2016年 RandomSuio. All rights reserved.
//

#import "NSDate+SUIAdditions.h"

@implementation NSDate (SUIAdditions)


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Prehash
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Prehash

- (NSTimeInterval)sui_toTime
{
    return [self timeIntervalSince1970];
}


/**
 NSdate实例对象同当前时间相比，是否超过特定时间间隔

 @param timeGap 时间价格
 @return 是否超时
 */
- (BOOL)isTimeoutCompareWithCurrentTimeWithTimeGap:(NSTimeInterval)timeGap{
    BOOL isOver = NO;
    NSTimeInterval  currentDate = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval  preDate = [self timeIntervalSince1970];
    double distanceTime = currentDate - preDate;
    if (distanceTime > timeGap) {
        isOver = YES;
    }
    return isOver;
}







@end
