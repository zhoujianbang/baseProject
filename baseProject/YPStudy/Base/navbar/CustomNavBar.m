//
//  CustomNavBar.m
//  MeicaiStore
//
//  Created by meicai on 2018/1/18.
//  Copyright © 2018年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import "CustomNavBar.h"
#import "CustomSearch.h"

@interface CustomNavBar()

@property (nonatomic, strong) UILabel     *titleLable; //中间标题
@property (nonatomic, strong) UIView      *bottomLine; //底部线
@property (nonatomic, strong) UIView      *backgroundView; //底部背景
@property (nonatomic, strong) UIImageView *backgroundImageView; //底部图片
@property (nonatomic, strong) CustomSearch * customSearch; //自定义搜索

@end

@implementation CustomNavBar
+ (instancetype)CustomNavigationBar {
    CustomNavBar *navigationBar = [[self alloc] initWithFrame:CGRectMake(0, 0, SCREENW, IS_iPhoneX?88:64)];
    return navigationBar;
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

-(void)setupView
{
    [self addSubview:self.backgroundView];
    [self addSubview:self.backgroundImageView];
    [self addSubview:self.leftButton];
    [self addSubview:self.titleLable];
    [self addSubview:self.rightButton];
    [self addSubview:self.rightSubBtn];
    [self addSubview:self.bottomLine];
    [self addSubview:self.customSearch];
    [self addSubview:self.systemSearchBar];
    self.backgroundColor = [UIColor clearColor];
    self.backgroundView.backgroundColor = [UIColor whiteColor];
    [self configUI];
}

-(void)configUI
{
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.equalTo(self);
        make.height.equalTo(@0.5);
    }];
}
-(void)updataNavType:(Nav_Type)nav_type
{
    NSInteger top = IS_iPhoneX ? 44 : 20;
    NSInteger buttonHeight = 44;
    NSInteger buttonWidth = 46*(SCREENW==320?SCREEN_Proportion:1);
    switch (nav_type) {
        case Nav_Type_Default:
        {
            self.leftButton.hidden = NO;
            self.rightButton.hidden = NO;
            self.titleLable.hidden = NO;
            self.customSearch.hidden = YES;
            self.rightSubBtn.hidden = YES;
            self.systemSearchBar.hidden = YES;
            

            [self.leftButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.and.bottom.equalTo(self);
                make.top.offset(top);
                make.width.equalTo(@(buttonWidth));
            }];
            [self.rightButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self);
                make.right.offset(-5);
                make.top.offset(top);
                make.width.equalTo(@(buttonWidth));
            }];
            [self.titleLable mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.mas_centerY).offset(top/2);
                make.centerX.equalTo(self.mas_centerX);
                make.left.equalTo(self.leftButton.mas_right).offset(20);
                make.right.equalTo(self.rightButton.mas_left).offset(-20);
            }];
        }
            break;
        case Nav_Type_Search:
        {
            self.systemSearchBar.hidden = YES;
            self.leftButton.hidden = NO;
            self.rightButton.hidden = NO;
            self.titleLable.hidden = YES;
            self.customSearch.hidden = NO;
            self.rightSubBtn.hidden = YES;
            
            [self.leftButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.and.bottom.equalTo(self);
                make.top.offset(top);
                make.width.equalTo(@(buttonWidth));
            }];
            [self.rightButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.and.bottom.equalTo(self);
                make.top.offset(top);
                make.width.equalTo(@(buttonWidth));
            }];
            [self.customSearch mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.leftButton.mas_right).offset(0);
                make.right.equalTo(self.rightButton.mas_left).offset(0);
                make.centerY.equalTo(self.mas_centerY).offset(top/2);
                make.height.equalTo(@(SEARCVIEW_HEIGHT));
            }];
        }
            break;
        case Nav_Type_Search_LeftBtn:
        {
            self.systemSearchBar.hidden = YES;
            self.leftButton.hidden = NO;
            self.rightButton.hidden = YES;
            self.titleLable.hidden = YES;
            self.customSearch.hidden = NO;
            self.rightSubBtn.hidden = YES;
            
            [self.leftButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.and.bottom.equalTo(self);
                make.top.offset(top);
                make.width.equalTo(@(buttonWidth));
            }];
            [self.customSearch mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.leftButton.mas_right).offset(0);
                make.right.offset(-13);
                make.centerY.equalTo(self.mas_centerY).offset(top/2);
                make.height.equalTo(@(SEARCVIEW_HEIGHT));
            }];
        }
            break;
        case Nav_Type_MoreRightBtn:
        {
            self.leftButton.hidden = NO;
            self.rightButton.hidden = NO;
            self.titleLable.hidden = NO;
            self.customSearch.hidden = YES;
            self.rightSubBtn.hidden = NO;
            self.systemSearchBar.hidden = YES;
            
            [self.leftButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.and.bottom.equalTo(self);
                make.top.offset(top);
                make.width.equalTo(@(buttonWidth));
            }];
            [self.rightButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.and.bottom.equalTo(self);
                make.top.offset(top);
                make.width.equalTo(@(buttonHeight));
            }];
            [self.rightSubBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self);
                make.right.equalTo(self.rightButton.mas_left).offset(0);
                make.top.offset(top);
                make.width.equalTo(@(44));
            }];
            [self.titleLable mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.mas_centerY).offset(top/2);
                make.centerX.equalTo(self.mas_centerX);
            }];
        }
            break;
        case Nav_Type_SystemSearch_Right:
        {
            self.rightButton.alpha = 0;
            
            self.leftButton.hidden = YES;
            self.rightButton.hidden = NO;
            self.titleLable.hidden = YES;
            self.customSearch.hidden = YES;
            self.rightSubBtn.hidden = YES;
            self.systemSearchBar.hidden = NO;
            
            self.leftButton.frame = CGRectMake(0, top, buttonWidth, self.sui_height-top);
            self.rightButton.frame = CGRectMake(SCREENW-buttonWidth, top, buttonWidth, self.sui_height-top);
            self.systemSearchBar.frame = CGRectMake(8, top+(self.sui_height-SEARCVIEW_HEIGHT-top)/2, SCREENW-buttonWidth-13, SEARCVIEW_HEIGHT);
        
            [UIView animateWithDuration:0.3 animations:^{
                self.rightButton.alpha = 1;
            }];
        }
            break;
        case Nav_Type_SystemSearch_Right_Left:
        {
            self.leftButton.hidden = NO;
            self.rightButton.hidden = NO;
            self.titleLable.hidden = YES;
            self.customSearch.hidden = YES;
            self.rightSubBtn.hidden = YES;
            self.systemSearchBar.hidden = NO;
            
            self.leftButton.frame = CGRectMake(0, top, buttonWidth, self.sui_height-top);
            self.rightButton.frame = CGRectMake(SCREENW-buttonWidth, top, buttonWidth, self.sui_height-top);
            self.systemSearchBar.frame = CGRectMake(buttonWidth, top+(self.sui_height-SEARCVIEW_HEIGHT-top)/2, SCREENW-buttonWidth-buttonWidth, SEARCVIEW_HEIGHT);
        }
            break;
        case Nav_Type_SystemSearch_Left:
        {
            self.rightButton.alpha = 1;
            self.leftButton.hidden = NO;
            self.rightButton.hidden = YES;
            self.titleLable.hidden = YES;
            self.customSearch.hidden = YES;
            self.rightSubBtn.hidden = YES;
            self.systemSearchBar.hidden = NO;
            
            self.leftButton.frame = CGRectMake(0, top, buttonWidth, self.sui_height-top);
            self.rightButton.frame = CGRectMake(SCREENW-buttonWidth, top, buttonWidth, self.sui_height-top);
            self.systemSearchBar.frame = CGRectMake(buttonWidth, top+(self.sui_height-SEARCVIEW_HEIGHT-top)/2, SCREENW-buttonWidth-22, SEARCVIEW_HEIGHT);
            
            [UIView animateWithDuration:0.3 animations:^{
                self.rightButton.alpha = 0;
            }];
        }
            break;
        default:
            break;
    }
}
#pragma mark - 左右按钮
//设置左侧按钮
- (void)setLeftButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted title:(NSString *)title titleColor:(UIColor *)titleColor
{
    [self.leftButton setImage:normal forState:UIControlStateNormal];
    [self.leftButton setImage:highlighted forState:UIControlStateHighlighted];
    [self.leftButton setTitle:title forState:UIControlStateNormal];
    [self.leftButton setTitleColor:titleColor forState:UIControlStateNormal];
}
- (void)setLeftButtonWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor {
    [self setLeftButtonWithNormal:image highlighted:image title:title titleColor:titleColor];
}
- (void)setLeftButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted {
    [self setLeftButtonWithNormal:normal highlighted:highlighted title:nil titleColor:nil];
}
- (void)setLeftButtonWithImage:(UIImage *)image {
    [self setLeftButtonWithNormal:image highlighted:image title:nil titleColor:nil];
}
- (void)setLeftButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor {
    [self setLeftButtonWithNormal:nil highlighted:nil title:title titleColor:titleColor];
}

