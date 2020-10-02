//
//  JobsSearchNonHoveringHeaderView.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "JobsSearchNonHoveringHeaderView.h"

@interface JobsSearchNonHoveringHeaderView ()

@property(nonatomic,assign)BOOL isOK;

@end

@implementation JobsSearchNonHoveringHeaderView

- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier
                               withData:(id)data{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        if ([data isKindOfClass:NSString.class]) {
            NSString *str = (NSString *)data;
            self.titleLab.text = str;
        }
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    if (!self.isOK) {
        self.titleLab.alpha = 1;
        self.isOK = YES;
    }
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.textColor = kBlackColor;
        _titleLab.backgroundColor = kWhiteColor;
        _titleLab.font = kFontSize(10);
        _titleLab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.equalTo(self);
            make.left.equalTo(self).offset(10);
        }];
    }return _titleLab;
}

@end
