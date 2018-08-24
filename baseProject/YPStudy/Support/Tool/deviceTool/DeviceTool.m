//
//  DeviceTool.m
//  YPStudy
//
//  Created by meicai on 2018/3/5.
//  Copyright © 2018年 meicai. All rights reserved.
//
#import "DeviceTool.h"
#include <sys/types.h>
#include <sys/sysctl.h>

#define DH_MACHINE_IPHONE_1_1 @"iPhone1,1"
#define DH_MACHINE_IPHONE_1_2 @"iPhone1,2"
#define DH_MACHINE_IPHONE_2_1 @"iPhone2,1"
#define DH_MACHINE_IPHONE_3_1 @"iPhone3,1"
#define DH_MACHINE_IPHONE_3_3 @"iPhone3,3"
#define DH_MACHINE_IPHONE_4_1 @"iPhone4,1"
#define DH_MACHINE_IPHONE_5_1 @"iPhone5,1"
#define DH_MACHINE_IPHONE_5_2 @"iPhone5,2"
#define DH_MACHINE_IPHONE_5_3 @"iPhone5,3"
#define DH_MACHINE_IPHONE_5_4 @"iPhone5,4"
#define DH_MACHINE_IPHONE_6_1 @"iPhone6,1"
#define DH_MACHINE_IPHONE_6_2 @"iPhone6,2"
#define DH_MACHINE_IPHONE_7_1 @"iPhone7,1"
#define DH_MACHINE_IPHONE_7_2 @"iPhone7,2"
#define DH_MACHINE_IPHONE_8_1 @"iPhone8,1"
#define DH_MACHINE_IPHONE_8_2 @"iPhone8,2"
#define DH_MACHINE_IPHONE_8_4 @"iPhone8,4"
#define DH_MACHINE_IPHONE_9_1 @"iPhone9,1"
#define DH_MACHINE_IPHONE_9_2 @"iPhone9,2"
#define DH_MACHINE_IPHONE_9_3 @"iPhone9,3"
#define DH_MACHINE_IPHONE_9_4 @"iPhone9,4"
#define DH_MACHINE_IPHONE_10_1 @"iPhone10,1"
#define DH_MACHINE_IPHONE_10_2 @"iPhone10,2"
#define DH_MACHINE_IPHONE_10_3 @"iPhone10,3"
#define DH_MACHINE_IPHONE_10_4 @"iPhone10,4"
#define DH_MACHINE_IPHONE_10_5 @"iPhone10,5"
#define DH_MACHINE_IPHONE_10_6 @"iPhone10,6"

#define DH_MACHINE_IPOD_1_1 @"iPod1,1"
#define DH_MACHINE_IPOD_2_1 @"iPod2,1"
#define DH_MACHINE_IPOD_3_1 @"iPod3,1"
#define DH_MACHINE_IPOD_4_1 @"iPod4,1"
#define DH_MACHINE_IPOD_5_1 @"iPod5,1"
#define DH_MACHINE_IPOD_7_1 @"iPod7,1"

