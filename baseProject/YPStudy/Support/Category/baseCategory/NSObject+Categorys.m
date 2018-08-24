//
//  NSObject+Categorys.m
//  MCBasicComponent
//
//  Created by 陈哲是个好孩子 on 15/8/3.
//  Copyright (c) 2015年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import "NSObject+Categorys.h"
#import <objc/runtime.h>

@implementation NSObject (checkObj)

-(NSArray *)checkHttpArray
{
    if (![self isKindOfClass:[NSArray class]])
    {
        return [NSArray array];
    }
    return (NSArray *)self;
}

-(NSMutableArray *)checkHttpMutableArray
{
    if (![self isKindOfClass:[NSMutableArray class]])
    {
        return [NSMutableArray array];
    }
    return (NSMutableArray *)self;
}

-(NSDictionary *)checkHttpDictionary
{
    if (![self isKindOfClass:[NSDictionary class]])
    {
        return [NSDictionary dictionary];
    }
    return (NSDictionary *)self;
}

-(NSMutableDictionary *)checkHttpMutableDictionary
{
    if (![self isKindOfClass:[NSMutableDictionary class]])
    {
        return [NSMutableDictionary dictionary];
    }
    return (NSMutableDictionary *)self;
}


@end

@implementation NSObject (RunTime)

-(NSArray *)getPrivateApiMethod
{
    NSString * className = NSStringFromClass([self class]);
    const char * cClassName = [className UTF8String];
    id theClass = objc_getClass(cClassName);
    unsigned int methodCount;
    Method * methods = class_copyMethodList(theClass, &methodCount);
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i < methodCount; i++)
    {
        SEL aSEL = method_getName(*(methods + i));
        NSString * apiStr = NSStringFromSelector(aSEL);
        [arr addObject:apiStr];
    }
    return arr;
}

-(NSArray *)getPrivateApiProperty
{
    unsigned int propertyCount;
    objc_property_t * properties = class_copyPropertyList([self class], &propertyCount);
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i < propertyCount; i++)
    {
        objc_property_t property = properties[i];
        NSString * propertyStr = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [arr addObject:propertyStr];
    }
    return arr;
}

-(NSArray *)getPrivateApiPropertyAndPropertyType
{
    unsigned int propertyCount;
    objc_property_t * properties = class_copyPropertyList([self class], &propertyCount);
    NSMutableArray * totalArr = [NSMutableArray arrayWithCapacity:1];
    NSMutableArray * arr1 = [NSMutableArray arrayWithCapacity:1];
    NSMutableArray * arr2 = [NSMutableArray arrayWithCapacity:1];
    NSUInteger loc = 3;
    NSUInteger len = 0;
    NSString * propertyStr = nil;
    NSString * att = nil;
    for (int i = 0; i < propertyCount; i++)
    {
        objc_property_t property = properties[i];
        propertyStr = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [arr1 addObject:propertyStr];
        
        len = [att rangeOfString:@","].location - loc - 1;
        att = [[NSString alloc] initWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
        [arr2 addObject:[NSString stringWithString:[att substringWithRange:NSMakeRange(loc, len)]]];
    }
    [totalArr addObject:arr1];
    [totalArr addObject:arr2];
    return totalArr;
    
}

@end

@implementation NSObject (Model)

-(instancetype)convertModelWithDictionary:(NSDictionary *)dict
{
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    
    for (int i = 0; i < count; i ++) {
        
        objc_property_t property = properties[i];
        //        属性名
        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        //        属性类型
        char *propertyTypeC = property_copyAttributeValue(property, "T");
        NSString *propertyType = [NSString stringWithCString:propertyTypeC encoding:NSUTF8StringEncoding];
        free(propertyTypeC);
        
        if (!(propertyName.length > 0 && propertyType.length > 0))
        {
            continue;
        }
        
//        if ([propertyType isEqualToString:@"B"])
//        {
//            propertyType = @"BOOL";
//        }
//        else if ([propertyType isEqualToString:@"d"])
//        {
//            propertyType = @"CGFloat";
//        }
//        else if ([propertyType isEqualToString:@"q"])
//        {
//            propertyType = @"NSInteger";
//        }
//        else if ([propertyType isEqualToString:@"Q"])
//        {
//            propertyType = @"NSUInteger";
//        }
//        else
//        {
//            if (propertyType.length > 5) {
//                NSRange range = NSMakeRange(2, [propertyType length]-3);
//                propertyType = [propertyType substringWithRange:range];
//            }
//        }
        
        id object = [dict objectForKey:propertyName];
        
        if (object != nil) {
            
            if ([object isKindOfClass:[NSArray class]]) {//如果取出的object是数组，做特殊处理
                
                NSMutableArray *modelArray = [NSMutableArray array];
                for (id obj in object) {
                    
                    if ([obj isKindOfClass:[NSDictionary class]]) {//如果数组里面是字典，构造另一个类的对象放入数组
                        /**
                         *  通过属性名获取类的对象
                         */
                        NSString *firstStr = [propertyName substringToIndex:1];
                        id arrayObject = [[NSClassFromString([NSString stringWithFormat:@"%@%@",[firstStr capitalizedString], [propertyName substringFromIndex:1]]) alloc]init];
                        arrayObject = [arrayObject convertModelWithDictionary:obj];
                        [modelArray addObject:arrayObject];
                        
                    }else{//如果数组里面不是字典，直接加入
                        [modelArray addObject:obj];
                    }
                    
                    
                }
                [self setValue:modelArray forKey:propertyName];
                
            }else if([object isKindOfClass:[NSDictionary class]]){//如果取出的object是字典，使用另一个类的对象作为属性
                
                /**
                 *  通过属性名获取类的对象
                 */
                NSString *firstStr = [propertyName substringToIndex:1];
                id dicObject = [[NSClassFromString([NSString stringWithFormat:@"%@%@",[firstStr capitalizedString], [propertyName substringFromIndex:1]]) alloc]init];
                dicObject = [dicObject convertModelWithDictionary:object];
                [self setValue:dicObject forKey:propertyName];
                
            }else{
//                if ([object isKindOfClass:NSClassFromString(propertyType)]){//object和属性类型相同直接赋值
                    [self setValue:object forKey:propertyName];
//                }
            }
            
        }
        
    }
    free(properties);
    return self;
}

@end
