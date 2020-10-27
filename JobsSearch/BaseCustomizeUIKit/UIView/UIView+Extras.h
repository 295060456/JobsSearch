//
//  UIView+Extension.h
//  MJRefreshExample
//
//  Created by Aalto on 14-5-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, UIBorderSideType) {
    UIBorderSideTypeAll  = 0,
    UIBorderSideTypeTop = 1 << 0,
    UIBorderSideTypeBottom = 1 << 1,
    UIBorderSideTypeLeft = 1 << 2,
    UIBorderSideTypeRight = 1 << 3,
};

@interface UIView (Extras)
/// 指定描边
/// @param view 作用view
/// @param color 作用颜色
/// @param width 线宽
/// @param borderType 作用方向
- (void)setBorderWithView:(UIView *__nonnull)view
              borderColor:(UIColor *__nonnull)color
              borderWidth:(CGFloat)width
               borderType:(UIBorderSideType)borderType;
/**
 切角
 
 @param view TargetView
 @param cornerRadiusValue 切角参数
 */
+(void)cornerCutToCircleWithView:(UIView *__nonnull)view
                 AndCornerRadius:(CGFloat)cornerRadiusValue;

/**
 描边
 
 @param view TargetView
 @param colour 颜色
 @param WidthOfBorder 边线宽度
 */
+(void)colourToLayerOfView:(UIView *__nonnull)view
                WithColour:(UIColor *__nonnull)colour
            AndBorderWidth:(CGFloat)WidthOfBorder;

/**
 *  指定圆切角
 */
+(void)appointCornerCutToCircleWithTargetView:(UIView *__nonnull)targetView
                            byRoundingCorners:(UIRectCorner)corners
                                  cornerRadii:(CGSize)cornerRadii;
//旋转
+(void)setTransform:(float)radians
            forView:(UIView *__nonnull)view;
//view 转 image
+ (UIImage *)getImageFromView:(UIView *__nonnull)view;
///外部调用实现cell阴影功能
-(void)shadowCellWithLayerCornerRadius:(CGFloat)layerCornerRadius
                      layerShadowColor:(UIColor *__nullable)layerShadowColor
                     layerShadowRadius:(CGFloat)layerShadowRadius
                    layerShadowOpacity:(CGFloat)layerShadowOpacity;


@end