#define DH_MACHINE_IPAD_1_1 @"iPad1,1"
#define DH_MACHINE_IPAD_2_1 @"iPad2,1"
#define DH_MACHINE_IPAD_2_2 @"iPad2,2"
#define DH_MACHINE_IPAD_2_3 @"iPad2,3"
#define DH_MACHINE_IPAD_2_4 @"iPad2,4"
#define DH_MACHINE_IPAD_2_5 @"iPad2,5"
#define DH_MACHINE_IPAD_2_6 @"iPad2,6"
#define DH_MACHINE_IPAD_2_7 @"iPad2,7"
#define DH_MACHINE_IPAD_3_1 @"iPad3,1"
#define DH_MACHINE_IPAD_3_2 @"iPad3,2"
#define DH_MACHINE_IPAD_3_3 @"iPad3,3"
#define DH_MACHINE_IPAD_3_4 @"iPad3,4"
#define DH_MACHINE_IPAD_3_5 @"iPad3,5"
#define DH_MACHINE_IPAD_3_6 @"iPad3,6"
#define DH_MACHINE_IPAD_4_1 @"iPad4,1"
#define DH_MACHINE_IPAD_4_2 @"iPad4,2"
#define DH_MACHINE_IPAD_4_3 @"iPad4,3"
#define DH_MACHINE_IPAD_4_4 @"iPad4,4"
#define DH_MACHINE_IPAD_4_5 @"iPad4,5"
#define DH_MACHINE_IPAD_4_6 @"iPad4,6"
#define DH_MACHINE_IPAD_4_7 @"iPad4,7"
#define DH_MACHINE_IPAD_4_8 @"iPad4,8"
#define DH_MACHINE_IPAD_4_9 @"iPad4,9"
#define DH_MACHINE_IPAD_5_1 @"iPad5,1"
#define DH_MACHINE_IPAD_5_2 @"iPad5,2"
#define DH_MACHINE_IPAD_5_3 @"iPad5,3"
#define DH_MACHINE_IPAD_5_4 @"iPad5,4"
#define DH_MACHINE_IPAD_6_3 @"iPad6,3"
#define DH_MACHINE_IPAD_6_4 @"iPad6,4"
#define DH_MACHINE_IPAD_6_7 @"iPad6,7"
#define DH_MACHINE_IPAD_6_8 @"iPad6,8"

#define DH_MACHINE_I386   @"i386"
#define DH_MACHINE_X86_64 @"x86_64"

@implementation DeviceTool