//设置右侧最外侧按钮
- (void)setRightButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted title:(NSString *)title titleColor:(UIColor *)titleColor
{
    [self.rightButton setImage:normal forState:UIControlStateNormal];
    [self.rightButton setImage:highlighted forState:UIControlStateHighlighted];
    [self.rightButton setTitle:title forState:UIControlStateNormal];
    [self.rightButton setTitleColor:titleColor forState:UIControlStateNormal];
}
- (void)setRightButtonWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor {
    [self setRightButtonWithNormal:image highlighted:image title:title titleColor:titleColor];
}
- (void)setRightButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted {
    [self setRightButtonWithNormal:normal highlighted:highlighted title:nil titleColor:nil];
}
- (void)setRightButtonWithImage:(UIImage *)image {
    [self setRightButtonWithNormal:image highlighted:image title:nil titleColor:nil];
}
- (void)setRightButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor {
    [self setRightButtonWithNormal:nil highlighted:nil title:title titleColor:titleColor];
}
//设置右侧第一个按钮
- (void)setSubRightButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted title:(NSString *)title titleColor:(UIColor *)titleColor
{
    [self.rightSubBtn setImage:normal forState:UIControlStateNormal];
    [self.rightSubBtn setImage:highlighted forState:UIControlStateHighlighted];
    [self.rightSubBtn setTitle:title forState:UIControlStateNormal];
    [self.rightSubBtn setTitleColor:titleColor forState:UIControlStateNormal];
}
- (void)setSubRightButtonWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor {
    [self setSubRightButtonWithNormal:image highlighted:image title:title titleColor:titleColor];
}
- (void)setSubRightButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted {
    [self setSubRightButtonWithNormal:normal highlighted:highlighted title:nil titleColor:nil];
}
- (void)setSubRightButtonWithImage:(UIImage *)image {
    [self setSubRightButtonWithNormal:image highlighted:image title:nil titleColor:nil];
}
- (void)setSubRightButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor {
    [self setSubRightButtonWithNormal:nil highlighted:nil title:title titleColor:titleColor];
}
#pragma  mark - 设置显示信息
-(void)setTitle:(NSString *)title {
    _title = title;
    self.titleLable.hidden = NO;
    self.titleLable.text = _title;
}
- (void)setTitleLabelColor:(UIColor *)titleLabelColor {
    _titleLabelColor = titleLabelColor;
    self.titleLable.textColor = _titleLabelColor;
}
- (void)setTitleLabelFont:(UIFont *)titleLabelFont {
    _titleLabelFont = titleLabelFont;
    self.titleLable.font = _titleLabelFont;
}
-(void)setBarBackgroundColor:(UIColor *)barBackgroundColor {
    self.backgroundImageView.hidden = YES;
    _barBackgroundColor = barBackgroundColor;
    self.backgroundView.hidden = NO;
    self.backgroundView.backgroundColor = _barBackgroundColor;
}
- (void)setBarBackgroundImage:(UIImage *)barBackgroundImage {
    self.backgroundView.hidden = YES;
    _barBackgroundImage = barBackgroundImage;
    self.backgroundImageView.hidden = NO;
    self.backgroundImageView.image = _barBackgroundImage;
}
-(void)setSearchWord:(NSString *)searchWord
{
    _searchWord = searchWord;
    self.customSearch.searchWord = _searchWord;
}
#pragma  mark - 设置视图显示
- (void)setBottomLineHidden:(BOOL)hidden {
    self.bottomLine.hidden = hidden;
}
- (void)setBackgroundAlpha:(CGFloat)alpha {
    self.backgroundView.alpha = alpha;
    self.backgroundImageView.alpha = alpha;
    self.bottomLine.alpha = alpha;
}

