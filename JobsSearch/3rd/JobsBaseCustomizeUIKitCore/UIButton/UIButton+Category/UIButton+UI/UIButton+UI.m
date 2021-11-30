//
//  UIButton+UI.m
//  Casino
//
//  Created by Jobs on 2021/11/29.
//

#import "UIButton+UI.h"

@implementation UIButton (UI)

-(void)normalBackgroundImage:(UIImage *)backgroundImage{
    [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
}

-(void)normalTitle:(NSString *)title{
    [self setTitle:title forState:UIControlStateNormal];
}

-(void)normalTitleColor:(UIColor *)titleColor{
    [self setTitleColor:titleColor forState:UIControlStateNormal];
}

-(void)titleFont:(UIFont *)font{
    self.titleLabel.font = font;
}

@end