+ (DeviceHardwareSpecificPlatform)specificPlatform {
	NSString *platform = [self machine];
	if ([platform isEqualToString:DH_MACHINE_IPHONE_1_1])    return DeviceHardwareSpecificPlatform_iPhone_1G;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_1_2])    return DeviceHardwareSpecificPlatform_iPhone_3G;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_2_1])    return DeviceHardwareSpecificPlatform_iPhone_3GS;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_3_1])    return DeviceHardwareSpecificPlatform_iPhone_4;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_3_3])    return DeviceHardwareSpecificPlatform_iPhone_4_Verizon;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_4_1])    return DeviceHardwareSpecificPlatform_iPhone_4S;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_5_1])    return DeviceHardwareSpecificPlatform_iPhone_5_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_5_2])    return DeviceHardwareSpecificPlatform_iPhone_5_CDMA_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_5_3])    return DeviceHardwareSpecificPlatform_iPhone_5C_CDMA_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_5_4])    return DeviceHardwareSpecificPlatform_iPhone_5C_Global;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_6_1])    return DeviceHardwareSpecificPlatform_iPhone_5S_CDMA_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_6_2])    return DeviceHardwareSpecificPlatform_iPhone_5S_Global;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_7_1])    return DeviceHardwareSpecificPlatform_iPhone_6_Plus_CDMA_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_7_2])    return DeviceHardwareSpecificPlatform_iPhone_6_CDMA_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_8_1])    return DeviceHardwareSpecificPlatform_iPhone_6S_CDMA_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_8_2])    return DeviceHardwareSpecificPlatform_iPhone_6S_Plus_CDMA_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_8_4])    return DeviceHardwareSpecificPlatform_iPhone_SE_CDMA_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_9_1])    return DeviceHardwareSpecificPlatform_iPhone_7_CDMA;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_9_2])    return DeviceHardwareSpecificPlatform_iPhone_7_Plus_CDMA;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_9_3])    return DeviceHardwareSpecificPlatform_iPhone_7_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_9_4])    return DeviceHardwareSpecificPlatform_iPhone_7_Plus_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPOD_1_1])      return DeviceHardwareSpecificPlatform_iPod_Touch_1G;
	if ([platform isEqualToString:DH_MACHINE_IPOD_2_1])      return DeviceHardwareSpecificPlatform_iPod_Touch_2G;
	if ([platform isEqualToString:DH_MACHINE_IPOD_3_1])      return DeviceHardwareSpecificPlatform_iPod_Touch_3G;
	if ([platform isEqualToString:DH_MACHINE_IPOD_4_1])      return DeviceHardwareSpecificPlatform_iPod_Touch_4G;
	if ([platform isEqualToString:DH_MACHINE_IPOD_5_1])      return DeviceHardwareSpecificPlatform_iPod_Touch_5G;
	if ([platform isEqualToString:DH_MACHINE_IPOD_7_1])      return DeviceHardwareSpecificPlatform_iPod_Touch_6G;
	if ([platform isEqualToString:DH_MACHINE_IPAD_1_1])      return DeviceHardwareSpecificPlatform_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_1])      return DeviceHardwareSpecificPlatform_iPad_2_WiFi;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_2])      return DeviceHardwareSpecificPlatform_iPad_2_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_3])      return DeviceHardwareSpecificPlatform_iPad_2_CDMA;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_4])      return DeviceHardwareSpecificPlatform_iPad_2_WiFi;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_5])      return DeviceHardwareSpecificPlatform_iPad_Mini_WiFi;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_6])      return DeviceHardwareSpecificPlatform_iPad_Mini_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_7])      return DeviceHardwareSpecificPlatform_iPad_Mini_CDMA_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPAD_3_1])      return DeviceHardwareSpecificPlatform_iPad_3_WiFi;
	if ([platform isEqualToString:DH_MACHINE_IPAD_3_2])      return DeviceHardwareSpecificPlatform_iPad_3_CDMA;
	if ([platform isEqualToString:DH_MACHINE_IPAD_3_3])      return DeviceHardwareSpecificPlatform_iPad_3_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPAD_3_4])      return DeviceHardwareSpecificPlatform_iPad_4_WiFi;
	if ([platform isEqualToString:DH_MACHINE_IPAD_3_5])      return DeviceHardwareSpecificPlatform_iPad_4_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPAD_3_6])      return DeviceHardwareSpecificPlatform_iPad_4_CDMA_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_1])      return DeviceHardwareSpecificPlatform_iPad_Air_WiFi;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_2])      return DeviceHardwareSpecificPlatform_iPad_Air_CDMA_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_3])      return DeviceHardwareSpecificPlatform_iPad_Air_TD_LTE_China;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_4])      return DeviceHardwareSpecificPlatform_iPad_Mini_2_WiFi;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_5])      return DeviceHardwareSpecificPlatform_iPad_Mini_2_CDMA_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_6])      return DeviceHardwareSpecificPlatform_iPad_Mini_2_TD_LTE_China;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_7])      return DeviceHardwareSpecificPlatform_iPad_Mini_3_WiFi;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_8])      return DeviceHardwareSpecificPlatform_iPad_Mini_3_CDMA_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_9])      return DeviceHardwareSpecificPlatform_iPad_Mini_3_TD_LTE_China;
	if ([platform isEqualToString:DH_MACHINE_IPAD_5_1])      return DeviceHardwareSpecificPlatform_iPad_Mini_4_WiFi;
	if ([platform isEqualToString:DH_MACHINE_IPAD_5_2])      return DeviceHardwareSpecificPlatform_iPad_Mini_4_CDMA_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPAD_5_3])      return DeviceHardwareSpecificPlatform_iPad_Air_2_WiFi;
	if ([platform isEqualToString:DH_MACHINE_IPAD_5_4])      return DeviceHardwareSpecificPlatform_iPad_Air_2_CDMA_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPAD_6_3])      return DeviceHardwareSpecificPlatform_iPad_Pro_9_7_inch_WiFi;
	if ([platform isEqualToString:DH_MACHINE_IPAD_6_4])      return DeviceHardwareSpecificPlatform_iPad_Pro_9_7_inch_CDMA_GSM;
	if ([platform isEqualToString:DH_MACHINE_IPAD_6_7])      return DeviceHardwareSpecificPlatform_iPad_Pro_12_9_inch_WiFi;
	if ([platform isEqualToString:DH_MACHINE_IPAD_6_8])      return DeviceHardwareSpecificPlatform_iPad_Pro_12_9_inch_CDMA_GSM;
	if ([platform isEqualToString:DH_MACHINE_I386])          return DeviceHardwareSpecificPlatform_Simulator;
	if ([platform isEqualToString:DH_MACHINE_X86_64])        return DeviceHardwareSpecificPlatform_Simulator;
	return DeviceHardwareSpecificPlatform_Unknown;
}

