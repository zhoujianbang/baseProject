//
//  functionMacro.h
//  MeicaiCrm
//
//  Created by meicai on 2018/3/5.
//  Copyright © 2018年 meicai. All rights reserved.
//

//方法常量
#ifndef functionMacro_h
#define functionMacro_h

#define kUserDef [NSUserDefaults standardUserDefaults]
#define kNotification [NSNotificationCenter defaultCenter]

#define kNoContent(__ref) (((__ref) == nil) || ([(__ref) isEqual:[NSNull null]]) || (0 == __ref.length))


#ifdef DEBUG
#define Log(FORMAT, ...) fprintf(stderr,"[%s:%d行] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define Log(...)
#endif

#endif /* functionMacro_h */
