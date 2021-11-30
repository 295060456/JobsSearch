//
//  NSString+Others.h
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Others)
#pragma mark —— 其他
+(NSString *)test:(NSArray <NSString *>*)arr;
/// ？？？
-(NSString *)formatDecimalNumber;
-(NSString *)getAnonymousString;

@end

NS_ASSUME_NONNULL_END
