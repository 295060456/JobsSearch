//
//  MacroDef_Func.h
//  UBallLive
//
//  Created by Jobs on 2020/10/9.
//

#ifndef MacroDef_Func_h
#define MacroDef_Func_h

#import "MacroDef_Sys.h"
#import "JobsSearchAppDelegate.h"
#import "JobsSearchSceneDelegate.h"

static inline UIWindow * getMainWindow(){
    UIWindow *window = nil;
    //以下方法有时候会拿不到window
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene* windowScene in UIApplication.sharedApplication.connectedScenes){
            if (windowScene.activationState == UISceneActivationStateForegroundActive){
                window = windowScene.windows.firstObject;
                return window;
            }
        }
    }
    
    if (JobsSearchAppDelegate.sharedInstance.window) {
        window = JobsSearchAppDelegate.sharedInstance.window;
        return window;
    }
    
    if (UIApplication.sharedApplication.delegate.window) {
        window = UIApplication.sharedApplication.delegate.window;
        return window;
    }
    
    SuppressWdeprecatedDeclarationsWarning(
        if (UIApplication.sharedApplication.keyWindow) {
        window = UIApplication.sharedApplication.keyWindow;
        return window;
    });
    
    return window;
}
/**
 是否是iPhone刘海屏系列：   X系列（X/XS/XR/XS Max)、11系列（11、pro、pro max）
 @return YES 是该系列 NO 不是该系列
 */
static inline BOOL isiPhoneX_series() {
    BOOL iPhoneXSeries = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return iPhoneXSeries;
    }

    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = getMainWindow();
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            iPhoneXSeries = YES;
        }
    }return iPhoneXSeries;
}

static inline id getSceneDelegate(){
    id sceneDelegate = nil;
    if (@available(iOS 13.0, *)) {
        sceneDelegate = UIApplication.sharedApplication.connectedScenes.allObjects.firstObject.delegate;
    }return sceneDelegate;
}
#pragma mark ======================================== 国际化 ================================================
#define Internationalization(text)  [NSObject localStringWithKey:text]

#pragma mark ======================================== 字体 ================================================
#define kFontSize(x) [UIFont systemFontOfSize:x weight:UIFontWeightRegular]

#pragma mark ======================================== 沙盒路径 =============================================
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#pragma mark ======================================== 默认值 ========================================
#define DefaultValue 0
#define DefaultObj Nil
#define DefaultSize CGSizeZero

//判断是否登录,没有登录进行跳转
#define kGuardLogin if ([IsLogin isLogin]) { \
UIViewController *rootViewController = kKeyWindow.rootViewController; \
TopicLoginViewController *vc = [[TopicLoginViewController alloc] init]; \
UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc]; \
[rootViewController presentViewController:nav animated:YES completion:nil]; \
return; \
} \

#pragma mark ======================================== 本地化字符串 ========================================
/** NSLocalizedString宏做的其实就是在当前bundle中查找资源文件名“Localizable.strings”(参数:键＋注释) */
#define LocalString(x, ...)     NSLocalizedString(x, nil)
#define StringFormat(format,...) [NSString stringWithFormat:format, ##__VA_ARGS__]
#pragma mark ======================================== 强弱引用 ==============================================

/**
 
 Uses
 
     UIView *view;
     UIButton *btn;
     
     @jobs_weakify(view)
     weak_view.size;
     @jobs_weakify(btn)
     weak_btn.frame
 
 */

#ifndef jobs_weakify
#if DEBUG
#if __has_feature(objc_arc)
#define jobs_weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define jobs_weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define jobs_weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define jobs_weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef jobs_strongify
#if DEBUG
#if __has_feature(objc_arc)
#define jobs_strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define jobs_strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define jobs_strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define jobs_strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#pragma mark ======================================== 其他 =================================================
#define ReuseIdentifier NSStringFromClass ([self class])
#define CurrentThread [NSThread currentThread]
#define PrintRetainCount(obj) printf("Retain Count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(obj)));//打印引用计数器
//- (void)add:(NSString *)txt{}
#define addText(fmt, ...) [self add:[NSString stringWithFormat:fmt, ##__VA_ARGS__]]//多参数

#pragma mark ======================================== 队列相关 ==============================================
///异步获取某个队列
#define GET_QUEUE_ASYNC(queue, block)\
if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(queue)) == 0) {\
block();\
} else {\
dispatch_async(queue, block);\
}
///获取主队列
#define GET_MAIN_QUEUE_ASYNC(block) GET_QUEUE_ASYNC(dispatch_get_main_queue(), block)
///执行只需运行一次的线程安全代码
#define dispatch_once_t_Func(Selector)\
static dispatch_once_t dispatchOnce;\
dispatch_once(&dispatchOnce, ^{\
    Selector\
});\
///主线程上延迟执行某个事件
#define DispathdDelaySth(Second,Sth)\
dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(Second * NSEC_PER_SEC));\
dispatch_after(delayTime, dispatch_get_main_queue(), ^{\
    Sth;\
});\

#pragma mark ======================================== 时间相关 ========================================
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

#pragma mark ======================================== 系统通知 ========================================

#define NotificationAdd(anObserver, aSEL, noteName, anObj)    [[NSNotificationCenter defaultCenter] \
                                                                addObserver:(anObserver) \
                                                                selector:(aSEL) \
                                                                name:(noteName) \
                                                                object:(anObj)]

#define NotificationRemove(anObserver, notifName, anObj)      [[NSNotificationCenter defaultCenter] \
                                                                removeObserver:(anObserver) \
                                                                name:(notifName) object:(anObj)]

#define NotificationRemoveObserver(anObserver)                [[NSNotificationCenter defaultCenter] \
                                                                removeObserver:(anObserver)]

#define NotificationPost(notifName, anObj, anUserInfo)        [[NSNotificationCenter defaultCenter] \
                                                                postNotificationName:(notifName) \
                                                                object:(anObj) \
                                                                userInfo:(anUserInfo)]

#define NotificationPostOnMainThread(notifName, anObj, anUserInfo) dispatch_async(dispatch_get_main_queue(), ^(void){\
                                                                [[NSNotificationCenter defaultCenter] \
                                                                postNotificationName:(notifName) \
                                                                object:(anObj) \
                                                                userInfo:(anUserInfo)];\
                                                                });\

#endif /* MacroDef_Func_h */

