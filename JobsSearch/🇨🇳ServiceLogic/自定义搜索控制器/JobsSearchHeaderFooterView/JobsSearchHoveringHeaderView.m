//
//  JobsSearchHoveringHeaderView.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "JobsSearchHoveringHeaderView.h"

@interface JobsSearchHoveringHeaderView()

@property(nonatomic,assign)BOOL isOK;
@property(nonatomic,strong)UIButton *delBtn;
@property(nonatomic,copy)MKDataBlock jobsSearchHoveringHeaderViewBlock;

@end

@implementation JobsSearchHoveringHeaderView

-(instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier
                              withData:(id)data{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        if ([data isKindOfClass:NSString.class]) {
            NSString *str = (NSString *)data;
            self.titleLab.text = str;
            self.contentView.backgroundColor = kWhiteColor;
        }
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    if (!self.isOK) {
        self.titleLab.alpha = 1;
        if (self.isShowDelBtn) {
            self.delBtn.alpha = 1;
        }
        self.isOK = YES;
    }
}

-(void)actionBlockJobsSearchHoveringHeaderView:(MKDataBlock)jobsSearchHoveringHeaderViewBlock{
    _jobsSearchHoveringHeaderViewBlock = jobsSearchHoveringHeaderViewBlock;
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.textColor = kBlackColor;
        _titleLab.backgroundColor = kWhiteColor;
        _titleLab.font = kFontSize(20);
        _titleLab.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(10);
        }];
    }return _titleLab;
}

-(UIButton *)delBtn{
    if (!_delBtn) {
        _delBtn = UIButton.new;
        [_delBtn setImage:KIMG(@"垃圾箱")
                 forState:UIControlStateNormal];
        @weakify(self)
        [[_delBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIButton * _Nullable x) {
            @strongify(self)
            if (self.jobsSearchHoveringHeaderViewBlock) {
                self.jobsSearchHoveringHeaderViewBlock(x);
            }
        }];
        [self.contentView addSubview:_delBtn];
        [_delBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(16, 16));
            make.right.equalTo(self.contentView).offset(-10);
            make.centerY.equalTo(self.contentView);
        }];
    }return _delBtn;
}

@end
