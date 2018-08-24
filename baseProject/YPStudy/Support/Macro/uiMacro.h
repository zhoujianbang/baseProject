//
//  uiMacro.h
//  MeicaiCrm
//
//  Created by meicai on 2018/3/5.
//  Copyright © 2018年 meicai. All rights reserved.
//

#ifndef uiMacro_h
#define uiMacro_h

#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREEN_Proportion [UIScreen mainScreen].bounds.size.width/375.00f

#define kViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size)) : NO)
#define IS_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)
#define IS_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define  kAddStatusHeight      [ViewTool getAddStatusHeight]
#define  kStatusBarHeight      [ViewTool getStatusBarHeight] //状态栏高度
#define  kTabbarHeight         [ViewTool getTabbarHeight] //tabbar高度
#define  kTabbarSafeBottomMargin         [ViewTool getTabbarSafeBottomMargin] //底部安全距离
#define  kStatusBarAndNavigationBarHeight  [ViewTool getStatusBarAndNavigationBarHeight] //状态栏和nav高度


#endif /* uiMacro_h */
