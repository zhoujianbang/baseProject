//
//  UITabBar+Badge.m
//  MeicaiStore
//
//  Created by meicai on 2018/1/16.
//  Copyright © 2018年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import "UIView+Badge.h"

#define TabbarItemNums 5
@implementation UIView (Badge)
//显示小红点
- (void)showBadgeOnItemIndex:(NSInteger)index andText:(id)text{
    if (![NSString stringWithFormat:@"%@",text].length) {
        return;
    }
    //移除之前的小红点
    [self removeBadgeOnItemIndex:index];
    
    //新建小红点
    UILabel *badgeView = [[UILabel alloc]init];
    badgeView.tag = 888 + index;
    badgeView.text = [NSString stringWithFormat:@"%@",text];
    badgeView.layer.cornerRadius = 7.5;//圆形
    badgeView.backgroundColor = [UIColor redColor];//颜色：红色
    badgeView.font = [UIFont systemFontOfSize:10];
    badgeView.textColor = [UIColor whiteColor];
    badgeView.clipsToBounds = YES;
    badgeView.textAlignment = NSTextAlignmentCenter;
    CGSize size = [ViewTool getLabelActualSize:text andFont:10 andLines:0 andlabelWidth:SCREENW];
    
    [self addSubview:badgeView];
    [badgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.equalTo(self.mas_right).offset(-10);
        make.height.equalTo(@15);
        if ((size.width+5) < 15) {
            make.width.equalTo(@(15));
        }else{
            make.width.equalTo(@(size.width+5));
        }
    }];
}
//隐藏小红点
- (void)hideBadgeOnItemIndex:(NSInteger)index{
    //移除小红点
    [self removeBadgeOnItemIndex:index];
}
//移除小红点
- (void)removeBadgeOnItemIndex:(NSInteger)index{
    //按照tag值进行移除
    for (UIView *subView in self.subviews) {
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
        }
    }
}
@end
