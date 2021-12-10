//
//  CurrentDeviceModel.h
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#import <Foundation/Foundation.h>
#import "MacroDef_SysWarning.h"
#import "NSObject+ID.h"/// iOS设备唯一标识符

NS_ASSUME_NONNULL_BEGIN

@interface CurrentDeviceModel : NSObject

@property(nonatomic,strong)NSString *appVersion;// App发布的版本号
@property(nonatomic,strong)NSString *appBuildVersion;// BUILD 版本号
@property(nonatomic,strong)NSString *appDisplayName;// App名字
@property(nonatomic,strong)NSString *localLanguage;// 当前语言
@property(nonatomic,strong)NSString *localCountry;// 当前国家
@property(nonatomic,strong)NSString *deviceName;// 设备名称
@property(nonatomic,strong)NSString *deviceModel;// 设备类型
@property(nonatomic,strong)NSString *deviceLocalizedModel;// 本地化模式
@property(nonatomic,strong)NSString *deviceSystemName;// 系统名字
@property(nonatomic,strong)NSString *deviceSystemVersion;// 系统版本
@property(nonatomic,strong)NSString *deviceIdentity;
@property(nonatomic,strong)NSString *uuid;
@property(nonatomic,strong)NSString *idfv;
@property(nonatomic,assign)UIDeviceOrientation deviceOrientation;// 设备朝向
@property(nonatomic,assign)BOOL isRetina;// 是否是Retina显示屏
@property(nonatomic,assign)BOOL isPhone;
@property(nonatomic,assign)BOOL isPad;
@property(nonatomic,assign)BOOL isPod;

@end

NS_ASSUME_NONNULL_END
