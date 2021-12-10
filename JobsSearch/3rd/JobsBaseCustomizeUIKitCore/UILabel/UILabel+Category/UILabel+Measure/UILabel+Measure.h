//
//  UILabel+Measure.h
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Measure)

/// iOS根据字体字号大小和字体label计算label宽度
+(CGSize)sizeWithText:(NSString *)text
                 font:(UIFont *)font
              maxSize:(CGSize)maxSize;

@end

NS_ASSUME_NONNULL_END
