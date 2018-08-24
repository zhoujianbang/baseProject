//
//  CustomSearch.m
//  MeicaiStore
//
//  Created by meicai on 2018/1/18.
//  Copyright © 2018年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import "CustomSearch.h"


@implementation CustomSearch

-(id)init
{
    self = [super init];
    if(self){
        [self configUI];
    }
    return self;
}

-(void)configUI
{
    [self addSubview:self.searchView];
    [self.searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self.searchView addSubview:self.searchItemView];
    [self.searchItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(@17);
    }];
}

-(UIView *)searchView
{
    if (!_searchView) {
        _searchView = [[UIView alloc]init];
        _searchView.layer.cornerRadius = 30/2;
        _searchView.clipsToBounds = YES;
        _searchView.backgroundColor = [UIColor whiteColor];
        _searchView.layer.borderColor = kSplitLineColor.CGColor;
        _searchView.layer.borderWidth = 0.5f;
    }
    return _searchView;
}
-(UIImageView *)searchImageView
{
    if (!_searchImageView) {
        _searchImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_Search"]];
    }
    return _searchImageView;
}
-(UILabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [ViewTool createLabelWithFontSize:14 textColor:kLightBlackColor borderWidth:0 borderColor:0 cornerRadius:0];
    }
    return _textLabel;
}
-(UIView *)searchItemView
{
    if (!_searchItemView) {
        _searchItemView = [[UIView alloc]init];
        [_searchItemView addSubview:self.textLabel];
        [_searchItemView addSubview:self.searchImageView];
        
        [_searchImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_searchItemView);
            make.width.equalTo(@14);
            make.height.equalTo(@14);
            make.centerY.equalTo(_searchItemView.mas_centerY);
        }];
        [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_searchImageView.mas_right).offset(6);
            make.right.equalTo(_searchItemView);
            make.centerY.equalTo(_searchItemView.mas_centerY);
        }];
    }
    return _searchItemView;
}
-(void)setSearchWord:(NSString *)searchWord
{
    _textLabel.text = searchWord;
}
@end
