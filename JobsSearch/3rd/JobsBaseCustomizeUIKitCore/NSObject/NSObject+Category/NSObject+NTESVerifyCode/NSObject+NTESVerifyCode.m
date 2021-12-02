//
//  NSObject+NTESVerifyCode.m
//  Casino
//
//  Created by Jobs on 2021/12/2.
//

#import "NSObject+NTESVerifyCode.h"

@implementation NSObject (NTESVerifyCode)

static char *NSObject_NTESVerifyCode_ntesVerifyCodeManager = "NSObject_NTESVerifyCode_ntesVerifyCodeManager";
@dynamic ntesVerifyCodeManager;
/// 开启网易云盾
-(void)openVerifyCodeView:(UIView *_Nullable)topView{
    /// 在某些情况下必须传入topView，否则报错1004，创建失败
    if (topView) {
        [self.ntesVerifyCodeManager openVerifyCodeView:topView];
    }else{
        [self.ntesVerifyCodeManager openVerifyCodeView];
    }
}
/// 关闭网易云盾
-(void)closeVerifyCodeView{    
    [self.ntesVerifyCodeManager closeVerifyCodeView];
}
#pragma mark —— @property (nonatomic,strong)NTESVerifyCodeManager *ntesVerifyCodeManager;
-(NTESVerifyCodeManager *)ntesVerifyCodeManager{
    NTESVerifyCodeManager *ntesVerifyCodeManager = objc_getAssociatedObject(self, NSObject_NTESVerifyCode_ntesVerifyCodeManager);
    
    if (!ntesVerifyCodeManager) {
        ntesVerifyCodeManager = NTESVerifyCodeManager.getInstance;
//        ntesVerifyCodeManager.lang = 
        ntesVerifyCodeManager.alpha = 0.7;
        ntesVerifyCodeManager.frame = CGRectNull;
        /// 每一种验证码对应不同的key,如若不对齐，否则报1004创建失败
        ntesVerifyCodeManager.mode = NTESVerifyCodeNormal;
        ntesVerifyCodeManager.delegate = self;
        ntesVerifyCodeManager.shouldCloseByTouchBackground = NO;
        [ntesVerifyCodeManager configureVerifyCode:NTESVerifyCodeKEY timeout:30.0];
        ntesVerifyCodeManager.closeButtonHidden = NO;
        
        objc_setAssociatedObject(self,
                                 NSObject_NTESVerifyCode_ntesVerifyCodeManager,
                                 ntesVerifyCodeManager,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }return ntesVerifyCodeManager;
}

-(void)setNtesVerifyCodeManager:(NTESVerifyCodeManager *)ntesVerifyCodeManager{
    objc_setAssociatedObject(self,
                             NSObject_NTESVerifyCode_ntesVerifyCodeManager,
                             ntesVerifyCodeManager,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— NTESVerifyCodeManagerDelegate
/**
 * 验证码组件初始化完成
 */
-(void)verifyCodeInitFinish{
    UIViewModel *viewModel = UIViewModel.new;
    viewModel.ntesVerifyCodeManagerStyle = VerifyCodeInitFinish;
    if (self.viewBlock) self.viewBlock(viewModel);
}
/**
 * 验证码组件初始化出错
 *
 * @param error 错误信息
 */
-(void)verifyCodeInitFailed:(NSArray *)error{
    UIViewModel *viewModel = UIViewModel.new;
    viewModel.ntesVerifyCodeManagerStyle = VerifyCodeInitFailed;
    viewModel.ntesVerifyCodeError = error;
    if (self.viewBlock) self.viewBlock(viewModel);
}
/**
 * 完成验证之后的回调
 *
 * @param result 验证结果 BOOL:YES/NO
 * @param validate 二次校验数据，如果验证结果为false，validate返回空
 * @param message 结果描述信息
 *
 */
-(void)verifyCodeValidateFinish:(BOOL)result
                       validate:(NSString *)validate
                        message:(NSString *)message{
    UIViewModel *viewModel = UIViewModel.new;
    viewModel.ntesVerifyCodeManagerStyle = VerifyCodeValidateFinish;
    viewModel.ntesVerifyCodeFinishResult = result;
    viewModel.ntesVerifyCodeValidate = validate;
    viewModel.ntesVerifyCodeMessage = message;
    if (self.viewBlock) self.viewBlock(viewModel);
}
/**
 * 关闭验证码窗口后的回调
 *
 * @param close 关闭的类型
 */
-(void)verifyCodeCloseWindow:(NTESVerifyCodeClose)close{
    UIViewModel *viewModel = UIViewModel.new;
    viewModel.ntesVerifyCodeManagerStyle = VerifyCodeCloseWindow;
    viewModel.ntesVerifyCodeClose = close;
    if (self.viewBlock) self.viewBlock(viewModel);
}

@end
