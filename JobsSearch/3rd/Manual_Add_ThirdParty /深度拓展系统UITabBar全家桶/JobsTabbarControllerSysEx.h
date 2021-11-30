//
//  JobsTabbarControllerSysEx.h
//  Casino
//
//  Created by Jobs on 2021/11/29.
//

#ifndef JobsTabbarControllerSysEx_h
#define JobsTabbarControllerSysEx_h

#import "JobsTabBarControllerConfig.h"//全局配置文件
#import "JobsTabBarControllerConstruction.h"//构造方法

//UITabBarItem
#import "UITabBarItem+TLAnimation.h"
#import "JobsTabBarItem.h"
//UITabBarController
#import "JobsTabbarVC.h"
//UITabBar
#import "UITabBar+TLAnimation.h"
#import "JobsTabBar.h"
#import "UITabBar+Ex.h"

//在系统api基础上二次封装的功能性拓展
#import "LoadingImage.h"
//UIView
#import "UIView+Animation.h"
#import "UIView+Chain.h"
#import "UIView+Extras.h"
#import "UIView+Measure.h"
#import "UIView+SuspendView.h"//悬浮的根
//NSString
#import "NSString+Extras.h"
//NSObject
#import "NSObject+Extras.h"
#import "NSObject+Sound.h"

//一些需要单独列出来的功能性模块(可选功能)
//Telegram动效：在指定位置出现菜单列表
#import "JobsPullListAutoSizeView.h"
//功能性动效：手势横向滚动子VC联动Tabbar切换
#import "TransitionAnimation.h"
#import "TransitionController.h"
//Tabbaritem点击动效
#import "TLAnimationProtocol.h"
#import "TLTabBarAnimation.h"
//悬浮小球、可旋转、可择机手动停止
#import "SuspendBtn.h"

#endif /* JobsTabbarControllerSysEx_h */
