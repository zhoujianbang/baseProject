//
//  NSString+Categorys.m
//  MCBasicComponent
//
//  Created by 陈哲是个好孩子 on 15/8/3.
//  Copyright (c) 2015年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import "NSString+Categorys.h"

@implementation NSString (Verify)
+(NSString *)getStringWithObj:(id)obj
{
    if ([obj isKindOfClass:[NSNumber class]])
    {
        return [NSString stringWithFormat:@"%@",obj];
    }
    else if ([obj isKindOfClass:[NSString class]])
    {
        return obj;
    }
    else
    {
        return nil;
    }
}
- (BOOL)hasContent{
    return self.length && !kNilOrNull(self);
}
- (NSString *)URLEncodedString
{
    NSString *newString =
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)self,
                                                              NULL,
                                                              CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding)));
    if (newString) {
        return newString;
    }
    
    return self;}
@end

@implementation NSString (JSONValue)

+(NSData *)jsonDataWithJSONObj:(id)jsonObj
{
    if (jsonObj == nil)
    {
        return nil;
    }
    NSError * err = nil;
    NSData * data = [NSJSONSerialization dataWithJSONObject:jsonObj options:NSJSONWritingPrettyPrinted error:&err];
    if (data.length > 0 && err == nil)
    {
        return data;
    }
    return nil;
}

-(id)jsonIdWithJSONString
{
    if (self == nil || self.length == 0)
    {
        return nil;
    }
    NSError * err = nil;
    id data = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:&err];
    if (data != nil && err == nil)
    {
        return data;
    }
    return nil;
}


@end


@implementation NSString (AttributString)

-(NSMutableAttributedString *)addCustomAttributeFont:(UIFont *)font andColor:(UIColor *)color andRange:(NSRange)range
{
    NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc]initWithString:self];
    if (font)
    {
        [attStr addAttribute:NSFontAttributeName value:font range:range];
    }
    if (color)
    {
        [attStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    return attStr;
}

-(NSMutableAttributedString *)addCustomAttributeFont:(UIFont *)font andColor:(UIColor *)color andText:(NSString *)searchText
{
    if ([self rangeOfString:searchText].location == NSNotFound)
    {
        return [[NSMutableAttributedString alloc]initWithString:self];
    }
    NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc]initWithString:self];
    NSMutableArray * mutaArr = [NSMutableArray array];
    NSRange searchRange = NSMakeRange(0, self.length);
    NSRange resultRange;
    while ((resultRange = [self rangeOfString:searchText options:0 range:searchRange]).location != NSNotFound)
    {
        [mutaArr addObject:[NSValue valueWithRange:resultRange]];
        searchRange = NSMakeRange(NSMaxRange(resultRange), self.length - NSMaxRange(resultRange));
    }
    for (int i = 0; i < mutaArr.count; i++)
    {
        if (font)
        {
            [attStr addAttribute:NSFontAttributeName value:font range:[[mutaArr objectAtIndex:i] rangeValue]];
        }
        if (color)
        {
            [attStr addAttribute:NSForegroundColorAttributeName value:color range:[[mutaArr objectAtIndex:i] rangeValue]];
        }
    }
    return attStr;
}

@end