#pragma  mark - 按钮点击方法
-(void)clickSubRight
{
    NSLog(@"点击了右侧第一个按钮");
    if (self.onClickSubRightButton) {
        self.onClickSubRightButton();
    }
}
-(void)clickLeft
{
    NSLog(@"点击了左侧按钮");
    if (self.onClickLeftButton) {
        self.onClickLeftButton();
    }
}
-(void)clickRight
{
    NSLog(@"点击了右侧按钮");
    if (self.onClickRightButton) {
        self.onClickRightButton();
    }
}
#pragma  mark - setter and getter
-(UIButton *)leftButton
{
    if (!_leftButton) {
        _leftButton = [[UIButton alloc] init];
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:SCREENW==320?14:15];
        [_leftButton addTarget:self action:@selector(clickLeft) forControlEvents:UIControlEventTouchUpInside];
        _leftButton.imageView.contentMode = UIViewContentModeCenter;
        _leftButton.hidden = YES;
    }
    return _leftButton;
}
-(UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [[UIButton alloc] init];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:SCREENW==320?14:15];
        [_rightButton addTarget:self action:@selector(clickRight) forControlEvents:UIControlEventTouchUpInside];
        _rightButton.imageView.contentMode = UIViewContentModeCenter;
        _rightButton.hidden = YES;
    }
    return _rightButton;
}
-(UIButton *)rightSubBtn {
    if (!_rightSubBtn) {
        _rightSubBtn = [[UIButton alloc] init];
        _rightSubBtn.titleLabel.font = [UIFont systemFontOfSize:SCREENW==320?14:15];
        [_rightSubBtn addTarget:self action:@selector(clickSubRight) forControlEvents:UIControlEventTouchUpInside];
        _rightSubBtn.imageView.contentMode = UIViewContentModeCenter;
        _rightSubBtn.hidden = YES;
    }
    return _rightSubBtn;
}
-(UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.textColor = kBlackColor;
        _titleLable.font = [UIFont systemFontOfSize:18];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.hidden = YES;
    }
    return _titleLable;
}
- (UIView *)bottomLine {
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = kSplitLineColor;
    }
    return _bottomLine;
}
- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] init];
    }
    return _backgroundView;
}
-(UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.hidden = YES;
    }
    return _backgroundImageView;
}
-(CustomSearch *)customSearch
{
    if (!_customSearch) {
        _customSearch = [[CustomSearch alloc]init];
        _customSearch.hidden = YES;
        [_customSearch sui_addTapGes:^(UITapGestureRecognizer * _Nonnull cTapGes) {
            if (self.onClickSearchButton) {
                self.onClickSearchButton();
            }
        }];
    }
    return _customSearch;
}
-(SystemSearch *)systemSearchBar
{
    if (!_systemSearchBar) {
        NSInteger top = IS_iPhoneX ? 44 : 20;
        _systemSearchBar = [[SystemSearch alloc]initWithFrame:CGRectMake(0, top, SCREENW-46, 44)];
        _systemSearchBar.iconAlign = SearchBarIconHidden;
        _systemSearchBar.textColor = kBlackColor;
        _systemSearchBar.hidden = YES;
    }
    return _systemSearchBar;
}
#pragma  mark -- 配置方法
+(void)configRightBtnAndTitle:(NSString *)title andRightBtnTitle:(NSString *)rightTitle andOnBtnClicked:(onBtnClicked)onclickBtn andViewController:(BaseViewController *)vc
{
    vc.navigationController.navigationBarHidden = YES;
    vc.navigationController.navigationBar.translucent = YES;
    vc.customNavBar.title = title;
    vc.customNavBar.onClickRightButton = onclickBtn;
    [vc.customNavBar setRightButtonWithTitle:rightTitle titleColor:kThemeColor];
    [vc.customNavBar updataNavType:Nav_Type_Default];
}
+(void)configBackBtnAndTitle:(NSString *)title andViewController:(BaseViewController *)vc
{
    vc.navigationController.navigationBarHidden = YES;
    vc.navigationController.navigationBar.translucent = YES;
    vc.customNavBar.title = title;
    [vc.customNavBar setLeftButtonWithImage:[UIImage imageNamed:@"arrow_light_white_large"]];
    vc.customNavBar.titleLabelColor = [UIColor whiteColor];
    [vc.customNavBar updataNavType:Nav_Type_Default];
    __weak BaseViewController * weakself = vc;
    vc.customNavBar.onClickLeftButton = ^{
        [weakself back];
    };
}
+(void)configTitle:(NSString *)title andViewController:(BaseViewController *)vc
{
    vc.navigationController.navigationBarHidden = YES;
    vc.navigationController.navigationBar.translucent = YES;
    vc.customNavBar.title = title;
    [vc.customNavBar updataNavType:Nav_Type_Default];
}
+(void)configTitle:(NSString *)title andLeftBtnWithImage:(NSString *)LeftImgName andOnLeftBtnClicked:(onBtnClicked)onLeftClickBtn andViewController:(BaseViewController *)vc
{
    vc.navigationController.navigationBarHidden = YES;
    vc.navigationController.navigationBar.translucent = YES;
    vc.customNavBar.title = title;
    [vc.customNavBar setLeftButtonWithImage:[UIImage imageNamed:LeftImgName]];
    vc.customNavBar.onClickLeftButton = onLeftClickBtn;
    [vc.customNavBar updataNavType:Nav_Type_Default];
}
+(void)configBackBtnAndTitle:(NSString *)title andRightBtnTitle:(NSString *)rightTitle andOnBtnClicked:(onBtnClicked)onclickBtn andViewController:(BaseViewController *)vc;
{
    vc.navigationController.navigationBarHidden = YES;
    vc.navigationController.navigationBar.translucent = YES;
    vc.customNavBar.title = title;
    __weak BaseViewController * weakself = vc;
    vc.customNavBar.onClickRightButton = onclickBtn;
    [vc.customNavBar setRightButtonWithTitle:rightTitle titleColor:kThemeColor];
    [vc.customNavBar setLeftButtonWithImage:[UIImage imageNamed:@"back"]];
    [vc.customNavBar updataNavType:Nav_Type_Default];
    vc.customNavBar.onClickLeftButton = ^{
        [weakself back];
    };
}
+(void)configBackBtnAndTitle:(NSString *)title andRightBtnTitle:(NSString *)rightTitle andOnBtnClicked:(onBtnClicked)onclickBtn andRightBtnWidth:(CGFloat)width andViewController:(BaseViewController *)vc
{
    vc.navigationController.navigationBarHidden = YES;
    vc.navigationController.navigationBar.translucent = YES;
    vc.customNavBar.title = title;
    __weak BaseViewController * weakself = vc;
    vc.customNavBar.onClickRightButton = onclickBtn;
    [vc.customNavBar setRightButtonWithTitle:rightTitle titleColor:kThemeColor];
    [vc.customNavBar setLeftButtonWithImage:[UIImage imageNamed:@"back"]];
    [vc.customNavBar updataNavType:Nav_Type_Default];
    NSInteger top = IS_iPhoneX ? 44 : 20;
    [vc.customNavBar.rightButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.right.offset(-5);
        make.top.offset(top);
        make.width.equalTo(@(width));
    }];
    vc.customNavBar.onClickLeftButton = ^{
        [weakself back];
    };
}
+(void)configBackBtnAndTitle:(NSString *)title andRightBtnImg:(NSString *)rightImg andOnBtnClicked:(onBtnClicked)onclickBtn andViewController:(BaseViewController *)vc
{
    vc.navigationController.navigationBarHidden = YES;
    vc.navigationController.navigationBar.translucent = YES;
    vc.customNavBar.title = title;
    __weak BaseViewController * weakself = vc;
    vc.customNavBar.onClickRightButton = onclickBtn;
    [vc.customNavBar setRightButtonWithImage:[UIImage imageNamed:rightImg]];
    [vc.customNavBar setLeftButtonWithImage:[UIImage imageNamed:@"back"]];
    [vc.customNavBar updataNavType:Nav_Type_Default];
    vc.customNavBar.onClickLeftButton = ^{
        [weakself back];
    };
}
+(void)configLeftBtnWithImage:(NSString *)LeftImgName andRightBtnImage:(NSString *)rigImgName andOnLeftBtnClicked:(onBtnClicked)onLeftClickBtn andOnRightBtnClicked:(onBtnClicked)onRightclickBtn andOnSearchBtnClicked:(onBtnClicked)onSearchClickBtn andViewController:(BaseViewController *)vc;
{
    vc.navigationController.navigationBarHidden = YES;
    vc.navigationController.navigationBar.translucent = YES;
    vc.customNavBar.onClickRightButton = onRightclickBtn;
    vc.customNavBar.onClickLeftButton = onLeftClickBtn;
    vc.customNavBar.onClickSearchButton = onSearchClickBtn;
    
    [vc.customNavBar setRightButtonWithImage:[UIImage imageNamed:rigImgName]];
    [vc.customNavBar setLeftButtonWithImage:[UIImage imageNamed:LeftImgName]];
    [vc.customNavBar updataNavType:Nav_Type_Search];
}
+(void)configNavTitle:(NSString *)title andLeftImage:(NSString *)LeftImgName andRightBtnTitle:(NSString *)rightBtnTitle andSubRightBtnImage:(NSString *)subRBtnImage andOnLeftBtnClicked:(onBtnClicked)onLeftClickBtn andOnRightBtnClicked:(onBtnClicked)onRightclickBtn andOnSubRightBtnClicked:(onBtnClicked)onSubRightClickBtn andViewController:(BaseViewController *)vc;
{
    vc.navigationController.navigationBarHidden = YES;
    vc.navigationController.navigationBar.translucent = YES;
    vc.customNavBar.onClickRightButton = onRightclickBtn;
    vc.customNavBar.onClickLeftButton = onLeftClickBtn;
    vc.customNavBar.onClickSubRightButton = onSubRightClickBtn;
    vc.customNavBar.title = title;
    
    [vc.customNavBar setSubRightButtonWithImage:[UIImage imageNamed:subRBtnImage]];
    [vc.customNavBar setRightButtonWithTitle:rightBtnTitle titleColor:kThemeColor];
    [vc.customNavBar setLeftButtonWithImage:[UIImage imageNamed:LeftImgName]];
    [vc.customNavBar updataNavType:Nav_Type_MoreRightBtn];
}
+(void)configLeftBtnWithImage:(NSString *)LeftImgName andOnLeftBtnClicked:(onBtnClicked)onLeftClickBtn andOnSearchBtnClicked:(onBtnClicked)onSearchClickBtn andViewController:(BaseViewController *)vc;
{
    vc.navigationController.navigationBarHidden = YES;
    vc.navigationController.navigationBar.translucent = YES;
    vc.customNavBar.onClickLeftButton = onLeftClickBtn;
    vc.customNavBar.onClickSearchButton = onSearchClickBtn;
    
    [vc.customNavBar setLeftButtonWithImage:[UIImage imageNamed:LeftImgName]];
    [vc.customNavBar updataNavType:Nav_Type_Search_LeftBtn];
}
+(void)configSystemSearchWithPlaceholder:(NSString *)placeHoder andRightBtnTitle:(NSString *)rightBtnTitle andOnRightBtnClick:(onBtnClicked)onRightBtnClick andViewController:(BaseViewController *)vc;
{
    vc.navigationController.navigationBarHidden = YES;
    vc.navigationController.navigationBar.translucent = YES;
    vc.customNavBar.onClickRightButton = onRightBtnClick;
    vc.customNavBar.systemSearchBar.placeholder = placeHoder;
    [vc.customNavBar setRightButtonWithTitle:rightBtnTitle titleColor:kLightBlackColor];
    vc.customNavBar.systemSearchBar.clearBtnModel = UITextFieldViewModeWhileEditing;
    [vc.customNavBar updataNavType:Nav_Type_SystemSearch_Right];
}
+(void)configSystemSearchWithPlaceholder:(NSString *)placeHoder andLeftBtnWithImage:(NSString *)LeftImgName andOnLeftBtnClicked:(onBtnClicked)onLeftClickBtn andRightBtnTitle:(NSString *)rightBtnTitle andOnRightBtnClick:(onBtnClicked)onRightBtnClick andViewController:(BaseViewController *)vc;
{
    vc.navigationController.navigationBarHidden = YES;
    vc.navigationController.navigationBar.translucent = YES;
    vc.customNavBar.onClickLeftButton = onLeftClickBtn;
    vc.customNavBar.onClickRightButton = onRightBtnClick;
    vc.customNavBar.systemSearchBar.placeholder = placeHoder;
    [vc.customNavBar setRightButtonWithTitle:rightBtnTitle titleColor:kLightBlackColor];
    [vc.customNavBar setLeftButtonWithNormal:[UIImage imageNamed:LeftImgName] highlighted:[UIImage imageNamed:LeftImgName]];
    vc.customNavBar.systemSearchBar.clearBtnModel = UITextFieldViewModeWhileEditing;
    [vc.customNavBar updataNavType:Nav_Type_SystemSearch_Right_Left];
}
+(void)configSystemSearchWithText:(NSString *)text andOnLeftBtnClicked:(onBtnClicked)onLeftClickBtn andViwController:(BaseViewController *)vc
{
    vc.navigationController.navigationBarHidden = YES;
    vc.navigationController.navigationBar.translucent = YES;
    [vc.customNavBar setLeftButtonWithImage:[UIImage imageNamed:@"back"]];
    vc.customNavBar.onClickLeftButton = onLeftClickBtn;
    vc.customNavBar.systemSearchBar.text = text;
    vc.customNavBar.systemSearchBar.clearBtnModel = UITextFieldViewModeAlways;
    [vc.customNavBar updataNavType:Nav_Type_SystemSearch_Left];
}
@end
