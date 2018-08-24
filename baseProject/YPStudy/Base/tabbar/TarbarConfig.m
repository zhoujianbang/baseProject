//
//  MCTarbarConfig.m
//  MeicaiStore
//
//  Created by meicai on 2018/1/10.
//  Copyright © 2018年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//
#import "TarbarConfig.h"
#import <UIKit/UIKit.h>
#import "TabvarHeader.h"

@interface CYLBaseNavigationController : UINavigationController
@end

@implementation CYLBaseNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end


@interface TarbarConfig ()<UITabBarControllerDelegate>

@property (nonatomic, readwrite, strong) CYLTabBarController *tabBarController;

@end

@implementation TarbarConfig

- (CYLTabBarController *)tabBarController {
    if (_tabBarController == nil) {

        UIEdgeInsets imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        UIOffset titlePositionAdjustment = UIOffsetZero;
        CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers
                                                                                   tabBarItemsAttributes:self.tabBarItemsAttributesForController
                                                                                             imageInsets:imageInsets
                                                                                 titlePositionAdjustment:titlePositionAdjustment
                                                 context:self.context
                                                 ];
        [self customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}

- (NSArray *)viewControllers {
    
    return [TarbarConfig getViewControllers];
}
- (NSArray *)tabBarItemsAttributesForController {
    
    return [TarbarConfig getTabBarItemsAttributesForController];
}

- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    [tabBarController hideTabBadgeBackgroundSeparator];
    tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setShadowImage:[self imageWithColor:kSplitLineColor size:CGSizeMake(SCREENW,0.5)]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    tabBarController.tabBarHeight = CYL_IS_IPHONE_X ? 83 : 49;
}
- (void)customizeTabBarAppearanceItemImg:(NSArray *)imageArrays andTabBarController:(CYLTabBarController *)tabBarController{
    [self.tabBarController viewDidLayoutSubviews];
    [self customizeTabBarAppearance:tabBarController];
}
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)newsize{
    UIGraphicsBeginImageContextWithOptions(newsize, NO, [UIScreen mainScreen].scale);
    [img drawInRect:CGRectMake(0, 0, newsize.width, newsize.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
-(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <=0 || size.height <=0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size,NO, 0);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}



+(NSArray *)getViewControllers
{
    NSArray * array = @[];
    FirstViewController *firstViewController = [[FirstViewController alloc] init];
    UIViewController *firstNavigationController = [[CYLBaseNavigationController alloc]
                                                    initWithRootViewController:firstViewController];
    
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    UIViewController *secondNavigationController = [[CYLBaseNavigationController alloc]
                                                   initWithRootViewController:secondViewController];
    
    ThirdViewController *thirdViewController = [[ThirdViewController alloc] init];
    UIViewController *thirdNavigationController = [[CYLBaseNavigationController alloc]
                                                    initWithRootViewController:thirdViewController];
    FourthViewController *fourthViewController = [[FourthViewController alloc] init];
    UIViewController *fourthNavigationController = [[CYLBaseNavigationController alloc]
                                                   initWithRootViewController:fourthViewController];
    array = @[firstNavigationController,
              secondNavigationController,
              thirdNavigationController,
              fourthNavigationController,
              ];
    return array;
}
+(NSArray *)getTabBarItemsAttributesForController
{
    NSArray * array = @[];
    NSDictionary *firstTabBarItemsAttributes = @{
                                                  CYLTabBarItemImage : @"tabbar_home",
                                                  CYLTabBarItemSelectedImage : @"tabbar_home_p",
                                                  };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemImage : @"tabbar_store",
                                                  CYLTabBarItemSelectedImage : @"tabbar_store_p",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemImage : @"tabbar_tool",
                                                 CYLTabBarItemSelectedImage : @"tabbar_tool_p",
                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemImage : @"tabbar_my",
                                                  CYLTabBarItemSelectedImage : @"tabbar_my_p"
                                                  };
    array = @[
              firstTabBarItemsAttributes,
              secondTabBarItemsAttributes,
              thirdTabBarItemsAttributes,
              fourthTabBarItemsAttributes,
              ];
    return array;
}
@end
