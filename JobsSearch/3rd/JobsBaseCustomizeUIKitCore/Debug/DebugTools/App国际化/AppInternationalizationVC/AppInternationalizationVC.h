//
//  AppInternationalizationVC.h
//  Casino
//
//  Created by Jobs on 2021/11/19.
//

#import "AppDelegate.h"
#import "BaseViewController.h"
#import "MacroDef_Func.h"
#import "MacroDef_Notification.h"
#import "NotificationManager.h"
#import "NSObject+AppTools.h"
#import "UIViewController+BackBtn.h"
#import "UITableViewCell+BaseCellProtocol.h"
#import "UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.h"

//#if __has_include(<XYColorOC/XYColorOC.h>)
//#import <XYColorOC/XYColorOC.h>
//#else
//#import "XYColorOC.h"
//#endif

#import "XYColorOC-umbrella.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppInternationalizationVC : BaseViewController
<
UITableViewDelegate
,UITableViewDataSource
>
/// 设置App语言环境
+(void)setAppLanguageAtIndexPath:(NSIndexPath *)indexPath;
/// 【App语言国际化】手动更改UITabBarItem的标题
+(void)changeTabBarItemTitle:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
