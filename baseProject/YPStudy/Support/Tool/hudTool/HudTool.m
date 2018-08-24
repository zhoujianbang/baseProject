//
//  HudTool.m
//  MeicaiCrm
//
//  Created by meicai on 2018/3/6.
//  Copyright © 2018年 meicai. All rights reserved.
//

#import "HudTool.h"

static HudTool * hudTool;

@implementation HudTool

+(HudTool *)shareManager
{
    static HudTool * tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[HudTool alloc] init];
        
    });
    return tool;
}
-(void)showLoadingInWindowWithText:(NSString *)text;
{
    [HudTool hideLoadingInWindow];
    if (!_hud) {
        _hud = [[MBProgressHUD alloc]init];
    }
    _hud.removeFromSuperViewOnHide = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:_hud];
    [_hud showAnimated:YES];
    if (text) {
        _hud.label.text = text;
    }else{
        _hud.label.text = nil;
    }
    
}
+(void)hideLoadingInWindow
{
    [[HudTool shareManager].hud hideAnimated:YES];
}
+(void)showLoadingWithText:(NSString *)text
{
    [[HudTool shareManager]showLoadingInWindowWithText:text];
}
@end
