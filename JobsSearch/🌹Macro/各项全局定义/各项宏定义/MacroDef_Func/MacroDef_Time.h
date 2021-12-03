//
//  MacroDef_Time.h
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#ifndef MacroDef_Time_h
#define MacroDef_Time_h

/// 时间相关
/** 时间间隔 */
#define kHUDDuration            (1.f)
/** 一天的秒数 */
#define SecondsOfDay            (24.f * 60.f * 60.f)
/** 秒数 */
#define Seconds(Days)           (24.f * 60.f * 60.f * (Days))
/** 一天的毫秒数 */
#define MillisecondsOfDay       (24.f * 60.f * 60.f * 1000.f)
/** 毫秒数 */
#define Milliseconds(Days)      (24.f * 60.f * 60.f * 1000.f * (Days))

#endif /* MacroDef_Time_h */
