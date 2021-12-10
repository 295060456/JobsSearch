//
//  NSObject+Notification.m
//  Casino
//
//  Created by Jobs on 2021/12/7.
//

#import "NSObject+Notification.h"

@implementation NSObject (Notification)
///【监听所有通知】
-(void)monitorNotification:(nonnull NSString *)notificationName
              withSelector:(nonnull SEL)selector{
    if ([NSString isNullString:notificationName]) {
        return;
    }
    NotificationAdd(self,
                    @selector(selector),
                    notificationName,
                    nil);
}
///【监听通知】设置App语言环境
-(void)monitorAppLanguage{
    [NSObject monitorNotification:LanguageSwitchNotification withSelector:@selector(languageSwitchNotification:)];
}
///【发通知】设置App语言环境
-(void)setAppLanguageAtIndexPath:(nonnull NSIndexPath *)indexPath
              byNotificationName:(nullable NSString *)NotificationName{
    switch (indexPath.row) {
        case 0:{
            [CLLanguageManager setUserLanguage:@"en"];
        }break;
        case 1:{
            [CLLanguageManager setUserLanguage:@"zh-Hans"];
        }break;
        case 2:{
            [CLLanguageManager setUserLanguage:@"en"];
        }break;
            
        default:
            break;
    }
    /// 发通知，通知需要更改的地方进行修改
    NotificationPostOnMainThread(LanguageSwitchNotification,
                                 CLLanguageManager.userLanguage,
                                 nil);
}
/// 接收通知并相应的方法 【在分类或者基类中实现会屏蔽具体子类的相关实现】
//-(void)languageSwitchNotification:(nonnull NSNotification *)notification{
//    NSLog(@"通知传递过来的 = %@",notification.object);
//}

@end
