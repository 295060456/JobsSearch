//
//  UIImage+screenshot.h
//  Shooting
//
//  Created by Jobs on 2020/9/20.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (screenshot)

/** 获取屏幕截图 */
+(UIImage *)getCurrentScreenShot;
/** 获取某个view 上的截图 */
+(UIImage *)getCurrentViewShot:(UIView *)view;
/** 获取某个scrollview 上的截图 */
+(UIImage *)getCurrentScrollviewShot:(UIScrollView *)scrollview;
/** 获取某个 范围内的 截图 */
+(UIImage *)getCurrentInnerViewShot:(UIView *)innerView atFrame:(CGRect)rect;

@end

NS_ASSUME_NONNULL_END
