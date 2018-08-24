//
//  ViewTool.h
//  MeiCaiStore
//
//  Created by 陈哲是个好孩子 on 15/4/24.
//  Copyright (c) 2015年 czCompany. All rights reserved.
//  测试来

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewTool : NSObject
/**
 *  通过文字多少得到Label宽高
 *
 *  @param str        传入计算的字符串
 *  @param fontSize   字体大小
 *  @param lines      限制行数
 *  @param labelWidth 限制宽度
 *
 *  @return 获取高度
 */
+(CGSize)getLabelActualSize:(NSString *)str andFont:(CGFloat)fontSize andLines:(NSInteger)lines andlabelWidth:(CGFloat)labelWidth;

/**
 *  色值直接转换成图片对象
 *
 *  @param color 色值
 *
 *  @return  颜色转换为图片
 */
+(UIImage *)changeColorToImage:(UIColor *)color;
+(UIImage *)resizeImage:(NSString *)imgName;
+(CGSize)getImageSizeToChange:(UIImage *)image;

/**
 * 创建label
 */
+(UILabel *)createLabelWithFontSize:(NSInteger)size textColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius;
/**
 *  改变信号栏字体颜色
 *
 *  @param color 颜色参数
 */
+(void)changeSignalFormatWithColor:(UIColor *)color;
/**
 * 获取当前视图
 */
+ (UIViewController *)getCurrentVC;
/**
 * 添加阴影
 */
+(void)configShadow:(UIView *)view;
//iPhoneX状态栏增加的高度
+ (CGFloat)getAddStatusHeight;
//状态栏高度
+ (CGFloat)getStatusBarHeight;
//Tabbar高度
+ (CGFloat)getTabbarHeight;
//TabbarSafeBottomMargin
+ (CGFloat)getTabbarSafeBottomMargin;
//Status bar & navigation bar height.
+ (CGFloat)getStatusBarAndNavigationBarHeight;
@end