+ (DeviceHardwareGeneralPlatform)generalPlatform {
	NSString *platform = [self machine];
	if ([platform isEqualToString:DH_MACHINE_IPHONE_1_1])    return DeviceHardwareGeneralPlatform_iPhone_1G;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_1_2])    return DeviceHardwareGeneralPlatform_iPhone_3G;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_2_1])    return DeviceHardwareGeneralPlatform_iPhone_3GS;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_3_1])    return DeviceHardwareGeneralPlatform_iPhone_4;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_3_3])    return DeviceHardwareGeneralPlatform_iPhone_4;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_4_1])    return DeviceHardwareGeneralPlatform_iPhone_4S;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_5_1])    return DeviceHardwareGeneralPlatform_iPhone_5;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_5_2])    return DeviceHardwareGeneralPlatform_iPhone_5;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_5_3])    return DeviceHardwareGeneralPlatform_iPhone_5C;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_5_4])    return DeviceHardwareGeneralPlatform_iPhone_5C;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_6_1])    return DeviceHardwareGeneralPlatform_iPhone_5S;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_6_2])    return DeviceHardwareGeneralPlatform_iPhone_5S;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_7_1])    return DeviceHardwareGeneralPlatform_iPhone_6_Plus;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_7_2])    return DeviceHardwareGeneralPlatform_iPhone_6;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_8_1])    return DeviceHardwareGeneralPlatform_iPhone_6S;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_8_2])    return DeviceHardwareGeneralPlatform_iPhone_6S_Plus;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_8_4])    return DeviceHardwareGeneralPlatform_iPhone_SE;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_9_1])    return DeviceHardwareGeneralPlatform_iPhone_7;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_9_2])    return DeviceHardwareGeneralPlatform_iPhone_7_Plus;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_9_3])    return DeviceHardwareGeneralPlatform_iPhone_7;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_9_4])    return DeviceHardwareGeneralPlatform_iPhone_7_Plus;
	if ([platform isEqualToString:DH_MACHINE_IPOD_1_1])      return DeviceHardwareGeneralPlatform_iPod_Touch_1G;
	if ([platform isEqualToString:DH_MACHINE_IPOD_2_1])      return DeviceHardwareGeneralPlatform_iPod_Touch_2G;
	if ([platform isEqualToString:DH_MACHINE_IPOD_3_1])      return DeviceHardwareGeneralPlatform_iPod_Touch_3G;
	if ([platform isEqualToString:DH_MACHINE_IPOD_4_1])      return DeviceHardwareGeneralPlatform_iPod_Touch_4G;
	if ([platform isEqualToString:DH_MACHINE_IPOD_5_1])      return DeviceHardwareGeneralPlatform_iPod_Touch_5G;
	if ([platform isEqualToString:DH_MACHINE_IPAD_1_1])      return DeviceHardwareGeneralPlatform_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_1])      return DeviceHardwareGeneralPlatform_iPad_2;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_2])      return DeviceHardwareGeneralPlatform_iPad_2;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_3])      return DeviceHardwareGeneralPlatform_iPad_2;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_4])      return DeviceHardwareGeneralPlatform_iPad_2;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_5])      return DeviceHardwareGeneralPlatform_iPad_Mini;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_6])      return DeviceHardwareGeneralPlatform_iPad_Mini;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_7])      return DeviceHardwareGeneralPlatform_iPad_Mini;
	if ([platform isEqualToString:DH_MACHINE_IPAD_3_1])      return DeviceHardwareGeneralPlatform_iPad_3;
	if ([platform isEqualToString:DH_MACHINE_IPAD_3_2])      return DeviceHardwareGeneralPlatform_iPad_3;
	if ([platform isEqualToString:DH_MACHINE_IPAD_3_3])      return DeviceHardwareGeneralPlatform_iPad_3;
	if ([platform isEqualToString:DH_MACHINE_IPAD_3_4])      return DeviceHardwareGeneralPlatform_iPad_4;
	if ([platform isEqualToString:DH_MACHINE_IPAD_3_5])      return DeviceHardwareGeneralPlatform_iPad_4;
	if ([platform isEqualToString:DH_MACHINE_IPAD_3_6])      return DeviceHardwareGeneralPlatform_iPad_4;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_1])      return DeviceHardwareGeneralPlatform_iPad_Air;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_2])      return DeviceHardwareGeneralPlatform_iPad_Air;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_3])      return DeviceHardwareGeneralPlatform_iPad_Air;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_4])      return DeviceHardwareGeneralPlatform_iPad_Mini_2;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_5])      return DeviceHardwareGeneralPlatform_iPad_Mini_2;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_6])      return DeviceHardwareGeneralPlatform_iPad_Mini_2;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_7])      return DeviceHardwareGeneralPlatform_iPad_Mini_3;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_8])      return DeviceHardwareGeneralPlatform_iPad_Mini_3;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_9])      return DeviceHardwareGeneralPlatform_iPad_Mini_3;
	if ([platform isEqualToString:DH_MACHINE_IPAD_5_1])      return DeviceHardwareGeneralPlatform_iPad_Mini_4;
	if ([platform isEqualToString:DH_MACHINE_IPAD_5_2])      return DeviceHardwareGeneralPlatform_iPad_Mini_4;
	if ([platform isEqualToString:DH_MACHINE_IPAD_5_3])      return DeviceHardwareGeneralPlatform_iPad_Air_2;
	if ([platform isEqualToString:DH_MACHINE_IPAD_5_4])      return DeviceHardwareGeneralPlatform_iPad_Air_2;
	if ([platform isEqualToString:DH_MACHINE_IPAD_6_3])      return DeviceHardwareGeneralPlatform_iPad_Pro_9_7_inch;
	if ([platform isEqualToString:DH_MACHINE_IPAD_6_4])      return DeviceHardwareGeneralPlatform_iPad_Pro_9_7_inch;
	if ([platform isEqualToString:DH_MACHINE_IPAD_6_7])      return DeviceHardwareGeneralPlatform_iPad_Pro_12_9_inch;
	if ([platform isEqualToString:DH_MACHINE_IPAD_6_8])      return DeviceHardwareGeneralPlatform_iPad_Pro_12_9_inch;
	if ([platform isEqualToString:DH_MACHINE_I386])          return DeviceHardwareGeneralPlatform_Simulator;
	if ([platform isEqualToString:DH_MACHINE_X86_64])        return DeviceHardwareGeneralPlatform_Simulator;
	return DeviceHardwareGeneralPlatform_Unknown;
}

