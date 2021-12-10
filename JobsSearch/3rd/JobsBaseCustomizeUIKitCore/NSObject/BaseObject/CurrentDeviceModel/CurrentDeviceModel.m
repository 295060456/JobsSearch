//
//  CurrentDeviceModel.m
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#import "CurrentDeviceModel.h"

@implementation CurrentDeviceModel
// App发布的版本号
-(NSString *)appVersion{
    return [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleShortVersionString"];
}
// BUILD 版本号
-(NSString *)appBuildVersion{
    return [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleVersion"];
}
// App名字
-(NSString *)appDisplayName{
    return [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleExecutable"];
}
// 当前语言
-(NSString *)localLanguage{
    return [NSLocale.preferredLanguages objectAtIndex:0];
}
// 当前国家
-(NSString *)localCountry{
    return [NSLocale.currentLocale objectForKey:NSLocaleCountryCode];
}
// 设备名称
-(NSString *)deviceName{
    return UIDevice.currentDevice.name;
}
// 设备类型
-(NSString *)deviceModel{
    return UIDevice.currentDevice.model;
}
// 本地化模式
-(NSString *)deviceLocalizedModel{
    return UIDevice.currentDevice.localizedModel;
}
// 系统名字
-(NSString *)deviceSystemName{
    return UIDevice.currentDevice.systemName;
}
// 系统版本
-(NSString *)deviceSystemVersion{
    return UIDevice.currentDevice.systemVersion;
}

-(NSString *)deviceIdentity{
    return self.deviceID;
}

-(NSString *)uuid{
    return self.UUID;
}

-(NSString *)idfv{
    return self.IDFV;
}
// 设备朝向
-(UIDeviceOrientation )deviceOrientation{
    return UIDevice.currentDevice.orientation;
}
// 是否是Retina显示屏
-(BOOL)isRetina{
    return (UIScreen.mainScreen.scale >= 2.0);// 非Retain屏幕 1.0
}

-(BOOL)isPhone{
    if (AvailableSysVersion(13.0)) {
        return UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone;
    }else{
        SuppressWdeprecatedDeclarationsWarning(return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone));
    }
}

-(BOOL)isPad{
    if (AvailableSysVersion(13.0)) {
        return UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad;
    }else{
        SuppressWdeprecatedDeclarationsWarning(return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad));
    }
}

-(BOOL)isPod{
    return ([UIDevice.currentDevice.model rangeOfString:@"iPod"].length > 0);
}

@end
