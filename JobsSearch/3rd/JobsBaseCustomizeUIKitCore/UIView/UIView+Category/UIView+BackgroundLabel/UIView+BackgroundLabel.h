//
//  UIView+BackgroundLabel.h
//  Casino
//
//  Created by Jobs on 2021/12/6.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIView (BackgroundLabel)

@property(nonatomic,strong)UILabel *backgroundLabel;

@end

NS_ASSUME_NONNULL_END
