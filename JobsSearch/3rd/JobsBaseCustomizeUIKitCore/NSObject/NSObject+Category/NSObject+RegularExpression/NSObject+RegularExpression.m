//
//  NSObject+RegularExpression.m
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#import "NSObject+RegularExpression.h"

@implementation NSObject (RegularExpression)

#pragma mark - 私有方法
/**
 *  基本的验证方法
 *
 *  @param regEx 校验格式
 *  @param data  要校验的数据
 *
 *  @return YES:成功 NO:失败
 */
+(BOOL)baseCheckForRegEx:(NSString *)regEx
                    data:(NSString *)data{
    NSPredicate *card = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    if (([card evaluateWithObject:data])) {
        return YES;
    }return NO;
}
#pragma mark - 邮箱校验
+(BOOL)lc_checkingEmail:(NSString *)email{
    NSString *regEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self baseCheckForRegEx:regEx
                              data:email];
}
#pragma mark - 验证手机号
+(BOOL)lc_checkingMobile:(NSString *)mobile{

    NSString *regEx = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    return [self baseCheckForRegEx:regEx
                              data:mobile];
}
#pragma mark - 验证电话号
+(BOOL)lc_checkingPhoneNum:(NSString *)phone{
    NSString *regEx = @"^(\\d{3,4}-)\\d{7,8}$";
    return [self baseCheckForRegEx:regEx
                              data:phone];
}
#pragma mark - 身份证号验证
+ (BOOL)lc_checkingIdCard:(NSString *)idCard{
    NSString *regEx = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    return [self baseCheckForRegEx:regEx
                              data:idCard];
}
#pragma mark - 密码校验
+(BOOL)lc_checkingPasswordWithShortest:(NSInteger)shortest
                               longest:(NSInteger)longest
                              password:(NSString *)pwd{
    NSString *regEx =[NSString stringWithFormat:@"^[a-zA-Z0-9]{%ld,%ld}+$", shortest, longest];
    return [self baseCheckForRegEx:regEx
                              data:pwd];
}
#pragma mark - 由数字和26个英文字母组成的字符串
+ (BOOL)lc_checkingStrFormNumberAndLetter:(NSString *)data{
    NSString *regEx = @"^[A-Za-z0-9]+$";
    return [self baseCheckForRegEx:regEx
                              data:data];
}
#pragma mark - 26位英文大小写字母组成的字符
+(BOOL)lc_checkingStrFormLowerAndUpperLetter:(NSString *)data{
    NSString *regEx = @"^[A-Za-z]+$";
    return [self baseCheckForRegEx:regEx
                              data:data];
}
#pragma mark - 小写字母
+(BOOL)lc_checkingLowerLetter:(NSString *)lowerCase{
    NSString *regEx = @"^[a-z]+$";
    return [self baseCheckForRegEx:regEx
                              data:lowerCase];
}
#pragma mark - 大写字母
+(BOOL)lc_checkingUpperLetter:(NSString *)upperCase{
    NSString *regEx = @"^[A-Z]+$";
    return [self baseCheckForRegEx:regEx
                              data:upperCase];
}
#pragma mark - 特殊字符
+ (BOOL)lc_checkingSpecialChar:(NSString *)data{
    NSString *regEx = @"[^%&',;=?$\x22]+";
    return [self baseCheckForRegEx:regEx
                              data:data];
}
#pragma mark - 只能输入数字
+ (BOOL)lc_checkingNumber:(NSString *)number{
    NSString *regEx = @"^[0-9]*$";
    return [self baseCheckForRegEx:regEx
                              data:number];
}
#pragma mark - 校验只能输入n位的数字
+ (BOOL)lc_checkingNumberWithLength:(NSString *)length
                             number:(NSString *)number{
    NSString *regEx = [NSString stringWithFormat:@"^\\d{%@}$", length];
    return [self baseCheckForRegEx:regEx
                              data:number];
}
#pragma mark - 校验最少输入n位的数字
+ (BOOL)lc_checkingNumberWithLeastLength:(NSString *)leastLength
                                  number:(NSString *)number{
    NSString *regEx = [NSString stringWithFormat:@"^\\d{%@,}$", leastLength];
    return [self baseCheckForRegEx:regEx
                              data:number];
}

@end
