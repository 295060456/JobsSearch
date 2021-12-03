//
//  NSObject+UUID.m
//  Casino
//
//  Created by Jobs on 2021/12/2.
//

#import "NSObject+UUID.h"

@implementation NSObject (UUID)

-(NSString *)UUID{
    CFUUIDRef uuid_ref = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef uuid_string_ref = CFUUIDCreateString(kCFAllocatorDefault, uuid_ref);
    CFRelease(uuid_ref);
    NSString *uuid = [NSString ensureNonnullString:[NSString stringWithString:(__bridge NSString*)uuid_string_ref]
                                        ReplaceStr:@""];
    CFRelease(uuid_string_ref);
    return uuid.lowercaseString;
}

@end
