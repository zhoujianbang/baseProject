//
//  UIImage+Categorys.h
//  FrameworkProject
//
//  Created by 陈哲是个好孩子 on 15/8/4.
//  Copyright (c) 2015年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

/*
 (Transform)对图片进行压缩大小，拉伸等等操作
 (Bundle)获取bundle里面图片信息
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, GradientType) {
    GradientTypeTopToBottom = 0,//从上到小
    GradientTypeLeftToRight = 1,//从左到右
    GradientTypeUpleftToLowright = 2,//左上到右下
    GradientTypeUprightToLowleft = 3,//右上到左下
};

@interface UIImage (Transform)

/**
 *  压缩当前图片Image成指定大小Image
 *
 *  @param size 指定尺寸
 */
-(UIImage *)compressToSize:(CGSize)size;

/**
 *  根据传入的图片最大宽高参数，计算出图片容器的Size
 *
 *  @param image 传入的图片
 *
 *  @return
 */
-(CGSize)getContainerSizeWithLimitWidth:(CGFloat)limitWidth andLimitHeight:(CGFloat)limitHeight;

/**
 *  拉伸Image矩形范围内视图(仅拉伸区域内，类型QQ聊天框)
 *
 *  @param edgeInset 指定矩形区域
 *
 *  @return 
 */
-(UIImage *)resizeImageWithEdge:(UIEdgeInsets)edgeInset;

/**
 *  传入颜色对象获取纯色Image对象
 *
 *  @param color 颜色值
 *
 *  @return 
 */
+(UIImage *)transformToPureImageWithColor:(UIColor *)color;

@end

@interface UIImage (Bundle)
/**
 *  获取当前App的Icon图片Image对象
 *
 *  @return 
 */
+(UIImage*)getAppIcon;
/**
 *  渐变色
 *
 *  @return
 */
+ (UIImage *)gradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize;
@end
