//
//  UIImage+Categorys.m
//  FrameworkProject
//
//  Created by 陈哲是个好孩子 on 15/8/4.
//  Copyright (c) 2015年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import "UIImage+Categorys.h"

@implementation UIImage (Transform)

-(UIImage *)compressToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    CGRect rect = {{0,0}, size};
    [self drawInRect:rect];
    UIImage * compressedImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return compressedImg;
}

-(CGSize)getContainerSizeWithLimitWidth:(CGFloat)limitWidth andLimitHeight:(CGFloat)limitHeight
{
    CGSize newSize;
    CGFloat width1 = self.size.width;
    CGFloat height1 = self.size.height;
    if (width1 <= limitWidth && height1 <= limitHeight)
    {
        newSize = self.size;
    }
    else
    {
        if (width1 >= height1)
        {
            newSize = CGSizeMake(limitWidth, ((height1 * limitWidth) / width1));
        }
        else
        {
            newSize = CGSizeMake(((width1 * limitHeight) / height1), limitHeight);
        }
    }
    return newSize;
}

-(UIImage *)resizeImageWithEdge:(UIEdgeInsets)edgeInset
{
    return [self resizableImageWithCapInsets:edgeInset resizingMode:UIImageResizingModeTile];
}

+(UIImage *)transformToPureImageWithColor:(UIColor *)color
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

@end

@implementation UIImage (Bundle)

+(NSString*)getAppIconPath
{
    NSString* iconFilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"] ;
    NSString* iconBasename = [iconFilename stringByDeletingPathExtension] ;
    NSString* iconExtension = [iconFilename pathExtension] ;
    return [[NSBundle mainBundle] pathForResource:iconBasename
                                           ofType:iconExtension] ;
}

+(UIImage *)getAppIcon
{
    return [[UIImage alloc] initWithContentsOfFile:[self getAppIconPath]];
}
+ (UIImage *)gradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize {
    if (!colors.count) {
        return nil;
    }
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(imgSize, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
//    当colors为空的时候，colorSpace初始化的retain计数为0
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint start;
    CGPoint end;
    switch (gradientType) {
        case GradientTypeTopToBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        case GradientTypeLeftToRight:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, 0.0);
            break;
        case GradientTypeUpleftToLowright:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, imgSize.height);
            break;
        case GradientTypeUprightToLowleft:
            start = CGPointMake(imgSize.width, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        default:
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
//    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}

@end
