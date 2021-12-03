//
//  MacroDef_Log.h
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#ifndef MacroDef_Log_h
#define MacroDef_Log_h

///LOG等级
#define ITTLOGLEVEL_INFO        10
#define ITTLOGLEVEL_WARNING     3
#define ITTLOGLEVEL_ERROR       1
///LOG最高等级
#ifndef ITTMAXLOGLEVEL
#ifdef DEBUG
#define ITTMAXLOGLEVEL ITTLOGLEVEL_INFO
#else
#define ITTMAXLOGLEVEL ITTLOGLEVEL_ERROR
#endif
#endif
///DEBUG模式
#define ITTDEBUG
/** 条件LOG **/
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
