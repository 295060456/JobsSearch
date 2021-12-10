//
//  UIView+BaseView.m
//  Casino
//
//  Created by Jobs on 2021/12/7.
//

#import "UIView+BaseView.h"

@implementation UIView (BaseView)

static char *UIView_BaseView_viewModel = "UIView_BaseView_viewModel";
@dynamic viewModel;

#pragma mark —— @property(nonatomic,strong)UIViewModel *viewModel;
-(UIViewModel *)viewModel{
    UIViewModel *ViewModel = objc_getAssociatedObject(self, UIView_BaseView_viewModel);
    if (!ViewModel) {
        ViewModel = UIViewModel.new;
        objc_setAssociatedObject(self,
                                 UIView_BaseView_viewModel,
                                 ViewModel,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }return ViewModel;
}

-(void)setViewModel:(UIViewModel *)viewModel{
    objc_setAssociatedObject(self,
                             UIView_BaseView_viewModel,
                             viewModel,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
