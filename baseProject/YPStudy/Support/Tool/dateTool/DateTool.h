//
//  DateTool.h
//  FrameworkProject
//
//  Created by 陈哲是个好孩子 on 15/8/4.
//  Copyright (c) 2015年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

/*
 基本Date转换工具类
 */

#import <Foundation/Foundation.h>

@interface DateTool : NSObject

/**
 *  获取DateFormmater实例
 *
 *  @return
 */
+(DateTool *)shareDateFommat;

/**
 *  获取特定格式下的日期( yyyy-MM-dd )
 *
 *  @param date 日期date
 *
 *  @return
 */
-(NSString *)getYearStringByDate:(NSDate *)date;


/**
 *  获取特定字符串下面日期( yyyy-MM-dd )
 *
 *  @param dateString date字符串
 *
 *  @return
 */
-(NSDate *)getYearDateByString:(NSString *)dateString;

/**
 *  获取特定格式下的时间( HH:mm:ss )
 *
 *  @param date 时间date
 *
 *  @return
 */
-(NSString *)getTimeStringByDate:(NSDate *)date;


/**
 *  获取特定字符串下面时间( HH:mm:ss )
 *
 *  @param date 时间date字符串
 *
 *  @return
 */
-(NSDate *)getTimeDateByString:(NSString *)dateString;

/**
 *  获取特定格式下的时间( yyyy-MM-dd HH:mm:ss )
 *
 *  @param date date
 *
 *  @return
 */
-(NSString *)getYearAndTimeStringByDate:(NSDate *)date;

/**
 *  获取特定字符串下面时间( yyyy-MM-dd HH:mm:ss )
 *
 *  @param date date字符串
 *
 *  @return
 */
-(NSDate *)getYearAndTimeDateByString:(NSString *)dateString;
/**
 *  通过时间戳获取特定的时间格式（yyyy-MM-dd）
 *
 *  @param timestamp 时间戳
 *
 *  @return
 */
- (NSString *)getFommatYearStringByTimeStamp:(NSString *)timestamp;
/**
 *  传入指定时间获取指定格式dateFommat下的时间字符串
 *
 *  @param fommat 显示格式
 *  @param date   时间date
 *
 *  @return
 */
-(NSString *)getStringByDateFormat:(NSString *)dateFommat andDate:(NSDate *)date;

/**
 *  传入时间字符串获取指定格式dateFommat下的时间Date对象
 *
 *  @param fommat 显示格式
 *  @param date   时间date
 *
 *  @return
 */
-(NSDate *)getStringByDateFormat:(NSString *)dateFommat andString:(NSString *)dateString;

/**
 *  获取当前时区与GMT时区间隔时间
 *
 *  @return
 */
-(NSTimeInterval)getCurrentZoneInterval;
/**
 *  获取某个时间与当前时间间隔天数
 *  @param  date(yyyy-MM-dd)
 *  @return
 */
- (NSInteger)getTimeIntervalSinceNow:(NSString *)date;

/**
 将UTC时间转换为现在的时间

 @param UTCDate utc时间
 */
- (NSDate *)getNowDateFromUTCDate:(NSDate *)UTCDate;

-(NSString *)getTaskYearStringByDate:(NSDate *)date;

@end
