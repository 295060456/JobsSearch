//
//  HotLabel.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/4.
//

#import "HotLabel.h"
#import "UILabel+Extra.h"

@interface HotLabel (){
    CGSize btnSize;
}

@property(nonatomic,copy)MKDataBlock hotLabelBlock;

@property(nonatomic,strong)UIScrollView *scrollView;//所有控件加在这上面
@property(nonatomic,strong)NSMutableArray <UIButton *>*btnMutArr;
@property(nonatomic,assign)BOOL isOK;
@property(nonatomic,assign)CGFloat X;//如果加载了下一个btn，那么直到他的尾巴处的x值，记住包含两边固有的间距进行比较
@property(nonatomic,assign)int row;
@property(nonatomic,assign)CGFloat hotLabelHeight;

@end

@implementation HotLabel

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = HEXCOLOR(0xFFFFFF);
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    if (!self.isOK) {
        self.scrollView.alpha = 1;
        [self createHotLabelWithArr:self.titleArr];
        self.isOK = YES;
    }
}

-(void)createHotLabelWithArr:(NSArray <NSString *>*)dataArr{
    if (dataArr.count) {
        for (NSString *titleStr in dataArr) {
            UIButton *btn = UIButton.new;
            [btn setTitle:titleStr
                 forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageWithColor:RandomColor] forState:UIControlStateNormal];//直接赋值是不行的
            btn.titleLabel.font = self.btnTitleFont;
            btn.titleLabel.textColor = self.btnTitleColor;
            [btn.titleLabel sizeToFit];
            btn.titleLabel.adjustsFontSizeToFitWidth = YES;
            [UIView cornerCutToCircleWithView:btn AndCornerRadius:3];
            
            btnSize = [UILabel sizeWithText:titleStr
                                       font:self.btnTitleFont
                                    maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
            
            @weakify(self)
            [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIButton * _Nullable x) {
                @strongify(self)
                NSLog(@"%@",x.titleLabel.text);
                if (self.hotLabelBlock) {
                    self.hotLabelBlock(x);//利用titleStr来进行判别
                }
            }];
            [self.scrollView addSubview:btn];
            if (self.btnMutArr.count) {
                self.X += btnSize.width + self.offsetXForEach;
                NSLog(@"self.X = %f",self.X);
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    UIButton *lastBtn = (UIButton *)self.btnMutArr.lastObject;
                    if (self.X <= self.mj_w - self.left) {//在本行排列
                        make.top.equalTo(lastBtn);
                        make.left.equalTo(lastBtn.mas_right).offset(self.offsetXForEach);
                    }else{//换行从头排列
                        
                        self.row += 1;
                        self.X = self.left + btnSize.width;//换行了 self.X 重置
                        
                        make.top.equalTo(lastBtn.mas_bottom).offset(self.offsetYForEach);
                        make.left.equalTo(self).offset(self.left);
                    }
                }];
            }else{//第一次
                self.X = self.left + (btnSize.width + self.offsetXForEach);
                self.row = 1;
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self).offset(self.top);
                    make.left.equalTo(self).offset(self.left);
                }];
            }
            [self.btnMutArr addObject:btn];
        }
        
        self.hotLabelHeight = self.top * 2 + btnSize.height * self.row + (self.row - 1) * self.offsetYForEach;
        NSLog(@"self.row = %d",self.row);
        
        [[NSNotificationCenter defaultCenter] postNotificationName:ReuseIdentifier
                                                            object:nil
                                                          userInfo:@{@"hotLabelHeight":@(self.hotLabelHeight)}];
    }
}

-(CGFloat)heightForHotLabel{
    return self.hotLabelHeight;
}

-(void)actionBlockHotLabel:(MKDataBlock)hotLabelBlock{
    _hotLabelBlock = hotLabelBlock;
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

-(CGFloat)offsetXForEach{
    if (_offsetXForEach == 0) {
        _offsetXForEach = 8;
    }return _offsetXForEach;
}

-(CGFloat)offsetYForEach{
    if (_offsetYForEach == 0) {
        _offsetYForEach = 8;
    }return _offsetYForEach;
}

-(UIFont *)btnTitleFont{
    if (!_btnTitleFont) {
        _btnTitleFont = kFontSize(20);
    }return _btnTitleFont;
}

-(UIColor *)btnTitleColor{
    if (!_btnTitleColor) {
        _btnTitleColor = kWhiteColor;
    }return _btnTitleColor;
}

@end
