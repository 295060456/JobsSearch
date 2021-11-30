//
//  NSString+FilteringSpecialCharacters.h
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import <Foundation/Foundation.h>

/**
    参考文献：https://www.jianshu.com/p/de17fd495935
 */

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXTERN NSString *const 皇冠符号;
FOUNDATION_EXTERN NSString *const 数学符号;
FOUNDATION_EXTERN NSString *const 标点符号;
FOUNDATION_EXTERN NSString *const 单位符号;
FOUNDATION_EXTERN NSString *const 货币符号;
FOUNDATION_EXTERN NSString *const 制表符;
FOUNDATION_EXTERN NSString *const 特殊符号;
FOUNDATION_EXTERN NSString *const 编号序号;
FOUNDATION_EXTERN NSString *const 爱心符号;
FOUNDATION_EXTERN NSString *const 箭头符号;
FOUNDATION_EXTERN NSString *const 符号图案;
#pragma mark —— 语言文字类型
FOUNDATION_EXTERN NSString *const 希腊字母;
FOUNDATION_EXTERN NSString *const 俄语字母;
FOUNDATION_EXTERN NSString *const 汉语拼音;
FOUNDATION_EXTERN NSString *const 中文字符;
FOUNDATION_EXTERN NSString *const 日文平假名和片假名;

/// 过滤特殊字符
@interface NSString (FilteringSpecialCharacters)

/// 外界灵活选择的特殊符号拼接成一个包含所有被选中特殊符号的字符串
/// @param specialSymbolsStringMutArr 选择的特殊符号数组
-(NSString *)specialSymbolsAction:(NSMutableArray <NSString *>*_Nullable)specialSymbolsStringMutArr;
/// 给定一个字符串，通过给定的过滤策略，过滤以后的字符串
/// @param specialSymbolsStringMutArr 过滤策略
-(NSString *_Nullable)filtered:(NSMutableArray <NSString *>*_Nullable)specialSymbolsStringMutArr;
/// 是否包含特殊字符【包含返回YES、不包含返回NO】
/// @param specialSymbolsStringMutArr 过滤策略
-(BOOL)isContainsSpecialSymbolsString:(NSMutableArray <NSString *>*_Nullable)specialSymbolsStringMutArr;

@end

NS_ASSUME_NONNULL_END
