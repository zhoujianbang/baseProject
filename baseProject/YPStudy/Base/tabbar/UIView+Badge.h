//
//  UITabBar+Badge.h
//  MeicaiStore
//
//  Created by meicai on 2018/1/16.
//  Copyright © 2018年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 右上角红点*/
@interface UIView (Badge)

- (void)showBadgeOnItemIndex:(NSInteger)index andText:(id)text;   //显示小红点
- (void)hideBadgeOnItemIndex:(NSInteger)index; //隐藏小红点

@end
