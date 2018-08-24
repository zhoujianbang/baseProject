//
//  NetMonitor.h
//  MeicaiCrmproduction
//
//  Created by meicai on 2018/3/23.
//  Copyright © 2018年 meicai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
/**
 * 网络状态监听
 */

#define kNetStateNoc @"kNetStateNoc"
#define kNoNet  @"kNoNet"
#define kHasNet @"kHasNet"

@interface NetMonitor : NSObject

@property (nonatomic, assign) BOOL isStart;
+(id)shareManager;
-(void)monitoreNetWorkState;
+(void)showNoNetView;

@end
