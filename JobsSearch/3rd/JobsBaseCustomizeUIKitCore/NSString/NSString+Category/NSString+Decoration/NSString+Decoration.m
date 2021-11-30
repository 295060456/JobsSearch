//
//  NSString+Decoration.m
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import "NSString+Decoration.h"

@implementation NSString (Decoration)

#pragma mark —— 字符串包装
/// 截取字符串方法封装
-(NSString *)subStringFrom:(NSString *)startString
                        to:(NSString *)endString{
    NSRange startRange = [self rangeOfString:startString];
    NSRange endRange = [self rangeOfString:endString];
    NSRange range = NSMakeRange(startRange.location + startRange.length,
                                endRange.location - startRange.location - startRange.length);
    return [self substringWithRange:range];
}

@end
