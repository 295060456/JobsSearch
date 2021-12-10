//
//  UITabBar+Ex.h
//  TabbarItemLottie
//
//  Created by 叶晓倩 on 2017/9/29.
//  Copyright © 2017年 xa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "MacroDef_Strong@Weak.h"

#if __has_include(<lottie-ios/Lottie.h>)
#import <lottie-ios/Lottie.h>
#else
#import "Lottie.h"
#endif

#define LOTAnimationViewWidth 33
#define LOTAnimationViewHeight 33

@interface UITabBar (Ex)

-(void)addLottieImage:(NSUInteger)index
              offsetY:(CGFloat)offsetY
           lottieName:(nullable NSString *)lottieName;
-(void)animationLottieImage:(NSInteger)index;

@end
