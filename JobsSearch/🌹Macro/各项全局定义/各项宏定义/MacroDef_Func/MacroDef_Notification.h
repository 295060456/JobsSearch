//
//  MacroDef_Notification.h
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#ifndef MacroDef_Notification_h
#define MacroDef_Notification_h

/// 系统通知
#define NotificationAdd(anObserver, aSEL, noteName, anObj)    [[NSNotificationCenter defaultCenter] \
                                                                addObserver:(anObserver) \
                                                                selector:(aSEL) \
                                                                name:(noteName) \
                                                                object:(anObj)]

#define NotificationRemove(anObserver, notifName, anObj)      [[NSNotificationCenter defaultCenter] \
                                                                removeObserver:(anObserver) \
                                                                name:(notifName) object:(anObj)]

#define NotificationRemoveObserver(anObserver)                [[NSNotificationCenter defaultCenter] \
                                                                removeObserver:(anObserver)]

#define NotificationPost(notifName, anObj, anUserInfo)        [[NSNotificationCenter defaultCenter] \
                                                                postNotificationName:(notifName) \
                                                                object:(anObj) \
                                                                userInfo:(anUserInfo)]

#define NotificationPostOnMainThread(notifName, anObj, anUserInfo) dispatch_async(dispatch_get_main_queue(), ^(void){\
                                                                [[NSNotificationCenter defaultCenter] \
                                                                postNotificationName:(notifName) \
                                                                object:(anObj) \
                                                                userInfo:(anUserInfo)];\
                                                                });\

#endif /* MacroDef_Notification_h */
