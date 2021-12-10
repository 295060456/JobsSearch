//
//  UIViewController+Lottie.h
//  Casino
//
//  Created by Jobs on 2021/11/29.
//

#import <UIKit/UIKit.h>

#import "JobsString.h"

#if __has_include(<lottie-ios/Lottie.h>)
#import <lottie-ios/Lottie.h>
#else
#import "Lottie.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Lottie)

/// 加盖一个Lottie播放器在本控制器view之上
/// @param lottieImage LottieName
-(void)addLottieImage:(NSString *)lottieImage;
/// 开始播放Lottie动画
-(void)lottieImagePlay;

@end

NS_ASSUME_NONNULL_END
