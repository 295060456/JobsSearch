//
//  DataCollectionViewCell.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/22.
//

#import "DataCollectionViewCell.h"

@interface DataCollectionViewCell ()

@property(nonatomic,strong)UILabel *serialNumLab;
@property(nonatomic,strong)UILabel *contentLab;
@property(nonatomic,strong)NSString *serialStr;
@property(nonatomic,strong)NSString *contentStr;
@property(nonatomic,strong)UIColor *serialNumLabBGCor;

@end

@implementation DataCollectionViewCell

-(void)dealloc {
    NSLog(@"Running self.class = %@;NSStringFromSelector(_cmd) = '%@';__FUNCTION__ = %s", self.class, NSStringFromSelector(_cmd),__FUNCTION__);
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kWhiteColor;
        self.contentView.backgroundColor = kWhiteColor;
    }return self;
}

-(void)richElementsInCellWithModel:(id _Nullable)model{
    self.serialStr = [NSString stringWithFormat:@"%ld",self.indexRow + 1];
    self.contentStr = model;
    switch (self.indexRow) {
        case 0:{
            self.serialNumLabBGCor = RGBCOLOR(245, 58, 50);
        }break;
        case 1:{
            self.serialNumLabBGCor = RGBCOLOR(255, 115, 38);
        }break;
        case 2:{
            self.serialNumLabBGCor = RGBCOLOR(253, 198, 48);
        }break;
        default:{
            self.serialNumLabBGCor = RGBCOLOR(232, 232, 232);
        }break;
    }
    self.serialNumLab.alpha = 1;
    self.contentLab.alpha = 1;
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    NSLog(@"");
//    return self;
//}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"");
}

#pragma mark —— lazyLoad
-(UILabel *)serialNumLab{
    if (!_serialNumLab) {
        _serialNumLab = UILabel.new;
        _serialNumLab.text = self.serialStr;
        _serialNumLab.textAlignment = NSTextAlignmentCenter;
        _serialNumLab.textColor = kWhiteColor;
        _serialNumLab.backgroundColor = self.serialNumLabBGCor;
        [self.contentView addSubview:_serialNumLab];
        [_serialNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.left.equalTo(self.contentView).offset(10);
            make.centerY.equalTo(self.contentView);
        }];
        [UIView cornerCutToCircleWithView:_serialNumLab AndCornerRadius:3];
    }return _serialNumLab;
}

-(UILabel *)contentLab{
    if (!_contentLab) {
        _contentLab = UILabel.new;
        _contentLab.text = self.contentStr;
        _contentLab.textColor = KLightGrayColor;
        [self.contentView addSubview:_contentLab];
        [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.serialNumLab);
            make.left.equalTo(self.serialNumLab.mas_right).offset(5);
        }];
    }return _contentLab;
}

@end
