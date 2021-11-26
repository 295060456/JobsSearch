//
//  UIViewController+BackBtn.h
//  UBallLive
//
//  Created by Jobs on 2020/10/12.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "LoadingImage.h"
#import "MacroDef_Cor.h"
#import "BaseViewControllerProtocol.h"
#import "UIButton+ImageTitleSpacing.h"

#if __has_include(<GKNavigationBar/GKNavigationBar.h>)
#import <GKNavigationBar/GKNavigationBar.h>
#else
#import "GKNavigationBar.h"
#endif

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (BackBtn)<BaseViewControllerProtocol>

#pragma mark —— BaseVC+BackBtn
@property(nonatomic,strong)UIButton *backBtnCategory;
@property(nonatomic,strong)UIBarButtonItem *backBtnCategoryItem;
@property(nonatomic,strong)NSString *backBtnTitle;
#pragma mark —— 子类需要覆写
-(void)backBtnClickEvent:(UIButton *_Nullable)sender;

@end

NS_ASSUME_NONNULL_END
