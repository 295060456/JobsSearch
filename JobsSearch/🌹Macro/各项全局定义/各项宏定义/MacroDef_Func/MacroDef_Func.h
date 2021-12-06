//
//  MacroDef_Func.h
//  UBallLive
//
//  Created by Jobs on 2020/10/9.
//

#ifndef MacroDef_Func_h
#define MacroDef_Func_h

#import <UIKit/UIKit.h>
#import "MacroDef_SysWarning.h"
#import "MacroDef_Print.h"
#import "MacroDef_Notification.h"
#import "MacroDef_QUEUE.h"
#import "MacroDef_String.h"
#import "MacroDef_UserDefault.h"
#import "MacroDef_Strong@Weak.h"
#import "MacroDef_Time.h"
#import "MacroDef_Singleton.h"

static inline UIWindow *getMainWindow(){
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
/**
    1、该方法只能获取系统默认的AppDelegate；
    2、如果要获取自定义的appDelegate，则需要：
 
     AppDelegate *appDelegate;//在类定义域和实现域之外暴露
     
     -(instancetype)init{
         if (self = [super init]) {
             appDelegate = self;
         }return self;
     }
     
     获取方式：extern AppDelegate *appDelegate;
 */
static inline id getSysAppDelegate(){
    return UIApplication.sharedApplication.delegate;
}
/**
    1、该方法只能获取系统默认的SceneDelegate；
    2、如果要获取自定义的sceneDelegate，则需要：
 
     SceneDelegate *sceneDelegate;//在类定义域和实现域之外暴露
         
     -(instancetype)init{
         if (self = [super init]) {
             sceneDelegate = self;
         }return self;
     }
     
     获取方式：extern SceneDelegate *sceneDelegate;
 */
static inline id getSysSceneDelegate(){
    id sceneDelegate = nil;
    if (@available(iOS 13.0, *)) {
        sceneDelegate = UIApplication.sharedApplication.connectedScenes.allObjects.firstObject.delegate;
    }return sceneDelegate;
}
/// 定义一些默认值
#ifndef DefaultValue
#define DefaultValue 0
#endif

#ifndef DefaultObj
#define DefaultObj Nil
#endif

#ifndef DefaultSize
#define DefaultSize CGSizeZero
#endif
/// 其他
#ifndef ReuseIdentifier
#define ReuseIdentifier NSStringFromClass ([self class])
#endif

#ifndef AvailableSysVersion
#define AvailableSysVersion(version) @available(iOS version, *)
#endif

#endif /* MacroDef_Func_h */
