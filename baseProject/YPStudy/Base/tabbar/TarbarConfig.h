//
//  TarbarConfig.h
//  MeicaiStore
//
//  Created by meicai on 2018/1/10.
//  Copyright © 2018年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYLTabBarController.h"

/**
 * tabbar配置
 */
@interface TarbarConfig : NSObject

@property (nonatomic, readonly, strong) CYLTabBarController *tabBarController;
@property (nonatomic, copy) NSString *context;

- (void)customizeTabBarAppearanceItemImg:(NSArray *)imageArrays andTabBarController:(CYLTabBarController *)tabBarController;

@end