+ (DeviceHardwarePlatformType)platformType {
	NSString *platform = [self machine];
	if ([platform isEqualToString:DH_MACHINE_IPHONE_1_1])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_1_2])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_2_1])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_3_1])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_3_3])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_4_1])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_5_1])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_5_2])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_5_3])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_5_4])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_6_1])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_6_2])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_7_1])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_7_2])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_8_1])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_8_2])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_8_4])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_9_1])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_9_2])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_9_3])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPHONE_9_4])    return DeviceHardwarePlatformType_iPhone;
	if ([platform isEqualToString:DH_MACHINE_IPOD_1_1])      return DeviceHardwarePlatformType_iPod_Touch;
	if ([platform isEqualToString:DH_MACHINE_IPOD_2_1])      return DeviceHardwarePlatformType_iPod_Touch;
	if ([platform isEqualToString:DH_MACHINE_IPOD_3_1])      return DeviceHardwarePlatformType_iPod_Touch;
	if ([platform isEqualToString:DH_MACHINE_IPOD_4_1])      return DeviceHardwarePlatformType_iPod_Touch;
	if ([platform isEqualToString:DH_MACHINE_IPOD_5_1])      return DeviceHardwarePlatformType_iPod_Touch;
	if ([platform isEqualToString:DH_MACHINE_IPOD_7_1])      return DeviceHardwarePlatformType_iPod_Touch;
	if ([platform isEqualToString:DH_MACHINE_IPAD_1_1])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_1])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_2])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_3])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_4])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_5])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_6])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_2_7])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_3_1])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_3_2])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_3_3])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_3_4])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_3_5])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_3_6])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_1])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_2])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_3])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_4])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_5])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_6])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_7])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_8])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_4_9])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_5_1])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_5_2])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_5_3])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_5_4])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_6_3])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_6_4])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_6_7])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_IPAD_6_8])      return DeviceHardwarePlatformType_iPad;
	if ([platform isEqualToString:DH_MACHINE_I386])          return DeviceHardwarePlatformType_Simulator;
	if ([platform isEqualToString:DH_MACHINE_X86_64])        return DeviceHardwarePlatformType_Simulator;
	return DeviceHardwarePlatformType_Unknown;
}

