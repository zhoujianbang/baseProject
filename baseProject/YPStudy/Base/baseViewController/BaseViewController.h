//
//  BaseViewController.h
//  MeicaiCrm
//
//  Created by meicai on 2018/3/5.
//  Copyright © 2018年 meicai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomNavBar.h"


#define DataRequestNotification  @"DataRequestNotification"
//基础类
@interface BaseViewController : UIViewController

@property (nonatomic, strong) CustomNavBar * customNavBar;
@property (nonatomic, strong) NSDictionary * paramDict; //参数

-(void)back;
- (void)dataReqest;
-(void)hideCustomNav;//隐藏自定义导航栏
- (void)showCustomNav;//显示自定义导航栏
-(NSString *)getParamValue:(NSString *)key;
@end
