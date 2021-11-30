//
//  NSString+Replace.m
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import "NSString+Replace.h"

@implementation NSString (Replace)
#pragma mark —— 字符串替换
///  有时候我们加载的URL中可能会出现中文,需要我们手动进行转码,但是同时又要保证URL中的特殊字符保持不变,那么我们就可以使用下面的方法
-(NSURL *)Url_Chinese{
    SuppressWdeprecatedDeclarationsWarning(return [NSURL URLWithString:(NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                                                                             (CFStringRef)self,
                                                                                                                                             (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                                                                                                             NULL,kCFStringEncodingUTF8))]);
}
/// 替换相关的字符为暂位符 example
-(NSString *)numberSuitScanf{
    NSString *numberString = [self stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    return numberString;
}
//我自己写的,服务器请求的数据为空值的时候进行替换本地默认值，因为json传输是通过对象包装来进行，所以其实归结起来就是2类，一类是基本数据类型被包装成Number、其他包装成String
+(NSString *)ensureNonnullString:(id)nullableStr
                      ReplaceStr:(NSString *)replaceStr{
    //只有NSNumber 和 NSString 这两种情况
    //过滤特殊字符：空格
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    replaceStr = [replaceStr stringByTrimmingCharactersInSet:whitespace];//有空格，去除空格
    if (replaceStr == nil ||
        replaceStr == Nil ||
        replaceStr.length == 0) {
        replaceStr = @"暂无数据";
    }
    if (nullableStr == nil ||
        nullableStr == NULL ||
        [nullableStr isKindOfClass:NSNull.class]) {//判断空 或者 空对象
        return replaceStr;
    }else if([nullableStr isKindOfClass:NSString.class]){
        NSString *str = (NSString *)nullableStr;
        str = [str stringByTrimmingCharactersInSet:whitespace];//有空格，去除空格
        return str.length == 0 ? replaceStr : str;
    }else if ([nullableStr isKindOfClass:NSNumber.class]){
        NSNumber *b = (NSNumber *)nullableStr;//longlong??
        if (strcmp([nullableStr objCType], @encode(BOOL)) == 0) {// Bool 类型
            return [NSString stringWithFormat:@"%d",b.boolValue];
        }else if (strcmp([nullableStr objCType], @encode(int)) == 0){// int 类型
            return [NSString stringWithFormat:@"%d",b.intValue];
        }else if (strcmp([nullableStr objCType], @encode(float)) == 0){// float 类型
            return [NSString stringWithFormat:@"%f",b.floatValue];
        }else if (strcmp([nullableStr objCType], @encode(double)) == 0){//double 类型
            return [NSString stringWithFormat:@"%f",b.doubleValue];
        }else if (strcmp([nullableStr objCType], @encode(char)) == 0){//char 类型
            return [NSString stringWithFormat:@"%c",b.charValue];
        }else if (strcmp([nullableStr objCType], @encode(u_char)) == 0){//unsigned char 类型
            return [NSString stringWithFormat:@"%c",b.charValue];
        }else if (strcmp([nullableStr objCType], @encode(short)) == 0){//short 类型
            return [NSString stringWithFormat:@"%c",b.shortValue];
        }else if (strcmp([nullableStr objCType], @encode(u_short)) == 0){//unsigned short 类型
            return [NSString stringWithFormat:@"%c",b.shortValue];
        }else if (strcmp([nullableStr objCType], @encode(long)) == 0){//long 类型
            return [NSString stringWithFormat:@"%ld",b.longValue];
        }else if (strcmp([nullableStr objCType], @encode(u_long)) == 0){//unsigned long 类型
            return [NSString stringWithFormat:@"%lu",b.unsignedLongValue];
        }else return replaceStr;
    }else return replaceStr;
}

@end
