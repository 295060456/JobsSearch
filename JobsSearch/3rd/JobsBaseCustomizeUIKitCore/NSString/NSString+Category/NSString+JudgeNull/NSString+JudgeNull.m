//
//  NSString+JudgeNull.m
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import "NSString+JudgeNull.h"

@implementation NSString (JudgeNull)
#pragma mark —— 判空
- (BOOL)isNotBlank {
    NSCharacterSet *blank = NSCharacterSet.whitespaceAndNewlineCharacterSet;
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return YES;
        }
    }return NO;
}
/**
*  判断对象 / 数组是否为空
*  为空返回 YES
*  不为空返回 NO
*/
+(BOOL)isNullString:(NSString *)string{
    if (string == nil ||
        string == NULL ||
        (NSNull *)string == NSNull.null ||
        [string isKindOfClass:NSNull.class] ||
        [string isEqualToString:@"(null)"]||
        [string isEqualToString:@"null"]||
        [string isEqualToString:@"<null>"]) {
        return YES;
    }

    string = StringFormat(@"%@",string);
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];//去掉两端的空格
    if (string.length == 0) {
        return YES;
    }return NO;
}
/// 是否包含空格【返回YES有空格】【返回NO没有空格】
-(BOOL)isHaveWhiteSpace{
    NSRange _range = [self rangeOfString:@" "];
    return _range.location != NSNotFound;
}

@end
