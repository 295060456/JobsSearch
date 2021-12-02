//
//  NSObject+WHToast.h
//  Casino
//
//  Created by Jobs on 2021/12/2.
//

#import <Foundation/Foundation.h>

#if __has_include(<WHToast/WHToast.h>)
#import <WHToast/WHToast.h>
#else
#import "WHToast.h"
#endif

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (WHToast)
/** 仅文字，展示在屏幕中间 */
+(void)toastMsg:(NSString *)msg;
/** 失败图标和文字，展示在屏幕中间 */
+(void)toastErrMsg:(NSString *)errMsg;
/** 成功图标和文字，展示在屏幕中间 */
+(void)toastSuccessMsg:(NSString *)successMsg;
/** 延时操作 */
+(void)toastLoadingMsg:(NSString *)errMsg;
/** 手动关闭WHToast，在主线程*/
+(void)toastHide;
/** 当前进度 */
+(void)loadSchedule:(CGFloat)Schedule;

@end

NS_ASSUME_NONNULL_END
