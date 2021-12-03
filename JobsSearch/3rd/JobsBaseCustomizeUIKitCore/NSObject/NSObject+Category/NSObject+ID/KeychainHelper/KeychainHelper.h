//
//  KeychainHelper.h
//  KeychainIDFA
//
//  Created by Qixin on 14/12/18.
//  Copyright (c) 2014年 Qixin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Security/Security.h>
#import "MacroDef_SysWarning.h"
#import "MacroDef_Sys.h"

@interface KeychainHelper : NSObject

/**
 我们可以获取到UUID，然后把UUID保存到KeyChain里面。
 这样以后即使APP删了再装回来，也可以从KeyChain中读取回来。使用group还可以可以保证同一个开发商的所有程序针对同一台设备能够获取到相同的不变的UDID。
 但是刷机或重装系统后uuid还是会改变。
 */
+(id)load:(NSString *)service;
+(void)save:(NSString *)service data:(id)data;
+(void)remove:(NSString *)service;

@end
