//
//  TextTool.h
//  MeicaiCrm
//
//  Created by meicai on 2018/3/10.
//  Copyright © 2018年 meicai. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 文本工具
 */
@interface TextTool : NSObject

//更改子串的字体大小
+ (NSMutableAttributedString *)changeTextFontWithString:(NSString *)text andSubString:(NSString *)subString andFont:(CGFloat)changeFont;
//更改子串的字体大小和颜色
+ (NSMutableAttributedString *)changeTextFontWithString:(NSString *)text andSubString:(NSString *)subString andFont:(CGFloat)changeFont andColor:(UIColor *)changeColor;
//改变字符串的文字颜色和大小
+ (NSMutableAttributedString *)changeTextFontWithString:(NSString *)text andFont:(CGFloat)changeFont  andColor:(UIColor *)changeColor;
//是否包含非法字符
+ (BOOL)JudgeTheillegalCharacter:(NSString *)content;
//去两位有效数字
+ (NSString *)getEffectiveData:(NSString *)dataString;
//判断整形
+ (BOOL)isPureInt:(NSString *)string;
//判断浮点
+ (BOOL)isPureFloat:(NSString *)string;
@end
