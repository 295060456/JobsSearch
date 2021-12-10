//
//  AppToolsProtocol.h
//  Casino
//
//  Created by Jobs on 2021/12/7.
//

#import <Foundation/Foundation.h>
#import "BaseProtocol.h"

NS_ASSUME_NONNULL_BEGIN

/// App工具协议
@protocol AppToolsProtocol <BaseProtocol>

@optional
#pragma mark —— 登录模块
/// YES  已经登录 ｜  NO   没有登录
+(BOOL)isLogin;

+(void)toLogin;
/// 强制登录
+(void)forcedLogin;
/// 跳转官方交流群
+(void)openGoToPotatol;

+(UIImage *)defaultHeaderImage;

+(BOOL)isFristpostChannle;

+(void)completeFristpostChannle;

@end

NS_ASSUME_NONNULL_END
