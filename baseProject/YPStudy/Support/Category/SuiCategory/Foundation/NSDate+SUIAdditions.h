//
//  NSDate+SUIAdditions.h
//  SUIUtilsDemo
//
//  Created by RandomSuio on 16/2/16.
//  Copyright © 2016年 RandomSuio. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (SUIAdditions)


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Prehash
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Prehash

@property (readonly) NSTimeInterval sui_toTime;

/**
 NSdate实例对象同当前时间相比，是否超过特定时间间隔
 
 @param timeGap 时间价格
 @return 是否超时
 */
- (BOOL)isTimeoutCompareWithCurrentTimeWithTimeGap:(NSTimeInterval)timeGap;












@end

NS_ASSUME_NONNULL_END
