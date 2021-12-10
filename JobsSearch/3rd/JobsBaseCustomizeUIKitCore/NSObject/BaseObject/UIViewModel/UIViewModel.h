//
//  UIViewModel.h
//  Casino
//
//  Created by Jobs on 2021/11/19.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "MacroDef_App.h"
#import "MacroDef_Cor.h"
#import "MacroDef_Size.h"
#import "UIImage+Extras.h"

#if __has_include(<VerifyCode/NTESVerifyCodeManager.h>)
#import <VerifyCode/NTESVerifyCodeManager.h>
#else
#import "NTESVerifyCodeManager.h"
#endif

typedef enum : NSInteger {
    VerifyCodeInitFinish = 0,/// 验证码组件初始化完成
    VerifyCodeInitFailed,/// 验证码组件初始化出错
    VerifyCodeValidateFinish,/// 完成验证之后的回调
    VerifyCodeCloseWindow,/// 关闭验证码窗口后的回调
} NTESVerifyCodeManagerStyle;

NS_ASSUME_NONNULL_BEGIN

/// 本类是自定义类，但是是对系统类的仿写，目的是承接上下文数据 成一束，方便管理
@interface UIViewModel : NSObject

@property(nonatomic,strong)UIColor *textCor;//主字体颜色
@property(nonatomic,strong)UIColor *subTextCor;//副字体颜色
@property(nonatomic,strong)UIColor *bgCor;//背景颜色
@property(nonatomic,strong)UIFont *font;//字体
@property(nonatomic,strong)NSString *text;//主文字内容
@property(nonatomic,strong)NSString *subText;//副文字内容
@property(nonatomic,strong)UIImage *image;//图片
@property(nonatomic,strong)UIImage *bgImage;//背景图片
@property(nonatomic,assign)NSTextAlignment textAlignment;
@property(nonatomic,assign)NSLineBreakMode lineBreakMode;
@property(nonatomic,strong)NSAttributedString *attributedText API_AVAILABLE(ios(6.0));
@property(nonatomic,assign)CGFloat cornerRadius;//圆切角
@property(nonatomic,assign)CGFloat width;//宽
@property(nonatomic,assign)CGFloat height;//高
@property(nonatomic,assign)CGSize size;//二维尺寸
@property(nonatomic,assign)CGFloat offsetXForEach;//控件之间的左右距离
@property(nonatomic,assign)CGFloat offsetYForEach;//控件之间的上下距离
@property(nonatomic,assign)BOOL isTranslucent;//是否取消tabBar的透明效果
@property(nonatomic,assign)CGFloat offsetHeight;
@property(nonatomic,assign)CGFloat offsetWidth;
@property(nonatomic,strong)NSIndexPath *indexPath;
@property(nonatomic,assign)NSInteger section;
@property(nonatomic,assign)NSInteger row;
@property(nonatomic,assign)NSInteger item;
@property(nonatomic,strong)Class cls;
/// 网易云盾回调数据
@property(nonatomic,assign)NTESVerifyCodeManagerStyle ntesVerifyCodeManagerStyle;
@property(nonatomic,assign)BOOL ntesVerifyCodeFinishResult;
@property(nonatomic,strong)NSString *ntesVerifyCodeValidate;
@property(nonatomic,strong)NSString *ntesVerifyCodeMessage;
@property(nonatomic,strong)NSArray *ntesVerifyCodeError;
@property(nonatomic,assign)NTESVerifyCodeClose ntesVerifyCodeClose;

@end

NS_ASSUME_NONNULL_END
