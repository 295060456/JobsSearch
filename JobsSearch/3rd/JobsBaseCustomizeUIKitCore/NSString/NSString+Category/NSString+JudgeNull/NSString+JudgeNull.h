//
//  NSString+JudgeNull.h
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import <Foundation/Foundation.h>
#import "MacroDef_Func.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JudgeNull)
#pragma mark —— 判空
-(BOOL)isNotBlank;
/**
*  判断对象 / 数组是否为空
*  为空返回 YES
*  不为空返回 NO
*/
+(BOOL)isNullString:(NSString *)string;
/// 是否包含空格【返回YES有空格】【返回NO没有空格】
-(BOOL)isHaveWhiteSpace;

@end

NS_ASSUME_NONNULL_END
