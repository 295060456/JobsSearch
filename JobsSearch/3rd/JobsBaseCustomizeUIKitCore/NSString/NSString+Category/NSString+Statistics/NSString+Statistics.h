//
//  NSString+Statistics.h
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, CalcLabelHeight_Width) {
    CalcLabelHeight = 0,
    CalcLabelWidth
};

typedef NS_ENUM(NSInteger,StatisticsAlphabetNumberType) {
    StatisticsAlphabetNumberType_Chinese = 0,//统计汉字字数
    StatisticsAlphabetNumberType_English//统计英文字母数字
};

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Statistics)
#pragma mark —— 字符串的 统计 & 计算
/// 根据字符串以及其对应的行宽（行高）、行高和字体字号，计算该文本占用的高度（宽度）
/// @param lineSpacing 行与行之间的间距
/// @param calcLabelHeight_Width 计算的结论是宽或者高
/// @param font 该字符串的字号和字体
/// @param Height_Width  文本的宽度
-(CGFloat)getContentHeightOrWidthWithParagraphStyleLineSpacing:(CGFloat)lineSpacing
                                         calcLabelHeight_Width:(CalcLabelHeight_Width)calcLabelHeight_Width
                                                          font:(UIFont *_Nullable)font
                                  boundingRectWithHeight_Width:(CGFloat)Height_Width;
/// 根据字体大小 和宽度 计算文字的高
-(float)textHitWithFont:(float)font
                  width:(float)width;
/*
    系统的length是不区分中文和英文的,中文一个字length也是1
    通过计算ASCII码来实现:
    循环遍历字符串长度，按照length来取值。判断这个值在不在ASCII的范围内，在的话就是1个字节，不在就是Unicode编码2个字节。
 **/
-(NSUInteger)textLength;
/// 统计字符串中中英文的字数
/// @param statisticsAlphabetNumberType 统计模式
-(NSInteger)statisticsAlphabetNumberwithType:(StatisticsAlphabetNumberType)statisticsAlphabetNumberType;

@end

NS_ASSUME_NONNULL_END
