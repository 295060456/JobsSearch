//
//  NSString+Statistics.m
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import "NSString+Statistics.h"

@implementation NSString (Statistics)
#pragma mark —— 字符串的 统计 & 计算
/// 根据字符串以及其对应的行宽（行高）、行高和字体字号，计算该文本占用的高度（宽度）
/// @param lineSpacing 行与行之间的间距
/// @param calcLabelHeight_Width 计算的结论是宽或者高
/// @param font 该字符串的字号和字体
/// @param Height_Width  文本的宽度/高度
-(CGFloat)getContentHeightOrWidthWithParagraphStyleLineSpacing:(CGFloat)lineSpacing
                                         calcLabelHeight_Width:(CalcLabelHeight_Width)calcLabelHeight_Width
                                                          font:(UIFont *_Nullable)font
                                  boundingRectWithHeight_Width:(CGFloat)Height_Width{
    if(@available(iOS 7.0, *)){
        CGSize lableSize = CGSizeZero;
        if([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]){
            NSMutableDictionary *attributesMutDic = NSMutableDictionary.dictionary;
            if (font) {
                [attributesMutDic setObject:font
                                     forKey:NSFontAttributeName];
            }
            if (lineSpacing) {
                NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
                paragraphStyle.lineSpacing = lineSpacing;
                [attributesMutDic setObject:paragraphStyle
                                     forKey:NSParagraphStyleAttributeName];
            }
            
            CGSize size;
            
            switch (calcLabelHeight_Width) {
                case CalcLabelHeight:{
                    size = CGSizeMake(Height_Width, MAXFLOAT);
                }break;
                case CalcLabelWidth:{
                    size = CGSizeMake(MAXFLOAT, Height_Width);
                }break;
                default:{
                    size = CGSizeZero;
                }break;
            }
            
            CGSize sizeTemp = [self boundingRectWithSize:size
                                                 options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                              attributes:attributesMutDic
                                                 context:nil].size;
            lableSize = CGSizeMake(ceilf(sizeTemp.width),
                                   ceilf(sizeTemp.height));
        }
        
        switch (calcLabelHeight_Width) {
            case CalcLabelHeight:{
                return lableSize.height;
            }break;
            case CalcLabelWidth:{
                return lableSize.width;
            }break;
            default:{
                return 0;
            }break;
        }
    }else{
        NSAssert(NO, @"系统版本低于iOS 7，不兼容Api，请升级系统");
        return 0;
    }
}
/// 根据字体大小 和宽度 计算文字的高
-(float)textHitWithFont:(float)font
                  width:(float)width{
    if (!font) {
        font = 14.0;
    }

    if (width == 0.0f) {
        width = 20;
    }
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font weight:UIFontWeightRegular]}
                                     context:nil];
    return rect.size.height;
}
/*
    系统的length是不区分中文和英文的,中文一个字length也是1
    通过计算ASCII码来实现:
    循环遍历字符串长度，按照length来取值。判断这个值在不在ASCII的范围内，在的话就是1个字节，不在就是Unicode编码2个字节。
 **/
-(NSUInteger)textLength{
    NSUInteger asciiLength = 0;
    for (NSUInteger i = 0; i < self.length; i++) {
        unichar uc = [self characterAtIndex:i];
        asciiLength += isascii(uc) ? 1 : 2;
    }
    NSUInteger unicodeLength = asciiLength;
    return unicodeLength;
}
/// 统计字符串中中英文的字数
/// @param statisticsAlphabetNumberType 统计模式
-(NSInteger)statisticsAlphabetNumberwithType:(StatisticsAlphabetNumberType)statisticsAlphabetNumberType{
    NSInteger chineseCount = 0;
    NSInteger EnglishCount = 0;
    for (NSInteger i = 0; i < self.length; i++){
        unichar c = [self characterAtIndex:i];
        if (c >=0x4E00 && c <=0x9FA5){
            chineseCount ++;
        }else{
            EnglishCount ++;
        }
    }
         
    NSLog(@"字符串:%@包含——> 汉字字数：%ld;字母字数%ld",self,(long)chineseCount,(long)EnglishCount);
    
    switch (statisticsAlphabetNumberType) {
        case StatisticsAlphabetNumberType_Chinese:{
            return chineseCount;
        }break;
        case StatisticsAlphabetNumberType_English:{
            return EnglishCount;
        }break;
        default:
            break;
    }
}

@end
