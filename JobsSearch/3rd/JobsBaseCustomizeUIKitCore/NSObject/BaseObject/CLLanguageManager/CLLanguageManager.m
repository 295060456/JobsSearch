//
//  CLLanguageManager.m
//  CLDemo
//
//  Created by AUG on 2018/11/7.
//  Copyright © 2018年 JmoVxia. All rights reserved.
//

#import "CLLanguageManager.h"

static NSString *CLUserLanguageKey = @"CLUserLanguageKey";

@implementation CLLanguageManager

+(void)setUserLanguage:(nullable NSString *)userLanguage{
    //跟随手机系统
    if ([NSString isNullString:userLanguage]) {
        [self resetSystemLanguage];
        return;
    }
    //用户自定义
    [NSUserDefaults.standardUserDefaults setValue:userLanguage forKey:CLUserLanguageKey];
    [NSUserDefaults.standardUserDefaults synchronize];
}

+(nullable NSString *)userLanguage{
    return [NSUserDefaults.standardUserDefaults valueForKey:CLUserLanguageKey];
}
/**
 重置系统语言
 */
+(void)resetSystemLanguage{
    [NSUserDefaults.standardUserDefaults removeObjectForKey:CLUserLanguageKey];
    [NSUserDefaults.standardUserDefaults synchronize];
}

@end
