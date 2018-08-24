//
//  NSArray+Categorys.m
//  FrameworkProject
//
//  Created by 陈哲是个好孩子 on 15/8/4.
//  Copyright (c) 2015年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import "NSArray+Categorys.h"

@implementation NSArray (Log)

-(NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString * mutaStr = [NSMutableString stringWithString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [mutaStr appendFormat:@"\t%@,\n", obj];
    }];
    
    [mutaStr appendString:@")"];
    
    return mutaStr;
}

@end
