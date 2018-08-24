//
//  BaseViewController.m
//  MeicaiCrm
//
//  Created by meicai on 2018/3/5.
//  Copyright © 2018年 meicai. All rights reserved.
//

#import "BaseViewController.h"

static NSInteger ret1024Count = 0;

@interface BaseViewController ()

@property (nonatomic, assign) BOOL currentServiceSuccess; // 默认yes代表有数据返回，可再次请求数据

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [self configUI];
    self.edgesForExtendedLayout = UIRectEdgeNone; //防止tabbar和navgationbar被遮挡
    [self hideCustomNav];
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated
{
    [ViewTool changeSignalFormatWithColor:[UIColor whiteColor]];
    [kNotification addObserver:self selector:@selector(dataReqest) name:DataRequestNotification object:nil];
    [kNotification addObserver:self selector:@selector(netWortStatus:) name:kNetStateNoc object:nil];
}
- (void)viewDidDisappear:(BOOL)animated
{
    [kNotification removeObserver:self name:DataRequestNotification object:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [kNotification removeObserver:self];
}
#pragma  mark - configUI
- (void)configUI
{
    self.view.backgroundColor = kViewBgColor;
    [self.view addSubview:self.customNavBar];
    self.fd_prefersNavigationBarHidden = YES;
}
#pragma  mark - action
- (void)hideCustomNav
{
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBar.translucent = YES;
    self.customNavBar.hidden = YES;
    self.customNavBar.frame = CGRectMake(0, 0, SCREENW, 0);
}
- (void)showCustomNav
{
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBar.translucent = YES;
    self.customNavBar.hidden = NO;
    self.customNavBar.frame = CGRectMake(0, 0, SCREENW, kStatusBarAndNavigationBarHeight);
}
- (void)dataReqest
{
    
}
- (void)netWortStatus:(NSNotification *)noc
{
    NSString * object = noc.object;
    if ([object isEqualToString:kNoNet]) {
        NSLog(@"无网络");
    }else{
        NSLog(@"有网络，执行自动登录");
    }
}
- (void)back
{
    NSLog(@"返回方法");
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSString *)getParamValue:(NSString *)key
{
    return [self.paramDict sui_objectForKey:key];
}
#pragma  mark - setter
- (CustomNavBar *)customNavBar
{
    if (!_customNavBar) {
        _customNavBar = [CustomNavBar CustomNavigationBar];
    }
    return _customNavBar;
}
@end
