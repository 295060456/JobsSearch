//
//  NSObject+UDID.m
//  Casino
//
//  Created by Jobs on 2021/12/2.
//

#import "NSObject+UDID.h"

@implementation NSObject (UDID)

/**
【什么是UDID】
 UDID 「Unique Device Identifier Description」是由子母和数字组成的40个字符串的序号，用来区别每一个唯一的iOS设备，包括 iPhones, iPads, 以及 iPod touches，这些编码看起来是随机的，实际上是跟硬件设备特点相联系的，另外你可以到iTunes，pp助手或itools等软件查看你的udid（设备标识）

【UDID是用来干什么的】
 UDID可以关联其它各种数据到相关设备上。例如，连接到开发者账号，可以允许在发布前让设备安装或测试应用；也可以让开发者获得iOS测试版进行体验。苹果用UDID连接到苹果的ID，这些设备可以自动下载和安装从App Store购买的应用、保存从iTunes购买的音乐、帮助苹果发送推送通知、即时消息。 在iOS 应用早期，UDID被第三方应用开发者和网络广告商用来收集用户数据，可以用来关联地址、记录应用使用习惯……以便推送精准广告。

【为什么苹果反对开发人员使用UDID】
 iOS 2.0版本以后UIDevice提供一个获取设备唯一标识符的方法uniqueIdentifier，通过该方法我们可以获取设备的序列号，这个也是目前为止唯一可以确认唯一的标示符。 许多开发者把UDID跟用户的真实姓名、密码、住址、其它数据关联起来；网络窥探者会从多个应用收集这些数据，然后顺藤摸瓜得到这个人的许多隐私数据。同时大部分应用确实在频繁传输UDID和私人信息。 为了避免集体诉讼，苹果最终决定在iOS 5 的时候，将这一惯例废除，开发者被引导生成一个唯一的标识符，只能检测应用程序，其他的信息不提供。现在应用试图获取UDID已被禁止且不允许上架。

 所以这个方法作废
 */

@end
