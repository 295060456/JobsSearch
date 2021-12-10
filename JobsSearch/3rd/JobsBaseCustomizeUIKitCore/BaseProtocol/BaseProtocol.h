//
//  BaseProtocol.h
//  Casino
//
//  Created by Jobs on 2021/12/7.
//

#import <Foundation/Foundation.h>
#import "UIViewModel.h"

NS_ASSUME_NONNULL_BEGIN
/// 所有协议的基类
@protocol BaseProtocol <NSObject>

@optional

@property(nonatomic,strong)UIViewModel *viewModel;

-(void)languageSwitchNotificationWithSelector:(SEL)aSelector;//在View上,target = self（view）,省略
/// 更改UITabBarItem的标题
+(void)changeTabBarItemTitle:(NSIndexPath *)indexPath;//NSObject (AppTools)
#pragma mark —— iOS 通知
///【监听所有通知】
-(void)monitorNotification:(nonnull NSString *)notificationName
              withSelector:(nonnull SEL)selector;
///【通知监听】国际化语言修改UI
/// @param target 需要铆定监听通知的对象
/// @param aSelector 相关逻辑
+(void)target:(id)target languageSwitchNotificationWithSelector:(SEL)aSelector;//NSObject (AppTools)
///【监听通知】设置App语言环境
-(void)monitorAppLanguage;//NSObject (Notification)
///【发通知】设置App语言环境
-(void)setAppLanguageAtIndexPath:(nonnull NSIndexPath *)indexPath
              byNotificationName:(nullable NSString *)NotificationName;
/// 接收通知并相应的方法【在分类或者基类中实现会屏蔽具体子类的相关实现】
-(void)languageSwitchNotification:(nonnull NSNotification *)notification;//在具体子类进行实现

@end

NS_ASSUME_NONNULL_END
