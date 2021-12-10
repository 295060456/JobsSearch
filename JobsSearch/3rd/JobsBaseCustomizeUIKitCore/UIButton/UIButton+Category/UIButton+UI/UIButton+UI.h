//
//  UIButton+UI.h
//  Casino
//
//  Created by Jobs on 2021/11/29.
//

#import <UIKit/UIKit.h>
#import "MacroDef_Strong@Weak.h"
/// For RAC
#define BtnClickEvent(button,action)\
@jobs_weakify(self)\
[[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {\
    @jobs_strongify(self)\
    action\
}];\
/// For UIKit
#define BtnAction(button,target,action)\
[button addTarget:target\
           action:action\
 forControlEvents:UIControlEventTouchUpInside];\

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (UI)

#pragma mark —— Common
-(void)titleFont:(UIFont *)font;
-(void)titleAlignment:(NSTextAlignment)textAlignment;
#pragma mark —— Normal
-(void)normalImage:(UIImage *)image;
-(void)normalBackgroundImage:(UIImage *)backgroundImage;
-(void)normalTitle:(NSString *)title;
-(void)normalTitleColor:(UIColor *)titleColor;
#pragma mark —— Selected
-(void)selectedImage:(UIImage *)image;
-(void)selectedBackgroundImage:(UIImage *)backgroundImage;
-(void)selectedTitle:(NSString *)title;
-(void)selectedTitleColor:(UIColor *)titleColor;

@end

NS_ASSUME_NONNULL_END
