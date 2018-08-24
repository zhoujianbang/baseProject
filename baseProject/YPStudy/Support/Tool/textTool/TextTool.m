//
//  TextTool.m
//  MeicaiCrm
//
//  Created by meicai on 2018/3/10.
//  Copyright © 2018年 meicai. All rights reserved.
//

#import "TextTool.h"

@implementation TextTool

+ (NSMutableAttributedString *)changeTextFontWithString:(NSString *)text andSubString:(NSString *)subString andFont:(CGFloat)changeFont
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    if ([text sui_containsString:subString]) {
        NSRange range = [text rangeOfString:subString];
        [attributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:changeFont] range:range];
    }
    return  attributedString;
}

+ (NSMutableAttributedString *)changeTextFontWithString:(NSString *)text andSubString:(NSString *)subString andFont:(CGFloat)changeFont andColor:(UIColor *)changeColor
{
    NSMutableAttributedString * aString = [TextTool changeTextFontWithString:text andSubString:subString andFont:changeFont];
    NSRange range = [text rangeOfString:subString];
    if (changeColor) {
        [aString addAttribute:NSForegroundColorAttributeName value:changeColor range:range];
    }
    return aString;
}
+ (NSMutableAttributedString *)changeTextFontWithString:(NSString *)text andFont:(CGFloat)changeFont  andColor:(UIColor *)changeColor
{
     NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSRange range = NSMakeRange(0, text.length);
    if (changeFont) {
        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:changeFont] range:range];
    }
    if (changeColor) {
        [attributedString addAttribute:NSForegroundColorAttributeName value:changeColor range:range];
    }
    return attributedString;
}
+ (BOOL)JudgeTheillegalCharacter:(NSString *)content{
    //提示 标签不能输入特殊字符
    NSString *str =@"^[A-Za-z0-9\\u4e00-\u9fa5]+$";
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    if (![emailTest evaluateWithObject:content]) {
        return YES;
    }
    return NO;
}

+ (BOOL)isPureInt:(NSString *)string{
    
    NSScanner* scan = [NSScanner scannerWithString:string];
    
    int val;
    
    return [scan scanInt:&val] && [scan isAtEnd];
    
}
+ (BOOL)isPureFloat:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}
+ (NSString *)getEffectiveData:(NSString *)dataString
{
    if (![TextTool isPureFloat:dataString] && ![TextTool isPureInt:dataString]) {
        return dataString;
    }
    NSString * resString = nil;
    if (dataString.integerValue/100000 > 0) {
        CGFloat fwan = dataString.floatValue/10000;
        CGFloat f = (floorf(fwan*100 + 0.5))/100;
        resString = [NSString stringWithFormat:@"%.2fw",f];
    }else{
        CGFloat f = (floorf(dataString.floatValue*100 + 0.5))/100;
        resString = [NSString stringWithFormat:@"%.2f",f];
    }
    return resString;
}
@end
