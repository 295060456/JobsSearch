//
//  NSObject+AppTools.m
//  DouYin
//
//  Created by Jobs on 2021/4/6.
//

#import "NSObject+AppTools.h"

@implementation NSObject (AppTools)

#pragma mark —— 登录模块
/// 是否已经登录？YES  已经登录 ｜  NO   没有登录
+(BOOL)isLogin{
    return NO;
//    return ![NSString isNullString:DDUserInfo.sharedInstance.uid];
}

+(void)toLogin{
    
}
/// 强制登录
+(void)forcedLogin{
    if (![NSObject isLogin]) {
        [NSObject toLogin];
        return;
    }
}
/// 跳转官方交流群
+(void)openGoToPotatol{
    [NSObject openURL:@"https://t.me/doudong"];
}

+(UIImage *)defaultHeaderImage{
    if ([NSObject isLogin]) {
        return KIMG(@"default_avatar_white");
    }else{
        return KIMG(@"未登录默认头像（灰）");
    }
}

+(BOOL)isFristpostChannle{
    NSString *frist = [[NSUserDefaults standardUserDefaults] valueForKey:@"fristpostChannle"];
    if([NSString isNullString:frist]) {
        return YES;
    }return NO;
}

+(void)completeFristpostChannle {
    [[NSUserDefaults standardUserDefaults] setValue:@"fristpostChannle"
                                             forKey:@"fristpostChannle"];
}


@end

