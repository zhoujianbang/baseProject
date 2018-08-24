//
//  HudTool.h
//  MeicaiCrm
//
//  Created by meicai on 2018/3/6.
//  Copyright © 2018年 meicai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

/**
 * 进度条展示工具
 */
@interface HudTool : NSObject

@property (nonatomic, strong) MBProgressHUD * hud;

+(HudTool *)shareManager;

/**
 * 展示在窗口上
 */

+(void)hideLoadingInWindow;
+(void)showLoadingWithText:(NSString *)text;

@end
