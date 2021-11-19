//
//  UIViewModel.m
//  Casino
//
//  Created by Jobs on 2021/11/19.
//

#import "UIViewModel.h"

@implementation UIViewModel

#pragma mark —— lazyLoad
-(UIColor *)textColor{
    if (!_textColor) {
        _textColor = RGB_SAMECOLOR(51);
    }return _textColor;
}

-(UIFont *)font{
    if (!_font) {
        _font = [UIFont systemFontOfSize:KWidth(12) weight:UIFontWeightRegular];
    }return _font;
}

-(NSString *)text{
    if (!_text) {
        _text = @"UITableViewCellModel默认占位文字";
    }return _text;
}

-(UIImage *)image{
    if (!_image) {
        // TODO
    }return _image;
}

@end
