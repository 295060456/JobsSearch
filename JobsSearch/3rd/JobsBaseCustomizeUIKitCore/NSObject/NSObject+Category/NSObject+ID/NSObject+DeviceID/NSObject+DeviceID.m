//
//  NSObject+DeviceID.m
//  Casino
//
//  Created by Jobs on 2021/12/2.
//

#import "NSObject+DeviceID.h"

@implementation NSObject (DeviceID)
/**
 我们可以获取到UUID，然后把UUID保存到KeyChain里面。
 这样以后即使APP删了再装回来，也可以从KeyChain中读取回来。使用group还可以可以保证同一个开发商的所有程序针对同一台设备能够获取到相同的不变的UDID。
 但是刷机或重装系统后uuid还是会改变。
 */
-(void)deleteDeviceID{
    [KeychainHelper remove:UUIDSTRING];
}

-(NSString *)deviceID{
    //0.读取keychain的缓存
    NSString *deviceID = [KeychainHelper load:UUIDSTRING];
    if ([NSString isNullString:deviceID]) {
        deviceID = UIDevice.currentDevice.identifierForVendor.UUIDString;
        [KeychainHelper save:UUIDSTRING
                        data:deviceID];
        return deviceID;
    }else{
        return deviceID;
    }
}

@end
