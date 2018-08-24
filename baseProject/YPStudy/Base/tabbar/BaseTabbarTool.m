//
//  BaseTabbarTool.m
//  MeicaiStore
//
//  Created by meicai on 2018/1/10.
//  Copyright © 2018年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import "BaseTabbarTool.h"

BOOL isShowTabbar = YES;

@implementation BaseTabbarTool

+(BaseTabbarTool *)shareManager
{
    static BaseTabbarTool * tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[BaseTabbarTool alloc] init];
        [tool addNotification];
        tool.currentSelectedIndex = tool.tabbarController.selectedIndex;
    });
    return tool;
}
- (void)updateImageArray:(NSArray *)imageArrays
{
    [self.tabbarConfig customizeTabBarAppearanceItemImg:imageArrays andTabBarController:self.tabbarController];
    _tabbarConfig.tabBarController.delegate = self;
    [self storeAllItemView];
}
-(TarbarConfig *)tabbarConfig
{
    if (!_tabbarConfig) {
        _tabbarConfig = [[TarbarConfig alloc]init];
        _tabbarConfig.tabBarController.delegate = self;
    }
    return _tabbarConfig;
}
-(CYLTabBarController *)tabbarController
{
    _tabbarController = self.tabbarConfig.tabBarController;
    return _tabbarController;
}
#pragma  mark - addNotification
-(void)addNotification
{
    
}
-(void)updataViewBadge:(NSNotification *)noc
{
    
}
#pragma  mark - tabbarDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    [[self cyl_tabBarController] updateSelectionStatusIfNeededForTabBarController:tabBarController shouldSelectViewController:viewController];
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control {
    UIView *animationView;
    if (self.currentSelectedIndex == tabBarController.selectedIndex) {
        NSLog(@"点击同一个 tab = %zd",self.currentSelectedIndex);
    }else{
        self.currentSelectedIndex = tabBarController.selectedIndex;
        NSLog(@"切换了tab = %zd",self.currentSelectedIndex);
    }
    if ([control cyl_isTabButton]) {
        animationView = [control cyl_tabImageView];
        [self addScaleAnimationOnView:animationView repeatCount:1];
    }
}

- (void)addScaleAnimationOnView:(UIView *)animationView repeatCount:(float)repeatCount {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@0.4,@0.5,@0.6,@0.7,@0.8,@0.9,@1.0];
    animation.duration = 0.15;
    animation.repeatCount = repeatCount;
    animation.calculationMode = kCAAnimationCubic;
    [animationView.layer addAnimation:animation forKey:nil];
}
#pragma  mark - action
- (void)showBadageAdIndex:(NSInteger)index andText:(NSString *)text
{
    UIView * view = [self getViewAtIndex:index];
    [view showBadgeOnItemIndex:index andText:text];
}
- (void)hiddenBadageAdIndex:(NSInteger)index
{
    UIView * view = [self getViewAtIndex:index];
    [view hideBadgeOnItemIndex:index];
}
- (void)storeAllItemView
{
    [self.itemViewArray removeAllObjects];
    for (UIControl *control in self.tabbarConfig.tabBarController.tabBar.subviews) {
        if ([control cyl_isTabButton]) {
            UIView * podView = [control cyl_tabImageView];
            [self.itemViewArray sui_addObj:podView];
        }
    }
}
-(UIView *)getViewAtIndex:(NSInteger)index
{
    UIView * view  = [self.itemViewArray sui_objectWithIndex:index];
    return view;
}
-(NSMutableArray *)itemViewArray
{
    if (!_itemViewArray) {
        _itemViewArray = [NSMutableArray array];
    }
    return _itemViewArray;
}
#pragma  mark - 获取当前视图
+(BaseViewController*)getCurrentVC{
    UINavigationController * nav  = [BaseTabbarTool shareManager].tabbarController.selectedViewController;
    return  (BaseViewController *)nav.visibleViewController;
}
#pragma  mark - tabbar显示和隐藏
+ (void) hideTabBarFinished:(Finished)finish{
    if (!isShowTabbar) {
        return;
    }
    isShowTabbar = NO;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    [[BaseTabbarTool shareManager].tabbarController.tabBar setFrame:CGRectMake(0, SCREENH, SCREENW,kTabbarHeight)];
    [UIView commitAnimations];
    if (finish) {
        finish();
    }
}
+ (void) faulseHideTabBar{
    isShowTabbar = NO;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    [[BaseTabbarTool shareManager].tabbarController.tabBar setFrame:CGRectMake(0, SCREENH, SCREENW,kTabbarHeight)];
    [UIView commitAnimations];
}
+ (void) showTabBarFinished:(Finished)finish{
    if (isShowTabbar) {
        return;
    }
    isShowTabbar = YES;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    [[BaseTabbarTool shareManager].tabbarController.tabBar setFrame:CGRectMake(0, SCREENH-kTabbarHeight, SCREENW,kTabbarHeight)];
    [UIView commitAnimations];
    if (finish) {
        finish();
    }
}
+ (void) switchTabbarIndex:(NSInteger)index
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [BaseTabbarTool shareManager].tabbarController.selectedIndex = index;
    });
}
@end
