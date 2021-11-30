//
//  UITabBar+Ex.m
//  TabbarItemLottie
//
//  Created by 叶晓倩 on 2017/9/29.
//  Copyright © 2017年 xa. All rights reserved.
//

#import "UITabBar+Ex.h"

@implementation UITabBar (Ex)

-(void)addLottieImage:(NSUInteger)index
              offsetY:(CGFloat)offsetY
           lottieName:(nullable NSString *)lottieName {
    @jobs_weakify(self)
    dispatch_async(dispatch_get_main_queue(), ^{
        @jobs_strongify(self)
        // lottieName 存在才对LOTAnimationView及其相关控件进行创建
        if (![NSString isNullString:lottieName]) {
            LOTAnimationView *lottieView = [LOTAnimationView animationNamed:lottieName];
            
            CGFloat totalW = UIScreen.mainScreen.bounds.size.width;
            CGFloat singleW = totalW / self.items.count;
            
            CGFloat x = ceilf(index * singleW + (singleW - LOTAnimationViewWidth) / 2.0);

            lottieView.userInteractionEnabled = NO;
            lottieView.contentMode = UIViewContentModeScaleAspectFit;
            lottieView.tag = 888 + index;
            lottieView.frame = CGRectMake(x,
                                          offsetY,
                                          LOTAnimationViewWidth,
                                          LOTAnimationViewHeight);
            
            [self addSubview:lottieView];
        }
    });
}

-(void)animationLottieImage:(NSInteger)index{
    [self stopAnimationAllLottieView];
    
    LOTAnimationView *lottieView = [self viewWithTag:888 + index];
    if (lottieView && [lottieView isKindOfClass:LOTAnimationView.class]) {
        lottieView.animationProgress = 0;
        [lottieView play];
    }
}

-(void)stopAnimationAllLottieView {
    for (int i = 0; i < self.items.count; i++) {
        LOTAnimationView *lottieView = [self viewWithTag:888 + i];
        if (lottieView && [lottieView isKindOfClass:LOTAnimationView.class]) {
            [lottieView stop];
        }
    }
}

@end
