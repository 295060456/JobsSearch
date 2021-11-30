//
//  UIViewController+Lottie.m
//  Casino
//
//  Created by Jobs on 2021/11/29.
//

#import "UIViewController+Lottie.h"

@implementation UIViewController (Lottie)
/// 加盖一个Lottie播放器在本控制器view之上
/// @param lottieImage LottieName
-(void)addLottieImage:(NSString *)lottieImage{
    if (![NSString isNullString:lottieImage]) {
//        self.view.backgroundColor = UIColor.lightGrayColor;
        LOTAnimationView *lottieView = [LOTAnimationView animationNamed:lottieImage];
        lottieView.frame = UIScreen.mainScreen.bounds;
        lottieView.contentMode = UIViewContentModeScaleAspectFit;
        lottieView.loopAnimation = YES;
        lottieView.tag = 100;
        [self.view addSubview:lottieView];
    }
}
/// 开始播放Lottie动画
-(void)lottieImagePlay{
    LOTAnimationView *lottieView = (LOTAnimationView *)[self.view viewWithTag:100];
    if (!lottieView ||
        ![lottieView isKindOfClass:LOTAnimationView.class]) {
        return;
    }
    lottieView.animationProgress = 0;
    [lottieView play];
}

@end
