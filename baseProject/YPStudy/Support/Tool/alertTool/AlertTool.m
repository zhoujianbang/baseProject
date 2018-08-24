//
//  MCAlertTool.m
//  MeicaiCrm
//
//  Created by meicai on 2018/3/6.
//  Copyright © 2018年 meicai. All rights reserved.
//

#import "AlertTool.h"

@implementation AlertTool
+(void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg
        andConfirmBtnText:(NSString *)confirmText
         andCancelBtnText:(NSString *)cancelText
          andConfirmBlock:(ClickBlock)confirmBlock
           andCancelBlock:(ClickBlock)cancelBlock
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title?title:@"温馨提示" message:msg?msg:nil preferredStyle:UIAlertControllerStyleAlert];
    
    if (confirmText && confirmText.length > 0) {
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:confirmText?confirmText:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            if (confirmBlock) {
                confirmBlock();
            }
        }];
        [alertController addAction:action1];
    }
    if (cancelText && cancelText.length > 0) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:cancelText?cancelText:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancelBlock) {
                cancelBlock();
            }
        }];
        [alertController addAction:action];
    }
    [[ViewTool getCurrentVC] presentViewController:alertController animated:YES completion:nil];
    
}
@end