+ (NSString *)machine {
	size_t size;
	sysctlbyname("hw.machine", NULL, &size, NULL, 0);
	char *machine = malloc(size);
	sysctlbyname("hw.machine", machine, &size, NULL, 0);
	NSString *platform = [NSString stringWithUTF8String:machine];
	free(machine);
	return platform;
}


//手机型号
+ (NSString *)platformString {
    NSString *platform = [self machine];
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_1])   return @"国行(A1863)、日行(A1906)iPhone 8";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_4])   return @"美版(Global/A1905)iPhone 8";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_2])   return @"国行(A1864)、日行(A1898)iPhone 8 Plus";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_5])   return @"美版(Global/A1897)iPhone 8 Plus";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_3])   return @"国行(A1865)、日行(A1902)iPhone X";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_6])   return @"美版(Global/A1901)iPhone X";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_1_1])    return @"iPhone 1G";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_1_2])    return @"iPhone 3G";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_2_1])    return @"iPhone 3GS";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_3_1])    return @"iPhone 4";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_3_3])    return @"iPhone 4 (Verizon)";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_4_1])    return @"iPhone 4S";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_5_1])    return @"iPhone 5 (GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_5_2])    return @"iPhone 5 (CDMA+GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_5_3])    return @"iPhone 5C (CDMA+GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_5_4])    return @"iPhone 5C (Global)";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_6_1])    return @"iPhone 5S (CDMA+GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_6_2])    return @"iPhone 5S (Global)";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_7_1])    return @"iPhone 6 Plus (CDMA+GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_7_2])    return @"iPhone 6 (CDMA+GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_8_1])    return @"iPhone 6S (CDMA+GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_8_2])    return @"iPhone 6S Plus (CDMA+GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_8_4])    return @"iPhone SE (CDMA+GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_9_1])    return @"iPhone 7 (CDMA)";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_9_2])    return @"iPhone 7 Plus (CDMA)";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_9_3])    return @"iPhone 7 (GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_9_4])    return @"iPhone 7 Plus (GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPOD_1_1])      return @"iPod Touch 1G";
    if ([platform isEqualToString:DH_MACHINE_IPOD_2_1])      return @"iPod Touch 2G";
    if ([platform isEqualToString:DH_MACHINE_IPOD_3_1])      return @"iPod Touch 3G";
    if ([platform isEqualToString:DH_MACHINE_IPOD_4_1])      return @"iPod Touch 4G";
    if ([platform isEqualToString:DH_MACHINE_IPOD_5_1])      return @"iPod Touch 5G";
    if ([platform isEqualToString:DH_MACHINE_IPOD_7_1])      return @"iPod Touch 6G";
    if ([platform isEqualToString:DH_MACHINE_IPAD_1_1])      return @"iPad";
    if ([platform isEqualToString:DH_MACHINE_IPAD_2_1])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_2_2])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_2_3])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_2_4])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_2_5])      return @"iPad Mini (WiFi)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_2_6])      return @"iPad Mini (GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_2_7])      return @"iPad Mini (CDMA+GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_3_1])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_3_2])      return @"iPad 3 (CDMA)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_3_3])      return @"iPad 3 (GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_3_4])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_3_5])      return @"iPad 4 (GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_3_6])      return @"iPad 4 (CDMA+GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_4_1])      return @"iPad Air (WiFi)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_4_2])      return @"iPad Air (CDMA+GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_4_3])      return @"iPad Air (China)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_4_4])      return @"iPad Mini 2 (WiFi)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_4_5])      return @"iPad Mini 2 (CDMA+GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_4_6])      return @"iPad Mini 2 (China)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_4_7])      return @"iPad Mini 3 (WiFi)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_4_8])      return @"iPad Mini 3 (CDMA+GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_4_9])      return @"iPad Mini 3 (China)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_5_1])      return @"iPad Mini 4 (WiFi)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_5_2])      return @"iPad Mini 4 (CDMA+GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_5_3])      return @"iPad Air 2 (WiFi)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_5_4])      return @"iPad Air 2 (CDMA+GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_6_3])      return @"iPad Pro 9.7 inch (WiFi)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_6_4])      return @"iPad Pro 9.7 inch (CDMA+GSM)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_6_7])      return @"iPad Pro 12.9 inch (WiFi)";
    if ([platform isEqualToString:DH_MACHINE_IPAD_6_8])      return @"iPad Pro 12.9 inch (CDMA+GSM)";
    if ([platform isEqualToString:DH_MACHINE_I386])          return @"Simulator";
    if ([platform isEqualToString:DH_MACHINE_X86_64])        return @"Simulator";
    return platform;
}

