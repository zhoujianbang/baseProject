//
//  CustomSearch.h
//  MeicaiStore
//
//  Created by meicai on 2018/1/18.
//  Copyright © 2018年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

//自定义搜索框
@interface CustomSearch : UIView

@property (nonatomic, strong) UIView * searchView;

@property (nonatomic, strong) UIView * searchItemView; //存放搜图图片和文字的视图
@property (nonatomic, strong) UIImageView * searchImageView;
@property (nonatomic, strong) UILabel * textLabel;

@property (nonatomic, strong) NSString * searchWord; 
@end
