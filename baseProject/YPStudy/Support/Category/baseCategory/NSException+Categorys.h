//
//  NSException+Categorys.h
//  FrameworkProject
//
//  Created by 陈哲是个好孩子 on 15/8/4.
//  Copyright (c) 2015年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSException (Trace)

/**
 *  异常Exception调用，用于打印当前异常堆栈信息
 *
 *  @return
 */
-(NSArray *)backtrace;

@end
