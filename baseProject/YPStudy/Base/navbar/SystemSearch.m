//
//  SystemSearch.m
//  MeicaiStore
//
//  Created by meicai on 2018/1/23.
//  Copyright © 2018年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import "SystemSearch.h"
#import "CustomTextField.h"

@interface SystemSearch()<UITextFieldDelegate>
{
    CustomTextField *_textField;
    UIImageView *_iconView;
    UIImageView *_iconCenterView;
    SearchBarIconAlign _iconAlignTemp;
}

@end

@implementation SystemSearch
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buidView];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self buidView];
}
-(void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview) {
        
    }
}
-(void)buidView{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 44);
    _textField = ({
        CustomTextField *textField = [[CustomTextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 35)];
        
        textField.layer.cornerRadius = 17.5;
        textField.delegate = self;
        textField.borderStyle = UITextBorderStyleNone;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.returnKeyType = UIReturnKeySearch;
        textField.enablesReturnKeyAutomatically = NO;
        textField.font = [UIFont systemFontOfSize:14.0f];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [textField addTarget:self
                      action:@selector(textFieldDidChange:)
            forControlEvents:UIControlEventEditingChanged];
        textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        textField.borderStyle=UITextBorderStyleNone;
        textField.layer.masksToBounds=YES;
        textField.backgroundColor = kSearchBarBgColor;
        textField.inputAccessoryView = [[UIView alloc]init];
        textField;
    });
    [self addSubview:_textField];
}
-(void)setIconAlign:(SearchBarIconAlign)iconAlign{
    if(!_iconAlignTemp){
        _iconAlignTemp = iconAlign;
    }
    _iconAlign = iconAlign;
    [self ajustIconWith:_iconAlign];
    
}
-(void)ajustIconWith:(SearchBarIconAlign)iconAlign{
    if (_iconAlign == SearchBarIconAlignCenter) {
        _iconCenterView.hidden = NO;
        
        _textField.frame = CGRectMake(7, 7, self.frame.size.width-7*2, 30);
        _textField.textAlignment = NSTextAlignmentCenter;
        
        CGSize titleSize;
        if (!self.text || ![self.text isEqualToString:@""]) {
            titleSize =  [self.text sizeWithAttributes: @{NSFontAttributeName:_textField.font}];
        }else{
            titleSize =  [self.placeholder?:@"" sizeWithAttributes: @{NSFontAttributeName:_textField.font}];
            
        }
        
        CGFloat x = _textField.frame.size.width/2 - titleSize.width/2-25;
        if (!_iconCenterView) {
            _iconCenterView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_Search"]];
            _iconCenterView.contentMode = UIViewContentModeScaleAspectFit;
            [_textField addSubview:_iconCenterView];
        }
        if (x>0) {
            _iconCenterView.frame = CGRectMake(x, 0, _iconCenterView.frame.size.width, _iconCenterView.frame.size.height);
            _textField.leftView = nil;
        }else{
            _iconCenterView.hidden = YES;
            _textField.leftView = _iconView;
        }
        
    }else if(_iconAlign == SearchBarIconAlignLeft){
        _iconCenterView.hidden = YES;
        
        [UIView animateWithDuration:1 animations:^{
            _textField.textAlignment = NSTextAlignmentLeft;
            _iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_Search"]];
            _iconView.contentMode = UIViewContentModeScaleAspectFit;
            _textField.leftView = _iconView;
            _textField.leftViewMode =  UITextFieldViewModeAlways;
        }];
    }else{
        _iconCenterView.hidden = YES;
        
        [UIView animateWithDuration:1 animations:^{
            _textField.textAlignment = NSTextAlignmentLeft;
            _textField.leftView = nil;
            _textField.leftViewMode =  UITextFieldViewModeAlways;
        }];
    }
}
-(NSString *)text{
    return _textField.text;
}

-(void)setText:(NSString *)text{
    _textField.text= text?:@"";
}
-(void)setTextFont:(UIFont *)textFont{
    _textFont = textFont;
    [_textField setFont:_textFont];
}

-(void)setTextBorderStyle:(UITextBorderStyle)textBorderStyle{
    _textBorderStyle = textBorderStyle;
    _textField.borderStyle = textBorderStyle;
}

-(void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    [_textField setTextColor:_textColor];
}
-(void)setIconImage:(UIImage *)iconImage{
    _iconImage = iconImage;
    ((UIImageView*)_textField.leftView).image = _iconImage;
}
-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    _textField.placeholder = placeholder;
    [self setIconAlign:_iconAlign];
}

-(void)setBackgroundImage:(UIImage *)backgroundImage{
    _backgroundImage = backgroundImage;
    
}
-(void)setKeyboardType:(UIKeyboardType)keyboardType{
    _keyboardType = keyboardType;
    _textField.keyboardType = _keyboardType;
}
-(void)setInputView:(UIView *)inputView{
    _inputView = inputView;
    _textField.inputView = _inputView;
}
-(void)setInputAccessoryView:(UIView *)inputAccessoryView{
    _inputAccessoryView = inputAccessoryView;
    _textField.inputAccessoryView = _inputAccessoryView;
}
-(void)setClearBtnModel:(UITextFieldViewMode)clearBtnModel
{
    _clearBtnModel = clearBtnModel;
    _textField.clearButtonMode = clearBtnModel;
}
-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    NSAssert(_placeholder, @"Please set placeholder before setting placeholdercolor");
    
    if ([[[UIDevice currentDevice] systemVersion] integerValue] < 6)
    {
        [_textField setValue:_placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
    }
    else
    {
        _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    }
}
-(BOOL)resignFirstResponder
{
    return [_textField resignFirstResponder];
}
-(void)becomeFirst
{
    [_textField becomeFirstResponder];
}
-(void)setAutoCapitalizationMode:(UITextAutocapitalizationType)type
{
    _textField.autocapitalizationType = type;
}
#pragma --mark textfield delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if(_iconAlignTemp == SearchBarIconAlignCenter){
        self.iconAlign = SearchBarIconAlignLeft;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarShouldBeginEditing:)])
    {
        return [self.delegate searchBarShouldBeginEditing:self];
    }
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarTextDidBeginEditing:)])
    {
        [self.delegate searchBarTextDidBeginEditing:self];
    }
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarShouldEndEditing:)])
    {
        return [self.delegate searchBarShouldEndEditing:self];
    }
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(_iconAlignTemp == SearchBarIconAlignCenter){
        self.iconAlign = SearchBarIconAlignCenter;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarTextDidEndEditing:)])
    {
        [self.delegate searchBarTextDidEndEditing:self];
    }
}
-(void)textFieldDidChange:(UITextField *)textField
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBar:textDidChange:)])
    {
        [self.delegate searchBar:self textDidChange:textField.text];
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBar:shouldChangeTextInRange:replacementText:)])
    {
        return [self.delegate searchBar:self shouldChangeTextInRange:range replacementText:string];
    }
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBar:textDidChange:)])
    {
        [self.delegate searchBar:self textDidChange:@""];
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_textField resignFirstResponder];
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarSearchButtonClicked:)])
    {
        [self.delegate searchBarSearchButtonClicked:self];
    }
    return YES;
}
@end
