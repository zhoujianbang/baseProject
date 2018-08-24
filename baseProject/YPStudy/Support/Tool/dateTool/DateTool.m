//
//  DateTool.m
//  FrameworkProject
//
//  Created by 陈哲是个好孩子 on 15/8/4.
//  Copyright (c) 2015年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import "DateTool.h"

static NSDateFormatter * fommat = nil;

@implementation DateTool

+(DateTool *)shareDateFommat
{
    static DateTool * dateTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateTool = [[DateTool alloc] init];
        fommat = [[NSDateFormatter alloc] init];
    });
    
    return dateTool;
}

-(NSString *)getYearStringByDate:(NSDate *)date
{
    return [self getStringByDateFormat:@"yyyy-MM-dd" andDate:date];
}
-(NSString *)getTaskYearStringByDate:(NSDate *)date
{
    return [self getStringByDateFormat:@"yyyyMMdd" andDate:date];
}
-(NSDate *)getYearDateByString:(NSString *)dateString
{
    return [self getStringByDateFormat:@"yyyy-MM-dd" andString:dateString];
}

-(NSString *)getTimeStringByDate:(NSDate *)date
{
    return [self getStringByDateFormat:@"HH:mm:ss" andDate:date];
}

-(NSDate *)getTimeDateByString:(NSString *)dateString
{
    return [self getStringByDateFormat:@"HH:mm:ss" andString:dateString];
}

-(NSString *)getYearAndTimeStringByDate:(NSDate *)date
{
    return [self getStringByDateFormat:@"yyyy-MM-dd HH:mm:ss" andDate:date];
}

-(NSDate *)getYearAndTimeDateByString:(NSString *)dateString
{
    return [self getStringByDateFormat:@"yyyy-MM-dd HH:mm:ss" andString:dateString];
}

- (NSString *)getFommatYearStringByTimeStamp:(NSString *)timestamp{
    return [self getYearStringByDate:[NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]]];
}
-(NSString *)getStringByDateFormat:(NSString *)dateFommat andDate:(NSDate *)date
{
    [fommat setDateFormat:dateFommat];
    return [fommat stringFromDate:date];
}

-(NSDate *)getStringByDateFormat:(NSString *)dateFommat andString:(NSString *)dateString
{
    [fommat setDateFormat:dateFommat];
    return [[fommat dateFromString:dateString] dateByAddingTimeInterval:[self getCurrentZoneInterval]];
}

-(NSTimeInterval)getCurrentZoneInterval
{
    NSTimeZone * timeZone = [NSTimeZone systemTimeZone];
    NSInteger interval = [timeZone secondsFromGMTForDate:[NSDate date]];
    return interval;
}
- (NSInteger)getTimeIntervalSinceNow:(NSString *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy.MM.dd"];
    
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    
    NSDate *today = [dateFormatter dateFromString:[dateFormatter stringFromDate:[NSDate date]]];
    
    NSDate *startDate = [self getYearDateByString:date];
    
    NSDate *formatterStartDate = [dateFormatter dateFromString:[dateFormatter stringFromDate:startDate]];
    
    NSTimeInterval interval = [today timeIntervalSinceDate:formatterStartDate];
    
    NSInteger days = abs((int)interval)/(3600*24);
    
    return days;

}

- (NSDate *)getNowDateFromUTCDate:(NSDate *)UTCDate
{
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:UTCDate];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:UTCDate];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:UTCDate];
    return destinationDateNow;
}

@end
