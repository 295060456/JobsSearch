//
//  UIViewController+BaseVC.h
//  UBallLive
//
//  Created by Jobs on 2020/10/12.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ComingStyle_PUSH = 0,
    ComingStyle_PRESENT
} ComingStyle;

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (BaseVC)

@property(nonatomic,strong)id requestParams;
@property(nonatomic,assign)ComingStyle pushOrPresent;

/// 强制推控制器，自定义是PUSH还是PRESENT展现控制器，如果自定义PUSH但是navigationController不存在，则换用PRESENT展现控制器
/// @param rootVC 从A控制器
/// @param toVC 推到B控制器
/// @param comingStyle 自定义展现的方式
/// @param presentationStyle 如果是PRESENT情况下的一个系统参数设定
/// @param requestParams A控制器—>B控制器，正向传值
/// @param successBlock 在推控制器之前，反向block(B控制器），以便对B控制器的一些自定义修改
/// @param animated 是否动画展现
+(instancetype)comingFromVC:(UIViewController *)rootVC
                       toVC:(UIViewController *)toVC
                comingStyle:(ComingStyle)comingStyle
          presentationStyle:(UIModalPresentationStyle)presentationStyle
              requestParams:(nullable id)requestParams
                    success:(MKDataBlock)successBlock
                   animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
