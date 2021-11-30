//
//  CustomTabBar.m
//  HitTesting
//
//  Created by mac on 2017/5/19.
//  Copyright © 2017年 flowyears. All rights reserved.
//

#import "JobsTabBar.h"
#import "LoadingImage.h"

@interface JobsTabBar ()

@property(nonatomic,strong)UIViewModel *viewModel;

@end

@implementation JobsTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = NO;//超出视图部分显示
        self.barStyle = UIBarStyleBlack;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
//具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    self.barTintColor = self.viewModel.bgCor;
    self.translucent = self.viewModel.isTranslucent;// 取消tabBar的透明效果
    // 有设定背景图片值优先走背景图片设定，背景颜色自动忽略
    if (self.viewModel.bgImage) {
        //self.viewModel.bgImage;//用系统的backgroundImage属性失灵
        self.backgroundImageView.image = isiPhoneX_series() ? KIMG(@"底部导航栏背景(刘海屏)") : KIMG(@"底部导航栏背景(非刘海屏)");
        NSLog(@"");
        return;
    }
    
    if (self.viewModel.bgCor) {
        self.backgroundColor = self.viewModel.bgCor;
    }
}

-(CGFloat)customTabBarOffsetHeight{
    return _viewModel.offsetHeight ? self.viewModel.offsetHeight : 0.f;
}
//-(UIView *)hitTest:(CGPoint)point
//         withEvent:(UIEvent *)event{
//    
//}
#pragma mark —— LazyLoad


@end
