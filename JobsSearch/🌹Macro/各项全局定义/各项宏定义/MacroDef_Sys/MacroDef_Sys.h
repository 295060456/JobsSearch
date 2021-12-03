//
//  MacroDef_Sys.h
//  UBallLive
//
//  Created by Jobs on 2020/10/9.
//

#ifndef MacroDef_Sys_h
#define MacroDef_Sys_h

#define HDAppVersion [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleShortVersionString"]//标识应用程序的发布版本号
#define HDAppBuildVersion [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleVersion"]// App BUILD 版本号
#define HDAppDisplayName [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleExecutable"]// App名字
#define HDLocalLanguage [NSLocale.currentLocale objectForKey:NSLocaleLanguageCode]// 当前语言
#define CURRENTLANGUAGE [NSLocale.preferredLanguages objectAtIndex:0]// 当前语言
#define HDLocalCountry [NSLocale.currentLocale objectForKey:NSLocaleCountryCode]// 当前国家
#define HDDevice UIDevice.currentDevice
#define HDDeviceName UIDevice.currentDevice.name// 设备名称
#define HDDeviceModel UIDevice.currentDevice.model// 设备类型
#define HDDeviceLocalizedModel UIDevice.currentDevice.localizedModel// 本地化模式
#define HDDeviceSystemName UIDevice.currentDevice.systemName// 系统名字
#define HDDeviceSystemVersion UIDevice.currentDevice.systemVersion// 系统版本
#define HDDeviceOrientation UIDevice.currentDevice.orientation// 设备朝向

#define HDiPhone ([UIDevice.currentDevice.model rangeOfString:@"iPhone"].length > 0)
#define HDiPod ([UIDevice.currentDevice.model rangeOfString:@"iPod"].length > 0)
#define HDisPad (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)// 是否iPad
#define HDisiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)// 是否iPhone
#define HDisRetina ([[UIScreen mainScreen] scale] >= 2.0)// 非Retain屏幕 1.0

#endif /* MacroDef_Sys_h */
