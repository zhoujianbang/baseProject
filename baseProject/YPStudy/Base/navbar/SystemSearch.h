//
//  SystemSearch.h
//  MeicaiStore
//
//  Created by meicai on 2018/1/23.
//  Copyright © 2018年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, SearchBarIconAlign) {
    SearchBarIconAlignLeft,
    SearchBarIconAlignCenter,
    SearchBarIconHidden,
};
@class SystemSearch;
@protocol SearchBarDelegate <UIBarPositioningDelegate>

@optional

-(BOOL)searchBarShouldBeginEditing:(SystemSearch *)searchBar; // 返回NO，不能响应
- (void)searchBarTextDidBeginEditing:(SystemSearch *)searchBar; //开始编辑
- (BOOL)searchBarShouldEndEditing:(SystemSearch *)searchBar;
- (void)searchBarTextDidEndEditing:(SystemSearch *)searchBar; // 结束编辑
- (void)searchBar:(SystemSearch *)searchBar textDidChange:(NSString *)searchText;   //文字变化，包括点击X
- (BOOL)searchBar:(SystemSearch *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text; //文字变化之前
- (void)searchBarSearchButtonClicked:(SystemSearch *)searchBar; //点击搜索按钮

@end


@interface SystemSearch : UIView<UITextInputTraits>

@property(nonatomic,assign) id<SearchBarDelegate> delegate;
@property(nonatomic,copy)   NSString *text;
@property(nonatomic,retain) UIColor *textColor;
@property(nonatomic,retain) UIFont *textFont;
@property(nonatomic,copy)   NSString *placeholder;
@property(nonatomic,retain) UIColor *placeholderColor;
@property(nonatomic,retain) UIImage *iconImage;
@property(nonatomic,retain) UIImage *backgroundImage;

@property(nonatomic,assign) UITextFieldViewMode clearBtnModel;
@property(nonatomic,assign) UITextBorderStyle textBorderStyle;
@property(nonatomic)        UIKeyboardType keyboardType;
@property(nonatomic)        SearchBarIconAlign iconAlign; //是否居中


@property (nonatomic, readwrite, retain) UIView *inputAccessoryView;
@property (nonatomic, readwrite, retain) UIView *inputView;

-(BOOL)resignFirstResponder;
-(void)becomeFirst;
-(void)setAutoCapitalizationMode:(UITextAutocapitalizationType)type;
@end
