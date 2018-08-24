//
//  NSDictionary+Categorys.m
//  FrameworkProject
//
//  Created by 陈哲是个好孩子 on 15/8/4.
//  Copyright (c) 2015年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import "NSDictionary+Categorys.h"

@implementation NSDictionary (Log)

-(NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString * mutaStr = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [mutaStr appendFormat:@"\t\"%@\" : \"%@\",\n", key, obj];
    }];
    
    [mutaStr appendString:@"}\n"];
    
    return mutaStr;
}

@end
