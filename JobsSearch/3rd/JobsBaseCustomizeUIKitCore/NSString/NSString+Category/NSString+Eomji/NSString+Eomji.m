//
//  NSString+Eomji.m
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import "NSString+Eomji.h"

@implementation NSString (Eomji)
#pragma mark —— Eomji相关
/// 编码emoji
-(NSString *)emojiEncode{
    NSString *uniStr = [NSString stringWithUTF8String:self.UTF8String];
    NSData *uniData = [uniStr dataUsingEncoding:NSNonLossyASCIIStringEncoding];
    NSString *emojiText = [NSString.alloc initWithData:uniData
                                              encoding:NSUTF8StringEncoding];
    return emojiText;
}
/// 解码emoji
-(NSString *)emojiDecode{
    const char *jsonString = self.UTF8String;
    NSData *jsonData = [NSData dataWithBytes:jsonString
                                      length:strlen(jsonString)];
    NSString *emojiText = [NSString.alloc initWithData:jsonData
                                              encoding:NSNonLossyASCIIStringEncoding];
    return emojiText;
}
/// 判断第三方键盘中的表情
-(BOOL)hasEmoji{
    NSString *pattern = @"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
/// 去除表情
-(NSString *)disableEmoji{
    NSString *temp = @"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:temp
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    NSString *modifiedString = [regex stringByReplacingMatchesInString:self
                                                               options:0
                                                                 range:NSMakeRange(0, self.length)
                                                          withTemplate:@""];
    return modifiedString;
}

/// iOS判断某字符串是否是Emoji表情【有一定缺陷，但能满足大多数业务场景需求（因为Emoji在不断的发展更新，不应该本地写死）】
-(BOOL)validateContainsEmoji{
    __block BOOL returnValue = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring,
                                       NSRange substringRange,
                                       NSRange enclosingRange,
                                       BOOL *stop) {
        const unichar hs = [substring characterAtIndex:0];
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                returnValue = YES;
            }
        } else {
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 ||
                       hs == 0xae ||
                       hs == 0x303d ||
                       hs == 0x3030 ||
                       hs == 0x2b55 ||
                       hs == 0x2b1c ||
                       hs == 0x2b1b ||
                       hs == 0x2b50 ||
                       hs == 0xd83e) {
                returnValue = YES;
            }
        }
    }];return returnValue;
}

-(BOOL)isHaveAppleEomji{
    __block BOOL isEomji = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString * _Nullable substring,
                                       NSRange substringRange,
                                       NSRange enclosingRange,
                                       BOOL * _Nonnull stop) {
//        if(substring.length ==  EmojiCharacterLength){
//            isEomji = YES;
//        }
    }];return isEomji;
}
/**
    过滤表情
    在这个方法中处理  - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
 */
-(BOOL)isContainsTwoEmoji{
    __block BOOL isEomji = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString * _Nullable substring,
                                       NSRange substringRange,
                                       NSRange enclosingRange,
                                       BOOL * _Nonnull stop) {
        const unichar hs = [substring characterAtIndex:0];
        NSLog(@"hs++++++++%04x",hs);
        if (0xd800 <= hs && hs <=  0xdbff){
            if (substring.length > 1){
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) *0xd400) + (ls -0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f){
                     isEomji = YES;
                }
                NSLog(@"uc++++++++%04x",uc);
            }else if(substring.length > 1){
                const unichar ls = [substring characterAtIndex:1];
                if (ls == 0x20e3|| ls ==0xfe0f){
                    isEomji = YES;
                }
                NSLog(@"ls++++++++%04x",ls);
            }else{
                if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b){
                    isEomji = YES;
                }else if (0x2B05 <= hs && hs <= 0x2b07){
                    isEomji = YES;
                }else if (0x2934 <= hs && hs <= 0x2935){
                    isEomji = YES;
                }else if (0x3297 <= hs && hs <= 0x3299){
                    isEomji = YES;
                }else if (hs == 0xa9 ||
                          hs == 0xae ||
                          hs == 0x303d ||
                          hs == 0x3030 ||
                          hs == 0x2b55 ||
                          hs == 0x2b1c ||
                          hs == 0x2b1b ||
                          hs == 0x2b50||
                          hs == 0x231a){
                    isEomji = YES;
                 }
            }
        }
    }];return isEomji;
}

@end
