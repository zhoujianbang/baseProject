//
//  CustomTextField.m
//  MeicaiStore
//
//  Created by meicai on 2018/1/23.
//  Copyright © 2018年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import "CustomTextField.h"

@implementation CustomTextField
-(CGRect)leftViewRectForBounds:(CGRect)bounds{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 12;
    return iconRect;
}
- (CGRect)textRectForBounds:(CGRect)bounds{
    return CGRectInset(bounds,12, 0);
}
- (CGRect)editingRectForBounds:(CGRect)bounds{
    return CGRectInset(bounds,12, 0);
}
@end
