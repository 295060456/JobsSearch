//
//  NSObject+UserInfo.h
//  Casino
//
//  Created by Jobs on 2021/12/1.
//

#import <Foundation/Foundation.h>
#import "NSUserDefaults+Manager.h"
#import "DDUserModel.h"

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

FOUNDATION_EXTERN NSString * _Nonnull const 用户信息;

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (UserInfo)

/// 鉴别是否登录的标准：userIdKey值对应的token是否为空
-(BOOL)isLogin;
/// 登出清空用户数据
-(void)logOut;
/// 保存用户数据（用 NSUserDefaults ）
-(void)saveUserInfo:(DDUserModel *)userModel;
/// 读取用户信息
-(DDUserModel *)readUserInfo;

@end

NS_ASSUME_NONNULL_END
/**
 
 #pragma mark —— 存取用户信息Demo
 -(void)saveAndReadUserInfoDemo{
     DDUserModel *userModel = DDUserModel.new;
     userModel.token = @"12345";
     userModel.uid = @"54321";
     
     [self saveUserInfo:userModel];
     NSLog(@"");
     DDUserModel *f = [self readUserInfo];
     NSLog(@"");
 }
 
 */
