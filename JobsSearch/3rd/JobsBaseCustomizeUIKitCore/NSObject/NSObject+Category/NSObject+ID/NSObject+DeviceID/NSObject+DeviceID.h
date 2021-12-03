//
//  NSObject+DeviceID.h
//  Casino
//
//  Created by Jobs on 2021/12/2.
//

#import <Foundation/Foundation.h>
#import "KeychainHelper.h"

#ifndef UUIDSTRING
#define UUIDSTRING @"UUIDSTRING"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DeviceID)
/**
 我们可以获取到UUID，然后把UUID保存到KeyChain里面。
 这样以后即使APP删了再装回来，也可以从KeyChain中读取回来。使用group还可以可以保证同一个开发商的所有程序针对同一台设备能够获取到相同的不变的UDID。
 但是刷机或重装系统后uuid还是会改变。
 */
-(void)deleteDeviceID;
-(NSString *)deviceID;

@end

NS_ASSUME_NONNULL_END
