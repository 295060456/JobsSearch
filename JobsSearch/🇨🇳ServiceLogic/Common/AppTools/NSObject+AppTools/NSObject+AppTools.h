//
//  NSObject+AppTools.h
//  DouYin
//
//  Created by Jobs on 2021/4/6.
//

#import <Foundation/Foundation.h>

#import "DDNetworkingAPI.h"
#import "DDNetworkingAPI+WMController.h" // WM游戏厅
#import "DDNetworkingAPI+InteceptorController.h" // inteceptor-controller
#import "DDNetworkingAPI+ProxyCentreController.h" // 代理中心
#import "DDNetworkingAPI+NoticeController.h" // 公告中心
#import "DDNetworkingAPI+CustomerController.h" // 客服中心
#import "DDNetworkingAPI+DownloadStationController.h" // 应用版本控制
#import "DDNetworkingAPI+WashCodeController.h" // 洗码
#import "DDNetworkingAPI+UserController.h" // 用户中心
#import "DDNetworkingAPI+AuthController.h" // 认证中心
#import "DDNetworkingAPI+RechargeTurnoverController.h" // 资金中心
#import "DDNetworkingAPI+PictureController.h" // 轮播图
#import "DDNetworkingAPI+ChargeController.h" // 银行卡线下充值

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (AppTools)

#pragma mark —— 登录模块
/// YES  已经登录 ｜  NO   没有登录
+(BOOL)isLogin;
/// 强制登录
+(void)forcedLogin;
/// 跳转官方交流群
+(void)openGoToPotatol;

+(UIImage *)defaultHeaderImage;

+(BOOL)isFristpostChannle;

+(void)completeFristpostChannle;


@end

NS_ASSUME_NONNULL_END
