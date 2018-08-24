//
//  NetMonitor.m
//  MeicaiCrmproduction
//
//  Created by meicai on 2018/3/23.
//  Copyright © 2018年 meicai. All rights reserved.
//

#import "NetMonitor.h"
#import "AppDelegate.h"

@implementation NetMonitor


+(NetMonitor *)shareManager
{
    static NetMonitor * tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[NetMonitor alloc] init];
    });
    return tool;
}

-(void)monitoreNetWorkState;
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (!self.isStart && status != AFNetworkReachabilityStatusNotReachable) {
            return ;
        }
        self.isStart = YES;
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                [NetMonitor showNoNetView];
                [HudTool hideLoadingInWindow];
                [kNotification postNotificationName:kNetStateNoc object:kNoNet];
                break;
            case AFNetworkReachabilityStatusUnknown:
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                [NetMonitor hideNoNetView];
                [[iToast makeText:@"已切换wifi"] show];
                [kNotification postNotificationName:kNetStateNoc object:kHasNet];
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                [NetMonitor hideNoNetView];
                [[iToast makeText:@"已切换移动网络"] show];
                [kNotification postNotificationName:kNetStateNoc object:kHasNet];
            }
                break;
            default:
                break;
        }
    }];
    
}

+(void)showNoNetView
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    UIWindow * keyWindow = [UIApplication sharedApplication].keyWindow;
    UIView * view1 = [keyWindow viewWithTag:2000];
    [view1 removeFromSuperview];
    
    UIView * view = [[UIView alloc]init];
    view.tag = 2000;
    view.backgroundColor = [UIColor whiteColor];
    [keyWindow addSubview:view];
    
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor =[UIColor redColor];
    label.text = @"网络状态不加，请点击查看网络是否连接正常";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:12];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.right.offset(10);
        make.height.equalTo(@20);
        make.bottom.offset(0);
    }];
    
    view.frame = CGRectMake(0, -kStatusBarHeight+5, SCREENW, kStatusBarHeight+5);
    [UIView animateWithDuration:0.25 animations:^{
        view.frame = CGRectMake(0, 0, SCREENW, kStatusBarHeight+5);
    }];
    [view sui_addTapGes:^(UITapGestureRecognizer * _Nonnull cTapGes) {
        NSString * urlString = @"App-Prefs:root=WIFI";
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlString]]) {
            if (@available(iOS 10.0, *)) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
            } else {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
            }
        }
    }];
}
+(void)hideNoNetView
{
    UIWindow * keyWindow = [UIApplication sharedApplication].keyWindow;
    UIView * view1 = [keyWindow viewWithTag:2000];
    [UIView animateWithDuration:0.2 animations:^{
        view1.frame = CGRectMake(0, -kStatusBarHeight+5, SCREENW, kStatusBarHeight+5);
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        [view1 removeFromSuperview];
    }];
}
@end
