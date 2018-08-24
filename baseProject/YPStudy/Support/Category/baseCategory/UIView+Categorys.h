//
//  UIView+Categorys.h
//  FrameworkProject
//
//  Created by 陈哲是个好孩子 on 15/8/4.
//  Copyright (c) 2015年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

/*
 (setFrame)直接设置或者获取View的frame属性
 */

#import <Foundation/Foundation.h>

@interface UIView (setFrame)

/**
 *  设置 获取Origin
 *
 *  @return
 */
-(CGPoint)origin;
-(void)setOrigin:(CGPoint) point;

/**
 *  设置 获取size
 *
 *  @return
 */
-(CGSize)size;
-(void)setSize:(CGSize) size;

/**
 *  设置 获取x
 *
 *  @return
 */
-(CGFloat)x;
-(void)setX:(CGFloat)x;

/**
 *  设置 获取y
 *
 *  @return
 */
-(CGFloat)y;
-(void)setY:(CGFloat)y;

/**
 *  设置 获取height
 *
 *  @return
 */
-(CGFloat)height;
-(void)setHeight:(CGFloat)height;

/**
 *  设置 获取width
 *
 *  @return
 */
-(CGFloat)width;
-(void)setWidth:(CGFloat)width;

/**
 *  设置 获取tail
 *
 *  @return
 */
-(CGFloat)tail;
-(void)setTail:(CGFloat)tail;

/**
 *  设置 获取bottom
 *
 *  @return
 */
-(CGFloat)bottom;
-(void)setBottom:(CGFloat)bottom;

/**
 *  设置 获取right
 *
 *  @return
 */
-(CGFloat)right;
-(void)setRight:(CGFloat)right;

@end
