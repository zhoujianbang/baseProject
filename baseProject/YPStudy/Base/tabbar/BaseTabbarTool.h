//
//  BaseTabbarTool.h
//  MeicaiStore
//
//  Created by meicai on 2018/1/10.
//  Copyright © 2018年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TarbarConfig.h"
#import "CYLTabBarController.h"
#import "UIView+Badge.h"
#import "BaseViewController.h"
/**
 * tabbar管理工具
 */
@interface BaseTabbarTool : NSObject <UITabBarControllerDelegate,CYLTabBarControllerDelegate>

typedef void (^Finished) (void); //完成

+(BaseTabbarTool *)shareManager;

@property (nonatomic,strong) NSMutableArray * itemViewArray;
@property (nonatomic,strong) TarbarConfig * tabbarConfig;
@property (nonatomic,strong) CYLTabBarController * tabbarController;
@property (nonatomic,assign) NSInteger  currentSelectedIndex;

- (void)updateImageArray:(NSArray *)imageArrays;
- (void)showBadageAdIndex:(NSInteger)index andText:(NSString *)text;
- (void)hiddenBadageAdIndex:(NSInteger)index;
- (void)storeAllItemView; 
+ (BaseViewController *)getCurrentVC;

+ (void) faulseHideTabBar;
+ (void) hideTabBarFinished:(Finished)finish;
+ (void) showTabBarFinished:(Finished)finish;
+ (void) switchTabbarIndex:(NSInteger)index;
@end
