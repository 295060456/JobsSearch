//
//  JobsBitsMonitorSuspendLab.h
//  JobsBitsMonitor
//
//  Created by Jobs on 2020/12/13.
//

#import "JobsSuspendLab.h"

#if __has_include(<ZWPullMenuView/ZWPullMenuView.h>)
#import <ZWPullMenuView/ZWPullMenuView.h>
#else
#import "ZWPullMenuView.h"
#endif

#import "JobsBitsMonitorCore.h"
#import "NSObject+WHToast.h"//提示

NS_ASSUME_NONNULL_BEGIN

@interface JobsBitsMonitorSuspendLab : JobsSuspendLab

@end

NS_ASSUME_NONNULL_END
