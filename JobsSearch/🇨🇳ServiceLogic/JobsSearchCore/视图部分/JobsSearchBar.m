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
>

@property(nonatomic,assign)BOOL isOK;
@property(nonatomic,copy)TwoDataBlock jobsSearchBarBlock;
@property(nonatomic,strong)UIImageView *imgView;

@end

@implementation JobsSearchBar

- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = HEXCOLOR(0xF9F9F9);
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
#pragma mark —— UITextFieldDelegate
//询问委托人是否应该在指定的文本字段中开始编辑
- (BOOL)textFieldShouldBeginEditing:(ZYTextField *)textField{
    if (self.jobsSearchBarBlock) {
        self.jobsSearchBarBlock(NSStringFromSelector(_cmd),textField.text);
    }return YES;
}
//告诉委托人在指定的文本字段中开始编辑
//- (void)textFieldDidBeginEditing:(UITextField *)textField{}
//询问委托人是否应在指定的文本字段中停止编辑
- (BOOL)textFieldShouldEndEditing:(ZYTextField *)textField{
    if (self.jobsSearchBarBlock) {
        self.jobsSearchBarBlock(NSStringFromSelector(_cmd),textField.text);
    }return YES;
}
//告诉委托人对指定的文本字段停止编辑
- (void)textFieldDidEndEditing:(ZYTextField *)textField{
    [textField isEmptyText];
    //用以区分是“取消”触发还是“搜索”触发
    if (self.cancelBtn.selected) {//来自“取消”
        textField.text = @"";
        self.cancelBtn.selected = NO;
    }else{//来自“搜索”
        //给定一个字符串 判定 是否在目标数组中，以达到数组元素单一性
        BOOL (^checkArrContainString)(NSArray <NSString *>*arr,
                                      NSString *string) = ^(NSArray <NSString *>*arr,
                                                            NSString *string){
                                          BOOL t = NO;
                                          for (NSString *str in arr) {
                                              if ([str isEqualToString:string]) {
                                                  t = YES;//只要有一个是重复的就赋值YES
                                              }
                                          }return t;
                                      };
        //存数据
        void (^storage)(NSString *storageID,
                        id content,
                        NSMutableArray *container) = ^(NSString *storageID,
                                                       id content,
                                                       NSMutableArray *container){
                            [container addObject:content];
                            SetUserDefaultKeyWithObject(storageID, container);
                            UserDefaultSynchronize;
                            NSLog(@"历史数据已存入");
        };
        
        if (![NSString isNullString:textField.text]) {
            //先取值进行对比
            NSArray *jobsSearchHistoryDataArr = (NSArray *)GetUserDefaultObjForKey(@"JobsSearchHistoryData");
            if (jobsSearchHistoryDataArr.count) {
                if (!checkArrContainString(jobsSearchHistoryDataArr,textField.text)) {
                    //目标数组不存在此字符串，允许存入
                    NSMutableArray *dataMutArr = [NSMutableArray arrayWithArray:jobsSearchHistoryDataArr];
                    storage(@"JobsSearchHistoryData",textField.text,dataMutArr);
                }
            }else{
                NSMutableArray *dataMutArr = NSMutableArray.array;
                storage(@"JobsSearchHistoryData",textField.text,dataMutArr);
            }
            
            if (self.jobsSearchBarBlock) {
                self.jobsSearchBarBlock(NSStringFromSelector(_cmd),textField.text);
            }
        }
    }
}
//告诉委托人对指定的文本字段停止编辑
//- (void)textFieldDidEndEditing:(UITextField *)textField
//reason:(UITextFieldDidEndEditingReason)reason{}
//询问委托人是否应该更改指定的文本
- (BOOL)textField:(ZYTextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string{
    
    NSLog(@"textField.text = %@",textField.text);
    NSLog(@"string = %@",string);
    
#warning 过滤删除最科学的做法
    
    NSString *resString = nil;
    //textField.text 有值 && string无值 ————> 删除操作
    if (![NSString isNullString:textField.text] && [NSString isNullString:string]) {
        
        if (textField.text.length == 1) {
            resString = @"";
        }else{
            resString = [textField.text substringToIndex:(textField.text.length - 1)];//去掉最后一个
        }
    }
    //textField.text 无值 && string有值 ————> 首字符输入
    if ([NSString isNullString:textField.text] && ![NSString isNullString:string]) {
        resString = string;
    }
    //textField.text 有值 && string有值 ————> 非首字符输入
    if (![NSString isNullString:textField.text] && ![NSString isNullString:string]) {
        resString = [textField.text stringByAppendingString:string];
    }

    NSLog(@"resString = %@",resString);
    
    if (self.jobsSearchBarBlock) {
        self.jobsSearchBarBlock(NSStringFromSelector(_cmd),resString);
    }return YES;
}
//询问委托人是否应删除文本字段的当前内容
//- (BOOL)textFieldShouldClear:(UITextField *)textField
//询问委托人文本字段是否应处理按下返回按钮
- (BOOL)textFieldShouldReturn:(ZYTextField *)textField{
    [self endEditing:YES];
    return YES;
}

-(void)actionBlockJobsSearchBar:(TwoDataBlock _Nullable)jobsSearchBarBlock{
    self.jobsSearchBarBlock = jobsSearchBarBlock;
}
#pragma mark —— lazyLoad
-(ZYTextField *)tf{
    if (!_tf) {
        _tf = ZYTextField.new;
        _tf.placeholder = @"请输入搜索内容";
        _tf.delegate = self;
        _tf.leftView = self.imgView;
        _tf.placeHolderAlignment = PlaceHolderAlignmentCenter;
        _tf.ZYtextColor = KPurpleColor;
        _tf.leftViewMode = UITextFieldViewModeAlways;
        _tf.backgroundColor = HEXCOLOR(0xFFFFFF);
        _tf.keyboardAppearance = UIKeyboardAppearanceAlert;
        _tf.returnKeyType = UIReturnKeySearch;
        [self addSubview:_tf];
//        _tf.isShowHistoryDataList = YES;//一句代码实现下拉历史列表：这句一定要写在addSubview之后，否则找不到父控件会崩溃
        _tf.frame = CGRectMake(10,
                               10,
                               MAINSCREEN_WIDTH - 20,
                               self.mj_h - 20);
        
        [UIView cornerCutToCircleWithView:_tf AndCornerRadius:2];
        [UIView colourToLayerOfView:_tf WithColour:kBlueColor AndBorderWidth:0.05];
    }return _tf;
}

-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = UIButton.new;
        _cancelBtn.backgroundColor = KGreenColor;
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:HEXCOLOR(0x0F81FE) forState:UIControlStateNormal];
        [self addSubview:_cancelBtn];
        _cancelBtn.frame = CGRectMake(MAINSCREEN_WIDTH - 10,
                                      10,
                                      0,
                                      0);
//        [UIView colourToLayerOfView:_cancelBtn WithColour:KGreenColor AndBorderWidth:1];
        [UIView cornerCutToCircleWithView:_cancelBtn AndCornerRadius:8];
        @weakify(self)
        [[_cancelBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self)
            x.selected = YES;
            if (self.jobsSearchBarBlock) {
                self.jobsSearchBarBlock(NSStringFromSelector(_cmd),self.tf.text);//cancelBtn
            }
        }];
    }return _cancelBtn;
}

-(UIImageView *)imgView{
    if (!_imgView) {
        _imgView = UIImageView.new;
        _imgView.image = KIMG(@"放大镜");
    }return _imgView;
}

@end
