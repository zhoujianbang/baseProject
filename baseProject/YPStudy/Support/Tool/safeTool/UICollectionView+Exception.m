//
//  UICollectionView+Exception.m
//  MeicaiStore
//
//  Created by Zack on 2017/7/20.
//  Copyright © 2017年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import "UICollectionView+Exception.h"
#import "NSObject+Swizzling.h"

@implementation UICollectionView (Exception)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("UICollectionView") swizzleMethod:@selector(scrollToItemAtIndexPath:atScrollPosition:animated:) swizzledSelector:@selector(replace_scrollToItemAtIndexPath:atScrollPosition:animated:)];
        }
    });
}


- (void)replace_scrollToItemAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UICollectionViewScrollPosition)scrollPosition animated:(BOOL)animated{
    if (indexPath.section >= self.numberOfSections) {
        NSAssert(NO, @"what the fuck!!!");
        return;
    }
    if (indexPath.row >= [self numberOfItemsInSection:indexPath.section]) {
        NSAssert(NO, @"what the fuck!!!");
        return;
    }
    return [self replace_scrollToItemAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
}


@end