//手机版本号
+(NSString *)getDeviceSystemVersion
{
    NSString * str = [[UIDevice currentDevice] systemVersion];
    return str;
}
//手机运营商
+(NSString *)getSimCompany
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    NSString *mobile;
    if (!carrier.mobileCountryCode) {
        mobile = @"";
    }else{
        mobile = [NSString stringWithFormat:@"%@%@",carrier.mobileCountryCode,carrier.mobileNetworkCode];
    }
    return mobile;
}
//网络状态
+ (NSString *)networkingStatesFromStatebar {

    NSString *stateString = @"WIFI";

    switch ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus) {
        case AFNetworkReachabilityStatusNotReachable:
            stateString = @"notReachable";
            break;
        case AFNetworkReachabilityStatusReachableViaWWAN:
            stateString =@"WWAN";
            break;
        case AFNetworkReachabilityStatusReachableViaWiFi:
            stateString = @"WIFI";
            break;
        case AFNetworkReachabilityStatusUnknown:
        default:
            stateString = @"Unknown";
            break;
    }
    return stateString;
}
//获取极光推送devicetoken
+ (NSString *)getDeviceToken
{
    NSString * deviceToken=@"";
    
    if ([kUserDef objectForKey:@"DEVICETOKEN"]) {
        deviceToken = [kUserDef objectForKey:@"DEVICETOKEN"];
    }
    return deviceToken;
}
//获取广告标识符
+ (NSString *)getIdfa
{
    NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    return adId;
}
//获取UUID
+ (NSString *)getUUIDString
{
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef strRef = CFUUIDCreateString(kCFAllocatorDefault, uuidRef);
    NSString *uuidString = [(__bridge NSString *)strRef stringByReplacingOccurrencesOfString:@"" withString:@""];
    CFRelease(strRef);
    CFRelease(uuidRef);
    return uuidString;
}
//获取verdonId
+ (NSString *)getVendorIdString
{
    NSString* identifierNumber = [[UIDevice currentDevice].identifierForVendor UUIDString];
    if (identifierNumber.length == 0) {
        identifierNumber = @"";
    }
    return identifierNumber;
}
//获取毫秒级时间戳
+ (NSString *)getMsecTime
{
    UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000;
    NSString * msecTime = [NSString stringWithFormat:@"%zd",recordTime];
    return msecTime;
}
//获取系统版本号
+(NSString *)getCurrentVersion
{
    return  [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"];
}
//获取类型
+(NSString *)getPhoneType
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = (char*)malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    return platform;
}
//获取build号
+ (NSString *)getBuildNum{
    return [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleVersion"];
}
//打电话
+(void)tel:(NSString *)phoneNum
{
    if (kAboveIOS10) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNum]]];
    }else{
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您要给老板打电话么？" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNum]]];
        }];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
           
        }];
        
        [alertController addAction:action];
        [alertController addAction:action1];
    }
}
@end
