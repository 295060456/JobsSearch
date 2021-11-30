//
//  NSString+Judgment.m
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import "NSString+Judgment.h"

@implementation NSString (Judgment)
#pragma mark —— 字符串的 比较 & 判断
/// 给定某字符串，判断里面的组成char是否全部为某个char
/// @param standardChar 执行标准
-(BOOL)isAllSameCharWithStandardChar:(char)standardChar{
    if (self.length) {
        NSMutableArray* carries = [NSMutableArray array];
        for (int i=0; i < self.length; i++) {
            char s = [self characterAtIndex:i];
            if(s == standardChar){
                NSString *tempString = [NSString stringWithUTF8String:&s];
                [carries addObject:tempString];
            }
        }
        return carries.count == self.length;
    }return NO;
}
/// 是否是系统自带九宫格输入 yes-是 no-不是
-(BOOL)isNineKeyBoard{
    NSString *other = @"➋➌➍➎➏➐➑➒";
    int len = (int)self.length;
    for(int i = 0;i < len;i++){
        if(!([other rangeOfString:self].location != NSNotFound))
            return NO;
    }return YES;
}
/// 如果字符串为null 那么不走isEqualToString，无法比较都是空的情况
+(BOOL)isEqualStrA:(NSString *)stringA
              strB:(NSString *)stringB{
    if ([NSString isNullString:stringA] && [NSString isNullString:stringB]) {//双方都是null
        return YES;
    }else{
        return [stringA isEqualToString:stringB];
    }
}
/// 判断是否为纯整数
-(BOOL)judgeiphoneNumberInt{
    NSScanner *scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}
/// 是否全是字母（26个英文字母）
-(BOOL)isAllLetterCharacter{
    NSString *stringRegex = @"^[A-Za-z]+$";
    NSPredicate *stringTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stringRegex];
    return [stringTest evaluateWithObject:self];
}
/// 字符串是否包含URL【返回YES包含】
-(BOOL)isContainsUrl{
    NSString *checkStr = [@"https://" stringByAppendingString:@"http://"];
    return [self rangeOfString:checkStr].location != NSNotFound;
}
/// 正则匹配手机号
-(BOOL)checkTelNumber{
    NSString *pattern = @"^1+[3578]+\\d{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
/*
 分开来注释一下：
 ^ 匹配一行的开头位置
 (?![0-9]+$) 预测该位置后面不全是数字
 (?![a-zA-Z]+$) 预测该位置后面不全是字母
 [0-9A-Za-z] {8,16} 由8-16位数字或这字母组成
 $ 匹配行结尾位置
 
 注：(?!xxxx) 是正则表达式的负向零宽断言一种形式，标识预该位置后不是xxxx字符。
 https:blog.csdn.net/w6524587/article/details/56279494
密码(以字母开头，长度在6~18之间，只能包含字母、数字和下划线)：
 ^[a-zA-Z]\w{5,17}$
强密码(必须包含大小写字母和数字的组合，不能使用特殊字符，长度在8-10之间)：
 ^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$
 */
-(BOOL)isContainAllCharType{
    
    NSString * regex = @"^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{4,16}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];

//    NSString * regexLower = @"[a-z]+$";
//    NSPredicate *predLower = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexLower];
//
//    NSString * regexNumber = @"[^0-9]+$";
//    NSPredicate *predNumber = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexNumber];
    
    BOOL isMatch = ([pred evaluateWithObject:self]
                    );//&&[predLower evaluateWithObject:originString]
//    &&![predNumber evaluateWithObject:originString]
    return isMatch;
    
//    NSRegularExpression *numberRegular = [NSRegularExpression regularExpressionWithPattern:@"[A-Za-z0-9]*" options:NSRegularExpressionCaseInsensitive error:nil];
//    NSInteger count = [numberRegular numberOfMatchesInString:originString options:NSMatchingReportProgress range:NSMakeRange(0, originString.length)];//count是str中包含[A-Za-z0-9]数字的个数，只要count>0，说明str中包含数字
//    if (count > 0) {
//        return YES;
//
//    }
//    return NO;
}

@end
