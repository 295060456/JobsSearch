//
//  UIView+BackgroundImage.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2021/1/22.
//  Copyright © 2021 MonkeyKingVideo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIView (BackgroundImage)

@property(nonatomic,strong)UIImageView *backgroundImageView;

@end

NS_ASSUME_NONNULL_END
