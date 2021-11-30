//
//  UIButton+UI.h
//  Casino
//
//  Created by Jobs on 2021/11/29.
//

#import <UIKit/UIKit.h>
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

-(void)normalImage:(UIImage *)image;
-(void)normalBackgroundImage:(UIImage *)backgroundImage;
-(void)normalTitle:(NSString *)title;
-(void)normalTitleColor:(UIColor *)titleColor;
-(void)titleFont:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
