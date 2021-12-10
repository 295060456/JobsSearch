//
//  MacroDef_Notification.h
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#ifndef MacroDef_Notification_h
#define MacroDef_Notification_h

/**
    在多线程应用中，Notification在哪个线程中post，就在哪个线程中被转发，而不一定是在注册观察者的那个线程中
    也就是说Notification的发送与接收处理都是在同一个线程中
    【特别注意】
    1、对于全局性的通知，不建议在BaseView中监听，而是建议在具体的VC里面，哪怕是BaseVC里面去监听他。因为在BaseView上会崩溃
    2、如果在分类或者父类去实现监听方法，具体的子类就收不到消息
 */

#pragma mark —— 系统通知宏定义
/// 发送通知
// 一般的发送通知
#define NotificationPost(notifName, anObj, anUserInfo)              [NSNotificationCenter.defaultCenter \
                                                                    postNotificationName:(notifName) \
                                                                    object:(anObj) \
                                                                    userInfo:(anUserInfo)]
// 在主线程上发送通知【建议】
#define NotificationPostOnMainThread(notifName, anObj, anUserInfo)  dispatch_async(dispatch_get_main_queue(), ^(void){\
                                                                    [NSNotificationCenter.defaultCenter \
                                                                    postNotificationName:(notifName) \
                                                                    object:(anObj) \
                                                                    userInfo:(anUserInfo)];\
                                                                    });\
/// 监听通知
#define NotificationAdd(anObserver, aSEL, noteName, anObj)          [NSNotificationCenter.defaultCenter \
                                                                    addObserver:(anObserver) \
                                                                    selector:(aSEL) \
                                                                    name:(noteName) \
                                                                    object:(anObj)]\
/// 移除通知
#define NotificationRemove(anObserver, notifName, anObj)            [NSNotificationCenter.defaultCenter \
                                                                    removeObserver:(anObserver) \
                                                                    name:(notifName)\
                                                                    object:(anObj)]\

#define NotificationRemoveObserver(anObserver)                      [NSNotificationCenter.defaultCenter \
                                                                    removeObserver:(anObserver)]\

#endif /* MacroDef_Notification_h */
