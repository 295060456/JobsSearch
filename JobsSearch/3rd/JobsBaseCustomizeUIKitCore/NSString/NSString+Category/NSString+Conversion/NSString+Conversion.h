//
//  NSString+Conversion.h
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Conversion)
#pragma mark —— 转化
/// 字符串中取数字
-(long long)getDigits;
/// 读取本地JSON文件
-(NSDictionary *)readLocalFileWithName;
/// JSON 转 NSDictionary
-(NSDictionary *)dictionaryWithJsonString;
/// NSDictionary 转 json字符串方法//==[dic mj_JSONString]
-(NSString *)convertToJsonData:(NSDictionary *)dict;
/// NSDictionary 转 NSString
-(NSString *)convertDictionaryToString:(NSMutableDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
