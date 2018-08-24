//
//  MCAlertTool.h
//  MeicaiCrm
//
//  Created by meicai on 2018/3/6.
//  Copyright © 2018年 meicai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "blockMacro.h"

//alert工具
@interface AlertTool : NSObject

+(void)showAlertWithTitle:(NSString *)titie andMsg:(NSString *)msg
        andConfirmBtnText:(NSString *)confirmText
         andCancelBtnText:(NSString *)cancelText
          andConfirmBlock:(ClickBlock)confirmBlock
           andCancelBlock:(ClickBlock)cancelBlock;

@end
