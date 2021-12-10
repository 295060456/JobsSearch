//
//  NSObject+DeviceIP.h
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#import <Foundation/Foundation.h>

#import <ifaddrs.h>
#import <arpa/inet.h>
#import <net/if.h>

#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DeviceIP)

+(NSString *)getIPaddress;//获取ip地址
+(BOOL)isValidatIP:(NSString *)ipAddress;
+(NSDictionary *)getIPAddresses;
+(NSString *)getLocalIPAddress:(BOOL)preferIPv4;
+(NSString *)getNetworkIPAddress;

@end

NS_ASSUME_NONNULL_END
