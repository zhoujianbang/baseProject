//
//  AppDelegate.m
//  MeicaiCrm
//
//  Created by meicai on 2018/3/5.
//  Copyright © 2018年 meicai. All rights reserved.
//

#import "AppDelegate.h"
#import "IQKeyboardManager.h"
#import "AvoidCrash.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setRoot];
    return YES;
}
- (void)venderInit
{
    //1.开启异常处理
    [AvoidCrash makeAllEffective];
#ifdef DEBUG
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealwithCrashMessage:) name:AvoidCrashNotification object:nil];
#endif
    //2.keyboard控制
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    //3.开启网络监听
    [[NetMonitor shareManager] monitoreNetWorkState];
    //4.适配UI
    if (@available(iOS 11.0, *)) {
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        UITableView.appearance.estimatedRowHeight = 0;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
        UITableView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}
- (void)setRoot
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self venderInit];
    self.window.rootViewController = [BaseTabbarTool shareManager].tabbarController;
}
-(void)dealwithCrashMessage:(NSNotification *)noc
{
    Log(@"【崩溃信息】\n%@\n",noc.userInfo);
}
-(void)applicationDidEnterBackground:(UIApplication *)application
{
    Log(@"进入后台激活");
}
-(void)applicationDidBecomeActive:(UIApplication *)application
{
    Log(@"进入前台激活");
}
@end
