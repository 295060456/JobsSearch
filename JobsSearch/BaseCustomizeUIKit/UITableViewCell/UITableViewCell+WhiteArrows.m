//
//  UITableViewCell+WhiteArrows.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/7/26.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "UITableViewCell+WhiteArrows.h"

@implementation UITableViewCell (WhiteArrows)

static char *UITableViewCell_WhiteArrows_img = "UITableViewCell_WhiteArrows_img";
@dynamic img;

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    // 全局替换右侧箭头
    if (self.accessoryType == UITableViewCellAccessoryDisclosureIndicator) {
//        UIImageView *i = [[UIImageView alloc] initWithImage:KIMG(@"WhiteRightArrow")];
        
        UIButton *btn = UIButton.new;
        [btn setBackgroundImage:self.img
                       forState:UIControlStateNormal];
        @weakify(self)
        [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self)
            NSLog(@"kakakaka");
        }];
        
        self.accessoryView = btn;
    }
}
#pragma mark —— @property(nonatomic,strong)UIImage *img;
-(void)setImg:(UIImage *)img{
    objc_setAssociatedObject(self,
                             UITableViewCell_WhiteArrows_img,
                             img,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIImage *)img{
    UIImage *image = objc_getAssociatedObject(self, UITableViewCell_WhiteArrows_img);
    if (!image) {
        image = KIMG(@"WhiteRightArrow");
        objc_setAssociatedObject(self,
                                 UITableViewCell_WhiteArrows_img,
                                 image,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }return image;
}

@end
