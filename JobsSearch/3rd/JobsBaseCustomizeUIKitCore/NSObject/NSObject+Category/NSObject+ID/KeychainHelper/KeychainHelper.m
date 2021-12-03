//
//  KeychainHelper.m
//  KeychainIDFA
//
//  Created by Qixin on 14/12/18.
//  Copyright (c) 2014年 Qixin. All rights reserved.
//

#import "KeychainHelper.h"

@implementation KeychainHelper

+(id)load:(NSString *)service{
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    [keychainQuery setObject:(id)kCFBooleanTrue
                      forKey:(__bridge id<NSCopying>)(kSecReturnData)];
    [keychainQuery setObject:(__bridge id)(kSecMatchLimitOne)
                      forKey:(__bridge id<NSCopying>)(kSecMatchLimit)];
    
    CFTypeRef result = NULL;
    if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)keychainQuery, &result) == noErr){
        NSError *error = nil;
        if (AvailableSysVersion(12.0)) {
            [NSKeyedUnarchiver unarchivedObjectOfClass:NSObject.class
                                              fromData:(__bridge NSData *)result
                                                 error:&error];
        }else{
            SuppressWdeprecatedDeclarationsWarning(ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)result]);
        }
    }return ret;
}

+(void)save:(NSString *)service
       data:(id)data{
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((__bridge CFDictionaryRef)(keychainQuery));
    NSData *obj = nil;
    if (AvailableSysVersion(12.0)) {
        NSError *error = nil;
        obj = [NSKeyedArchiver archivedDataWithRootObject:data
                                    requiringSecureCoding:YES
                                                    error:&error];
    }else{
        SuppressWdeprecatedDeclarationsWarning(obj = [NSKeyedArchiver archivedDataWithRootObject:data]);
    }
    
    [keychainQuery setObject:obj
                      forKey:(__bridge id<NSCopying>)(kSecValueData)];
    SecItemAdd((__bridge CFDictionaryRef)(keychainQuery), NULL);
}

+(void)remove:(NSString *)service{
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((__bridge CFDictionaryRef)(keychainQuery));
}

+(NSMutableDictionary *)getKeychainQuery:(NSString *)service{
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge id)(kSecClassGenericPassword),kSecClass,
            service, kSecAttrService,
            service, kSecAttrAccount,
            kSecAttrAccessibleAfterFirstUnlock,kSecAttrAccessible,
            nil];
}

@end
