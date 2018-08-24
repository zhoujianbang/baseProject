//
//  CustomNavBar.h
//  MeicaiStore
//
//  Created by meicai on 2018/1/18.
//  Copyright © 2018年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemSearch.h"

@class BaseViewController;

#define SEARCVIEW_HEIGHT 35

typedef NS_ENUM(NSUInteger, Nav_Type) {
    Nav_Type_Default,  //左侧按钮+标题
    Nav_Type_Search, //左右按钮+搜索框
    Nav_Type_Search_LeftBtn, //左侧按钮+搜索框
    Nav_Type_MoreRightBtn, //左侧按钮+右侧两个按钮+标题
    Nav_Type_SystemSearch_Right, //右侧按钮+系统搜索框
    Nav_Type_SystemSearch_Right_Left, //右侧按钮+左侧按钮+系统搜索框
    Nav_Type_SystemSearch_Left, //左侧返回按钮+右侧系统输入框
};

typedef void (^onBtnClicked) (void);
//自定义navbar
@interface CustomNavBar : UIView

@property (nonatomic, assign) Nav_Type currentNavType;

@property (nonatomic, strong) UIButton    *leftButton; //左侧按钮
@property (nonatomic, strong) UIButton    *rightSubBtn; //右侧靠里面按钮
@property (nonatomic, strong) UIButton    *rightButton; //右侧按钮
@property (nonatomic, strong) SystemSearch * systemSearchBar; //自定义类似系统tabbar

@property (nonatomic, copy)   NSString *title;
@property (nonatomic, strong) UIColor  *titleLabelColor;
@property (nonatomic, strong) UIFont   *titleLabelFont;
@property (nonatomic, strong) UIColor  *barBackgroundColor;
@property (nonatomic, strong) UIImage  *barBackgroundImage;
@property (nonatomic, strong) NSString * searchWord;

@property (nonatomic, copy) void(^onClickLeftButton)(void);
@property (nonatomic, copy) void(^onClickSearchButton)(void);
@property (nonatomic, copy) void(^onClickRightButton)(void);
@property (nonatomic, copy) void(^onClickSubRightButton)(void);

+ (instancetype)CustomNavigationBar;

//左侧返回按钮-默认返回按钮操作
+(void)configBackBtnAndTitle:(NSString *)title andViewController:(BaseViewController *)vc;
//只有标题
+(void)configTitle:(NSString *)title andViewController:(BaseViewController *)vc;
//右侧按钮-点击事件
+(void)configRightBtnAndTitle:(NSString *)title andRightBtnTitle:(NSString *)rightTitle andOnBtnClicked:(onBtnClicked)onclickBtn andViewController:(BaseViewController *)vc;
//左侧按钮
+(void)configTitle:(NSString *)title andLeftBtnWithImage:(NSString *)LeftImgName andOnLeftBtnClicked:(onBtnClicked)onLeftClickBtn andViewController:(BaseViewController *)vc;
//左侧返回按钮+右侧文字
+(void)configBackBtnAndTitle:(NSString *)title andRightBtnTitle:(NSString *)rightTitle andOnBtnClicked:(onBtnClicked)onclickBtn andViewController:(BaseViewController *)vc;
//左侧返回按钮+右侧文字+自定义宽度
+(void)configBackBtnAndTitle:(NSString *)title andRightBtnTitle:(NSString *)rightTitle andOnBtnClicked:(onBtnClicked)onclickBtn andRightBtnWidth:(CGFloat)width andViewController:(BaseViewController *)vc;
//左侧返回按钮+右侧图片
+(void)configBackBtnAndTitle:(NSString *)title andRightBtnImg:(NSString *)rightImg andOnBtnClicked:(onBtnClicked)onclickBtn andViewController:(BaseViewController *)vc;
//创建搜索样式+左按钮+右按钮+搜索框
+(void)configLeftBtnWithImage:(NSString *)LeftImgName andRightBtnImage:(NSString *)rigImgName andOnLeftBtnClicked:(onBtnClicked)onLeftClickBtn andOnRightBtnClicked:(onBtnClicked)onRightclickBtn andOnSearchBtnClicked:(onBtnClicked)onSearchClickBtn andViewController:(BaseViewController *)vc;
//创建搜索+左侧按钮
+(void)configLeftBtnWithImage:(NSString *)LeftImgName andOnLeftBtnClicked:(onBtnClicked)onLeftClickBtn andOnSearchBtnClicked:(onBtnClicked)onSearchClickBtn andViewController:(BaseViewController *)vc;
//右侧两个-购物车使用
+(void)configNavTitle:(NSString *)title andLeftImage:(NSString *)LeftImgName andRightBtnTitle:(NSString *)rightBtnTitle andSubRightBtnImage:(NSString *)subRBtnImage andOnLeftBtnClicked:(onBtnClicked)onLeftClickBtn andOnRightBtnClicked:(onBtnClicked)onRightclickBtn andOnSubRightBtnClicked:(onBtnClicked)onSubRightClickBtn andViewController:(BaseViewController *)vc;
//搜索页面按钮-左侧搜索框、右侧取消
+(void)configSystemSearchWithPlaceholder:(NSString *)placeHoder andRightBtnTitle:(NSString *)rightBtnTitle andOnRightBtnClick:(onBtnClicked)onRightBtnClick andViewController:(BaseViewController *)vc;
//搜索结果页-左侧返回按钮、右侧搜索框
+(void)configSystemSearchWithText:(NSString *)text andOnLeftBtnClicked:(onBtnClicked)onLeftClickBtn andViwController:(BaseViewController *)vc;

//搜索结果页-左侧返回按钮、右侧取消按钮、中间搜索框
+(void)configSystemSearchWithPlaceholder:(NSString *)placeHoder andLeftBtnWithImage:(NSString *)LeftImgName andOnLeftBtnClicked:(onBtnClicked)onLeftClickBtn andRightBtnTitle:(NSString *)rightBtnTitle andOnRightBtnClick:(onBtnClicked)onRightBtnClick andViewController:(BaseViewController *)vc;
//设置左侧按钮
- (void)setLeftButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted;
- (void)setLeftButtonWithImage:(UIImage *)image;
- (void)setLeftButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor;

//设置右侧最外侧按钮
- (void)setRightButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted;
- (void)setRightButtonWithImage:(UIImage *)image;
- (void)setRightButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor;

//设置右侧第一个按钮
- (void)setSubRightButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted;
- (void)setSubRightButtonWithImage:(UIImage *)image;
- (void)setSubRightButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor;

//隐藏下面的横线
- (void)setBottomLineHidden:(BOOL)hidden;
//设置透明度
- (void)setBackgroundAlpha:(CGFloat)alpha;
//更新显示样式
-(void)updataNavType:(Nav_Type)nav_type;


@end
