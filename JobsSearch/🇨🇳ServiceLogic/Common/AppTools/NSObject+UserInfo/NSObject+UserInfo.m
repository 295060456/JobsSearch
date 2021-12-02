//
//  NSObject+UserInfo.m
//  Casino
//
//  Created by Jobs on 2021/12/1.
//

#import "NSObject+UserInfo.h"

NSString *const 用户信息 = @"用户信息";

@implementation NSObject (UserInfo)

/// 鉴别是否登录的标准：userIdKey值对应的token是否为空
-(BOOL)isLogin{
    UserDefaultModel *obj = [NSUserDefaults readWithKey:用户信息];
    if (obj) {
        DDUserModel *userModel = [DDUserModel mj_objectWithKeyValues:obj];
        return [NSString isNullString:userModel.token];
    }return NO;
}
/// 登出清空用户数据
-(void)logOut{
    [NSUserDefaults deleteWithKey:用户信息];
}
/// 保存用户数据（用 NSUserDefaults ）
-(void)saveUserInfo:(DDUserModel *)userModel{
    UserDefaultModel *userDefaultModel = UserDefaultModel.new;
    userDefaultModel.obj = userModel;
    userDefaultModel.key = 用户信息;
    [NSUserDefaults updateWithModel:userDefaultModel];
}
/// 读取用户信息
-(DDUserModel *)readUserInfo{
    return [DDUserModel mj_objectWithKeyValues:[NSUserDefaults readWithKey:用户信息]];
}

@end
