//
//  MacroDef_Sys.h
//  UBallLive
//
//  Created by Jobs on 2020/10/9.
//

#ifndef MacroDef_Sys_h
#define MacroDef_Sys_h
// http://ww1.fuckingclangwarnings.com/
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
//#pragma clang diagnostic ignored "-Wundeclared-selector"
//#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
//#pragma clang diagnostic ignored "-Wincomplete-implementation"
//#pragma clang diagnostic ignored "-Wdeprecated-implementations"
//#pragma clang diagnostic ignored "-Wdeprecated-declarations"
//#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
//#pragma clang diagnostic pop
//警告处理⚠️
#define SuppressWobjcProtocolMethodImplementationWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wobjc-protocol-method-implementation\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
} while (0)

#define SuppressDesignatedInitializersWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wobjc-designated-initializers\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
} while (0)

#define SuppressWundeclaredSelectorWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wundeclared-selector\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
} while (0)

#define SuppressWincompatiblePointerTypesWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wincompatible-pointer-types\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
} while (0)

#define SuppressWincompatiblePointerTypesWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wincompatible-pointer-types\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
} while (0)

#define SuppressWincompleteImplementationWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wincomplete-implementation\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
} while (0)

#define SuppressWdeprecatedImplementationsWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wdeprecated-implementations\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
} while (0)
//
#define SuppressWdeprecatedDeclarationsWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
} while (0)

#define SuppressWarcPerformSelectorLeaksWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
} while (0)

#pragma mark ======================================== Sys.========================================
#define HDAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]//标识应用程序的发布版本号
#define HDAppBuildVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]//APP BUILD 版本号
#define HDAppDisplayName [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleExecutable"]// APP名字
#define HDLocalLanguage [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode]//当前语言
#define HDLocalCountry [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode]//当前国家
#define HDDevice [UIDevice currentDevice]
#define HDDeviceName HDDevice.name                           // 设备名称
#define HDDeviceModel HDDevice.model                         // 设备类型
#define HDDeviceLocalizedModel HDDevice.localizedModel       // 本地化模式
#define HDDeviceSystemName HDDevice.systemName               // 系统名字
#define HDDeviceSystemVersion HDDevice.systemVersion         // 系统版本
#define HDDeviceOrientation HDDevice.orientation             // 设备朝向
#define CURRENTLANGUAGE ([[NSLocale preferredLanguages] objectAtIndex:0])// 当前语言
#define UDID HDDevice.identifierForVendor.UUIDString // UUID // 使用苹果不让上传App Store!!!
#define HDiPhone ([HDDeviceModel rangeOfString:@"iPhone"].length > 0)
#define HDiPod ([HDDeviceModel rangeOfString:@"iPod"].length > 0)
#define isPad (HDDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)// 是否iPad
#define isiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)//是否iPhone
#define isRetina ([[UIScreen mainScreen] scale] >= 2.0)// 非Retain屏幕 1.0

#endif /* MacroDef_Sys_h */
