//
//  NSDictionary+Categorys.h
//  FrameworkProject
//
//  Created by 陈哲是个好孩子 on 15/8/4.
//  Copyright (c) 2015年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

/*
 (Log)用于打印显示utf格式
 */

#import <Foundation/Foundation.h>

@interface NSDictionary (Log)
/**
 *  由于服务器返回的打印出来不是UTF-8格式，不易查看，于是重写NSDictionary打印的description方法，打印的时候能很清楚看到中文字符
 *
 *  @param locale
 *
 *  @return
 */
-(NSString *)descriptionWithLocale:(id)locale;
@end
