//
//  ViewTool.m
//  MeiCaiStore
//
//  Created by 陈哲是个好孩子 on 15/4/24.
//  Copyright (c) 2015年 czCompany. All rights reserved.
//

#import "ViewTool.h"

@implementation ViewTool
+(CGSize)getLabelActualSize:(NSString *)str andFont:(CGFloat)fontSize andLines:(NSInteger)lines andlabelWidth:(CGFloat)labelWidth
{
    NSString *fomateStr = [NSString stringWithFormat:@"%@",str];
    
    CGSize size11 = [fomateStr sizeWithAttributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontSize] forKey:NSFontAttributeName]];
    
    CGSize size = [fomateStr boundingRectWithSize:CGSizeMake(labelWidth, 100000) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontSize] forKey:NSFontAttributeName] context:nil].size;
    
    if (size.width == 0.0)
    {
        size = CGSizeMake(0.0f, 0.0f);
    }
    
    
    if (lines == 0)
    {
        if (size.width < labelWidth)
        {
            labelWidth = size.width;
        }
        return CGSizeMake(labelWidth,size.height);
    }
    else
    {
        NSInteger labelLines = (int)(size.height/size11.height);
        if (labelLines >= lines)
        {
            return CGSizeMake(labelWidth, lines * size11.height);
        }
        else
        {
            return CGSizeMake(labelWidth, labelLines * size11.height);
        }
    }
}

+(UIImage *)changeColorToImage:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(UIImage *)resizeImage:(NSString *)imgName
{
    UIImage *image = [UIImage imageNamed:imgName];
    CGFloat imageW = image.size.width * 0.5;
    CGFloat imageH = image.size.height * 0.5;
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH, imageW, imageH, imageW) resizingMode:UIImageResizingModeTile];
}

+(CGSize)getImageSizeToChange:(UIImage *)image
{
    CGSize newSize;
    if (image.size.width <= 200 && image.size.height <= 200)
    {
        newSize = image.size;
    }
    else
    {
        if (image.size.width >= image.size.height)
        {
            newSize = CGSizeMake(200, ((image.size.height * 200) / image.size.width));
        }
        else
        {
            newSize = CGSizeMake(((image.size.width * 200) / image.size.height), 200);
        }
    }
    return newSize;
}
+(UILabel *)createLabelWithFontSize:(NSInteger)size textColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius
{
    UILabel * label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:size];
    label.textColor = color;
    label.layer.borderWidth = borderWidth;
    label.layer.borderColor = borderColor.CGColor;
    label.layer.cornerRadius = cornerRadius;
    label.numberOfLines = 1;
    label.textAlignment = NSTextAlignmentLeft;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    return label;
}
/**
 *  改变信号栏字体颜色
 *
 *  @param color 颜色参数
 */
+ (void)changeSignalFormatWithColor:(UIColor *)color{
    UIApplication * app = [UIApplication sharedApplication];
    id obj = [app valueForKeyPath:@"statusBar"];
    
    if (@available(iOS 11.0, *)) {
        if (IS_iPhoneX) {
            id obc = [obj valueForKeyPath:@"statusBar"];
            unsigned int propertyCount;
            objc_property_t * properties = class_copyPropertyList([obc class], &propertyCount);
            NSMutableArray * arr = [NSMutableArray arrayWithCapacity:1];
            for (int i = 0; i < propertyCount; i++){
                objc_property_t property = properties[i];
                NSString * propertyStr = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
                
                if ([propertyStr isEqualToString:@"foregroundColor"]){
                    [obj setValue:color forKey:propertyStr];
                }
                [arr sui_addObj:propertyStr];
            }
            free(properties);
        }else{
            id ob = [obj valueForKeyPath:@"superclass"];
            unsigned int propertyCount;
            objc_property_t * properties = class_copyPropertyList([ob class], &propertyCount);
            NSMutableArray * arr = [NSMutableArray arrayWithCapacity:1];
            for (int i = 0; i < propertyCount; i++){
                objc_property_t property = properties[i];
                NSString * propertyStr = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
                
                if ([propertyStr isEqualToString:@"foregroundColor"]){
                    [obj setValue:color forKey:propertyStr];
                }
                [arr sui_addObj:propertyStr];
            }
            free(properties);
        }
        
    }else{
        unsigned int propertyCount;
        objc_property_t * properties = class_copyPropertyList([obj class], &propertyCount);
        NSMutableArray * arr = [NSMutableArray arrayWithCapacity:1];
        for (int i = 0; i < propertyCount; i++){
            objc_property_t property = properties[i];
            NSString * propertyStr = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            
            if ([propertyStr isEqualToString:@"foregroundColor"]){
                [obj setValue:color forKey:propertyStr];
            }
            [arr sui_addObj:propertyStr];
        }
        free(properties);
    }
}

+ (UIViewController *)getCurrentVC
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentVC = [ViewTool getCurrentVCFrom:rootViewController];
    return currentVC;
}

+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    if ([rootVC presentedViewController]) {
        rootVC = [rootVC presentedViewController];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        currentVC = rootVC;
    }
    
    return currentVC;
}

+(void)configShadow:(UIView *)view
{
    view.layer.shadowColor = kLightGray.CGColor;//shadowColor阴影颜色
    view.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    view.layer.shadowOpacity = 0.6;//阴影透明度，默认0
    view.layer.shadowRadius = 2;//阴影半径，默认3
}
+ (CGFloat)getAddStatusHeight{
    if (IS_iPhoneX) {
        return 44.f;
    }else{
        return 0.f;
    }
}
+ (CGFloat)getStatusBarHeight{
    if (IS_iPhoneX) {
        return 44.f;
    }else{
        return 20.f;
    }
}

+ (CGFloat)getTabbarHeight{
    if (IS_iPhoneX) {
        return 83.f;
    }else{
        return 49.f;
    }
}

+ (CGFloat)getTabbarSafeBottomMargin{
    if (IS_iPhoneX) {
        return 34.f;
    }else{
        return 0.f;
    }
}

+ (CGFloat)getStatusBarAndNavigationBarHeight{
    if (IS_iPhoneX) {
        return 88.f;
    }else{
        return 64.f;
    }
}
@end
