//
//  NSObject+IDFV.m
//  Casino
//
//  Created by Jobs on 2021/12/2.
//

#import "NSObject+IDFV.h"

@implementation NSObject (IDFV)
/**
 全名：identifierForVendor
 
 来源：iOS6.0及以后

 说明：顾名思义，是给Vendor标识用户用的，每个设备在所属同一个Vender的应用里，都有相同的值。其中的Vender是指应用提供商，但准确点说，是通过BundleID的反转的前两部分进行匹配，如果相同就是同一个Vender，例如对于com.taobao.app1, com.taobao.app2 这两个BundleID来说，就属于同一个Vender，共享同一个idfv的值。和idfa不同的是，idfv的值是一定能取到的，所以非常适合于作为内部用户行为分析的主id，来标识用户，替代OpenUDID。

 注意：如果用户将属于此Vender的所有App卸载，则idfv的值会被重置，即再重装此Vender的App，idfv的值和之前不同。
 */
-(NSString *)IDFV{
    return UIDevice.currentDevice.identifierForVendor.UUIDString;
}

@end
