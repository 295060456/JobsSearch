//
//  UILabel+Measure.m
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#import "UILabel+Measure.h"

@implementation UILabel (Measure)

/// iOS根据字体字号大小和字体label计算label宽度
+(CGSize)sizeWithText:(NSString *)text
                 font:(UIFont *)font
              maxSize:(CGSize)maxSize{
    NSDictionary *attrs = @{NSFontAttributeName : font};// 因为attributes，此处还可以拓展
    return [text boundingRectWithSize:maxSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:attrs
                              context:nil].size;
}

@end
