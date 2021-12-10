//
//  JobsObject.h
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#ifndef JobsObject_h
#define JobsObject_h

#pragma mark —— Base
/// App语言国际化
#import "CLLanguageManager.h"
///  文件夹操作
#import "FileFolderHandleTool.h"
/// 时间管理
#import "JobsTimerManager.h"
/// 时间格式转换、时间相关模型 【包含  JobsTimeModel 和 JobsTimeFormatterModel 两个类】
#import "JobsTimeModel.h"
/// 网络监控
#import "JobsMonitorNetwoking.h"
/// 设备信息
#import "CurrentDeviceModel.h"
/// SockeIO
#import "JobsSocketIOTools.h"
/// TouchID
#import "TouchID.h"
/// 移除系统自带的UITabBarButton
#import "DeleteSystemUITabBarButton.h"
/// 本类是自定义类，但是是对系统类的仿写，目的是承接上下文数据 成一束，方便管理
#import "UIViewModel.h"

#pragma mark —— Category
/// 正则表达式鉴定
#import "NSObject+RegularExpression.h"
/// 关于本机IP
#import "NSObject+DeviceIP.h"
/// 一些其他的拓展
#import "NSObject+Extras.h"
/// iOS设备唯一标识符
#import "NSObject+ID.h"
/// 测量数据
#import "NSObject+Measure.h"
/// 线程定义
#import "NSObject+DefConfig.h"
/// 全局的通知定义
#import "NSObject+Notification.h"
/// 万物回调
#import "NSObject+CallBackInfoByBlock.h"
/// 万物数据绑定
#import "NSObject+DataBinding.h"
/// runtime方法交换
#import "NSObject+Swizzling.h"
/// 打开URL
#import "NSObject+OpenURL.h"
/// 取随机
#import "NSObject+Random.h"
/// 富文本
#import "NSObject+RichText.h"
/// 振动反馈
#import "NSObject+Shake.h"
/// 声音反馈
#import "NSObject+Sound.h"
/// 对类的查看
#import "NSObject+Class.h"
/// 时间相关方法
#import "NSObject+Time.h"
/// 网易云盾
#import "NSObject+NTESVerifyCode.h"
/// 提示
#import "NSObject+WHToast.h"
/// NSObject+Alert
#import "NSObject+SPAlertController.h"
#import "NSObject+SYSAlertController.h"
/// 网络监控
#import "NSObject+AFNReachability.h"
///【对FileFolderHandleTool的二次封装】 存数据，储存成功返回地址
#import "NSObject+DataSave.h"


#endif /* JobsObject_h */
