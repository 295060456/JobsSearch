//
//  HotLabel.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/4.
//

#import "JobsHotLabel.h"

@interface JobsHotLabel (){
    CGSize btnSize;
}

@property(nonatomic,strong)UIScrollView *scrollView;//所有控件加在这上面
@property(nonatomic,strong)NSMutableArray <UIButton *>*btnMutArr;
@property(nonatomic,assign)CGFloat X;//如果加载了下一个btn，那么直到他的尾巴处的x值，记住包含两边固有的间距进行比较
@property(nonatomic,assign)int row;
@property(nonatomic,assign)CGFloat hotLabelHeight;
@property(nonatomic,strong)UIViewModel *vm;

@end

@implementation JobsHotLabel

static dispatch_once_t dispatchOnce;
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = HEXCOLOR(0xFFFFFF);
        dispatchOnce = 0;
    }return self;
}
/// 必须有frame的前提下才会进行绘制
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    dispatch_once(&dispatchOnce, ^{
        self.scrollView.alpha = 1;
        [self createHotLabelWithArr:self.viewModelDataArr];
    });
}

-(void)createHotLabelWithArr:(NSArray <UIViewModel *>*)dataArr{
    if (dataArr.count) {
        for (UIViewModel *vm in dataArr) {
            self.vm = vm;
            // 其实item是button,因为button有相对于Label更为丰富的表现形式
            UIButton *btn = UIButton.new;
            [btn setTitle:vm.text
                 forState:UIControlStateNormal];
            [btn setBackgroundImage:vm.bgImage
                           forState:UIControlStateNormal];//直接赋值是不行的
            btn.titleLabel.font = vm.font;
            btn.titleLabel.textColor = vm.textCor;

            [UIView cornerCutToCircleWithView:btn andCornerRadius:vm.cornerRadius];
            
            if (CGSizeEqualToSize(vm.size, CGSizeZero)) {

                [btn buttonAutoFontByWidth];
                btnSize = [UILabel sizeWithText:vm.text
                                           font:vm.font
                                        maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
            }else{
                btnSize = vm.size;
            }
            
//            btn.size = btnSize;
            
            NSLog(@"btnSize.width = %f,btnSize.height = %f",btnSize.width,btnSize.height);
            
            @weakify(self)
            [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIButton * _Nullable x) {
                @strongify(self)
                NSLog(@"%@",x.titleLabel.text);
                if (self.viewBlock) {
                    self.viewBlock(x);//利用titleStr来进行判别
                }
            }];
            [self.scrollView addSubview:btn];
            if (self.btnMutArr.count) {
                self.X += btnSize.width + vm.offsetXForEach;
                NSLog(@"self.X = %f",self.X);
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    UIButton *lastBtn = (UIButton *)self.btnMutArr.lastObject;
                    if (self.X <= self.mj_w - self.left + vm.width) {//在本行排列
                        make.top.equalTo(lastBtn);
                        make.left.equalTo(lastBtn.mas_right).offset(vm.offsetXForEach);
                    }else{//换行从头排列
                        
                        self.row += 1;
                        self.X = self.left + btnSize.width;//换行了 self.X 重置
                        
                        make.top.equalTo(lastBtn.mas_bottom).offset(vm.offsetYForEach);
                        make.left.equalTo(self).offset(self.left);
                    }
                    
                    make.size.mas_equalTo(btnSize);
                    
                }];
            }else{//第一次
                self.X = self.left + (btnSize.width + vm.offsetXForEach);
                self.row = 1;
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self).offset(self.top);
                    make.left.equalTo(self).offset(self.left);
                    make.size.mas_equalTo(btnSize);
                }];
            }
            [self.btnMutArr addObject:btn];
        }
        
        self.hotLabelHeight = self.top * 2 + btnSize.height * self.row + (self.row - 1) * self.vm.offsetYForEach;
        
        NSLog(@"self.hotLabelHeight = %f",self.hotLabelHeight);
        NSLog(@"self.row = %d",self.row);
        
        [NSNotificationCenter.defaultCenter postNotificationName:reuseIdentifier(self.class)
                                                          object:nil
                                                        userInfo:@{@"hotLabelHeight":@(self.hotLabelHeight)}];
    }
}

-(CGFloat)heightForHotLabel{
    return self.hotLabelHeight;
}
#pragma mark —— lazyLoad
-(NSMutableArray<UIButton *> *)btnMutArr{
    if (!_btnMutArr) {
        _btnMutArr = NSMutableArray.array;
    }return _btnMutArr;
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = UIScrollView.new;
        [self addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }return _scrollView;
}

-(CGFloat)top{
    if (_top == 0) {
        _top = 5;
    }return _top;
}

-(CGFloat)left{
    if (_left == 0) {
        _left = 5;
    }return _left;
}

@end
