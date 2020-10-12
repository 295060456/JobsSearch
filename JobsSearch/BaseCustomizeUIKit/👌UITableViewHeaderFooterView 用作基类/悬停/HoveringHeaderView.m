//
//  HoveringHeaderView.m
//  HeaderDemo
//
//  Created by zyd on 2018/6/22.
//  Copyright © 2018年 zyd. All rights reserved.
//

#import "HoveringHeaderView.h"

@interface HoveringHeaderView ()

@end

@implementation HoveringHeaderView

- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
//        self.result.alpha = 1;
    }return self;
}

-(void)richElementsInCellWithModel:(id _Nullable)model{
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.hoveringHeaderViewBlock) {
        self.hoveringHeaderViewBlock(@1);
    }
}

-(void)actionBlockHoveringHeaderView:(MKDataBlock)hoveringHeaderViewBlock{
    _hoveringHeaderViewBlock = hoveringHeaderViewBlock;
}
#pragma mark —— lazyLoad
-(UIControl *)result{
    if (!_result) {
        _result = UIControl.new;
        [self.contentView addSubview:_result];
        [_result mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _result;
}

@end
