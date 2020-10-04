//
//  JobsSearchBar.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "JobsSearchBar.h"

@interface JobsSearchBar ()
<
UITextFieldDelegate
,CJTextFieldDeleteDelegate
>

@property(nonatomic,assign)BOOL isOK;
@property(nonatomic,copy)MKDataBlock jobsSearchBarBlock;

@end

@implementation JobsSearchBar

- (instancetype)init{
    if (self = [super init]) {
//        self.backgroundColor = KYellowColor;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    if (!self.isOK) {
        self.tf.alpha = 1;
        self.cancelBtn.alpha = 1;
        self.isOK = YES;
    }
}

//删除的话：系统先走textField:shouldChangeCharactersInRange:replacementString: 再走cjTextFieldDeleteBackward:
#pragma mark —— CJTextFieldDeleteDelegate
- (void)cjTextFieldDeleteBackward:(CJTextField *)textField{

}
#pragma mark —— UITextFieldDelegate
//询问委托人是否应该在指定的文本字段中开始编辑
- (BOOL)textFieldShouldBeginEditing:(ZYTextField *)textField{
    if (self.jobsSearchBarBlock) {
        self.jobsSearchBarBlock(NSStringFromSelector(_cmd));
    }return YES;
}
//告诉委托人在指定的文本字段中开始编辑
//- (void)textFieldDidBeginEditing:(UITextField *)textField{}
//询问委托人是否应在指定的文本字段中停止编辑
- (BOOL)textFieldShouldEndEditing:(ZYTextField *)textField{
    textField.isEditting = NO;
    if (self.jobsSearchBarBlock) {
        self.jobsSearchBarBlock(NSStringFromSelector(_cmd));
    }return YES;
}
//告诉委托人对指定的文本字段停止编辑
- (void)textFieldDidEndEditing:(ZYTextField *)textField{
    [textField isEmptyText];
    if (![NSString isNullString:textField.text]) {

    }
}
//告诉委托人对指定的文本字段停止编辑
//- (void)textFieldDidEndEditing:(UITextField *)textField
//reason:(UITextFieldDidEndEditingReason)reason{}
//询问委托人是否应该更改指定的文本
- (BOOL)textField:(ZYTextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string{
    return YES;
}
//询问委托人是否应删除文本字段的当前内容
//- (BOOL)textFieldShouldClear:(UITextField *)textField
//询问委托人文本字段是否应处理按下返回按钮
- (BOOL)textFieldShouldReturn:(ZYTextField *)textField{
    [self endEditing:YES];
    textField.isEditting = NO;
    return YES;
}

-(void)actionBlockJobsSearchBar:(MKDataBlock)jobsSearchBarBlock{
    _jobsSearchBarBlock = jobsSearchBarBlock;
}
#pragma mark —— lazyLoad
-(ZYTextField *)tf{
    if (!_tf) {
        _tf = ZYTextField.new;
        _tf.placeholder = @"请输入搜索内容";
        _tf.delegate = self;
        _tf.cj_delegate = self;
        _tf.backgroundColor = kBlackColor;
        _tf.returnKeyType = UIReturnKeyDone;
        _tf.keyboardAppearance = UIKeyboardAppearanceAlert;
        [self addSubview:_tf];
//        _tf.isShowHistoryDataList = YES;//一句代码实现下拉历史列表：这句一定要写在addSubview之后，否则找不到父控件会崩溃
        _tf.frame = CGRectMake(10,
                               10,
                               SCREEN_WIDTH - 20,
                               self.mj_h - 20);
        
        [UIView cornerCutToCircleWithView:_tf AndCornerRadius:8];
        [UIView colourToLayerOfView:_tf WithColour:kBlueColor AndBorderWidth:1];
    }return _tf;
}

-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = UIButton.new;
        _cancelBtn.backgroundColor = KGreenColor;
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self addSubview:_cancelBtn];
        _cancelBtn.frame = CGRectMake(SCREEN_WIDTH - 10,
                                      10,
                                      0,
                                      0);
        [UIView colourToLayerOfView:_cancelBtn WithColour:KGreenColor AndBorderWidth:1];
        [UIView cornerCutToCircleWithView:_cancelBtn AndCornerRadius:8];
        @weakify(self)
        [[_cancelBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self)
            if (self.jobsSearchBarBlock) {
                self.jobsSearchBarBlock(NSStringFromSelector(_cmd));//cancelBtn
            }
        }];
    }return _cancelBtn;
}

@end
