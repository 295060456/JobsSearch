//
//  UIView+BackgroundLabel.m
//  Casino
//
//  Created by Jobs on 2021/12/6.
//

#import "UIView+BackgroundLabel.h"

@implementation UIView (BackgroundLabel)

static char *UIView_BackgroundLabel_backgroundLabel = "UIView_BackgroundLabel_backgroundLabel";
@dynamic backgroundLabel;

-(UILabel *)backgroundLabel{
    UILabel *BackgroundLabel = objc_getAssociatedObject(self, UIView_BackgroundLabel_backgroundLabel);
    if (!BackgroundLabel) {
        BackgroundLabel = UILabel.new;
        BackgroundLabel.userInteractionEnabled = YES;
        [self addSubview:BackgroundLabel];
        [self sendSubviewToBack:BackgroundLabel];
        [BackgroundLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        objc_setAssociatedObject(self,
                                 UIView_BackgroundLabel_backgroundLabel,
                                 BackgroundLabel,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }return BackgroundLabel;
}

-(void)setBackgroundLabel:(UILabel *)backgroundLabel{
    objc_setAssociatedObject(self,
                             UIView_BackgroundLabel_backgroundLabel,
                             backgroundLabel,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
