//
//  NSException+Categorys.m
//  FrameworkProject
//
//  Created by 陈哲是个好孩子 on 15/8/4.
//  Copyright (c) 2015年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import "NSException+Categorys.h"
#include <execinfo.h>

@implementation NSException (Trace)

- (NSArray *)backtrace
{
    NSArray *addresses = self.callStackReturnAddresses;
    unsigned count = (int)addresses.count;
    void **stack = malloc(count * sizeof(void *));
    
    for (unsigned i = 0; i < count; ++i)
    {
        stack[i] = (void *)[addresses[i] longValue];
    }
    
    
    char ** strings = (char **)backtrace_symbols(stack, count);
    NSMutableArray *ret = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; ++i)
    {
        [ret addObject:@(strings[i])];
    }
    
    
    free(stack);
    free(strings);
    
    return ret;
}

@end
