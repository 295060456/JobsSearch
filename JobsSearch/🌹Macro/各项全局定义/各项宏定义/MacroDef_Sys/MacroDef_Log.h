//
//  MacroDef_Log.h
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#ifndef MacroDef_Log_h
#define MacroDef_Log_h

#pragma mark —— 控制台Log打印格式重写
#ifndef NSLog
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#endif

#ifndef DLog
#define DLog( s, ... ) NSLog( @"< %@:(%d) > %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#endif
#pragma mark —— LOG等级
/// LOG等级
#define ITTLOGLEVEL_INFO        10
#define ITTLOGLEVEL_WARNING     3
#define ITTLOGLEVEL_ERROR       1
/// LOG最高等级
#ifndef ITTMAXLOGLEVEL
#ifdef DEBUG
#define ITTMAXLOGLEVEL ITTLOGLEVEL_INFO
#else
#define ITTMAXLOGLEVEL ITTLOGLEVEL_ERROR
#endif
#endif
#pragma mark —— 条件LOG
#define ITTDEBUG //DEBUG模式
#ifdef ITTDEBUG
#define ITTDCONDITIONLOG(condition, xx, ...)\
\
{\
if ((condition))\
{\
ITTDPRINT(xx, ##__VA_ARGS__);\
}\
}
#else
#define ITTDCONDITIONLOG(condition, xx, ...)\
\
((void)0)
#endif

#endif /* MacroDef_Log_h */
