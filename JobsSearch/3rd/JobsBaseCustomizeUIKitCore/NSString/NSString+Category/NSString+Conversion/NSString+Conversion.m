//
//  NSString+Conversion.m
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import "NSString+Conversion.h"

@implementation NSString (Conversion)
#pragma mark —— 转化
/// 字符串中取数字
-(long long)getDigits{
    NSCharacterSet *nonDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    int remainSecond = [[self stringByTrimmingCharactersInSet:nonDigits] intValue];
    return (long long)remainSecond;
}
/// 读取本地JSON文件
-(NSDictionary *)readLocalFileWithName{
    // 获取文件路径
    NSString *path = [NSBundle.mainBundle pathForResource:self ofType:@"json"];
    // 将文件数据化
    NSData *data = [NSData.alloc initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data
                                           options:kNilOptions
                                             error:nil];
}
/// JSON 转 NSDictionary
-(NSDictionary *)dictionaryWithJsonString{
    if ([NSString isNullString:self]) {
        return nil;
    }
//  https://www.wynter.wang/2019/02/15/ios%20%20%E5%A4%84%E7%90%86%E5%AF%BC%E8%87%B4json%E8%A7%A3%E6%9E%90%E5%A4%B1%E8%B4%A5%E7%9A%84%E7%89%B9%E6%AE%8A%E5%AD%97%E7%AC%A6/
//  特殊字符会导致解析失败
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err){
        NSLog(@"json解析失败：%@",err);
        return nil;
    }return dic;
}
/// NSDictionary 转 json字符串方法//==[dic mj_JSONString]
-(NSString *)convertToJsonData:(NSDictionary *)dict{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [NSString.alloc initWithData:jsonData
                                         encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" "
                            withString:@""
                               options:NSLiteralSearch
                                 range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n"
                            withString:@""
                               options:NSLiteralSearch
                                 range:range2];
    return mutStr;
}
/// NSDictionary 转 NSString
-(NSString *)convertDictionaryToString:(NSMutableDictionary *)dict{
    NSError *error;
    NSDictionary *tempDict = dict.copy;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:tempDict
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSString *nsJson=  [NSString.alloc initWithData:jsonData
                                           encoding:NSUTF8StringEncoding];
    return nsJson;
}

@end
