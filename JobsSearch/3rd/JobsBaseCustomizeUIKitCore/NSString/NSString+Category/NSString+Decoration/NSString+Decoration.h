//
//  NSString+Decoration.h
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Decoration)
#pragma mark —— 字符串包装
/// 截取字符串方法封装
-(NSString *)subStringFrom:(NSString *)startString
                        to:(NSString *)endString;

@end

NS_ASSUME_NONNULL_END
