//
//  NavigationViewController.m
//  ShengAi
//
//  Created by 刘赓 on 2018/10/29.
//  Copyright © 2018年 刘赓. All rights reserved.
//

#import "BaseNavigationVC.h"

@interface BaseNavigationVC ()

@property(nonatomic,strong)NSShadow *shadow;

@end

@implementation BaseNavigationVC

- (void)dealloc {
    NSLog(@"Running self.class = %@;NSStringFromSelector(_cmd) = '%@';__FUNCTION__ = %s", self.class, NSStringFromSelector(_cmd),__FUNCTION__);
}

//+(UINavigationController *)rootNavigationController{}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        {
            self.navigationBar.translucent = NO;
            [self.navigationBar setBackgroundImage:KIMG(@"启动页SLOGAN")
                                     forBarMetrics:UIBarMetricsDefault];//仅仅是 navigationBar 背景
        //    [self.navigationBar setShadowImage:KIMG(@"启动页SLOGAN")];// 图片大了会全屏
        }
        
        {
            if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {//设置NavgationBar的背景图片
                [self.navigationBar setBarTintColor:kRedColor];//一般的业务是全局设置，因为一个App里面只有一个主题
                self.navigationBar.tintColor = kBlackColor;//系统的组件着色（返回按钮——箭头图标 和 上面的字）
            }
        }
        
        {
            self.navigationBar.titleTextAttributes = @{
                NSForegroundColorAttributeName:kBlackColor,
                NSShadowAttributeName:self.shadow,
                NSFontAttributeName:kFontSize(18)
            };//设置导航上的title显示样式
        }
    }return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated{
    if (self.viewControllers.count > 0) { // 不是根控制器
        viewController.hidesBottomBarWhenPushed = YES;//push 的时候把 tabBar 隐藏了
    }else{
        viewController.hidesBottomBarWhenPushed = NO;
    }
    [super pushViewController:viewController animated:animated];//只能写在后面
}

-(void)setupBarButtonItem:(UIViewController * __nonnull)vc
                    title:(NSString * __nullable)title
                 selector:(SEL __nonnull)selector{
    if (vc && selector) {
        UIBarButtonItem *editBarBtnItems = [[UIBarButtonItem alloc]initWithTitle:title
                                                                           style:UIBarButtonItemStylePlain
                                                                          target:self
                                                                          action:@selector(selector)];
        vc.navigationItem.rightBarButtonItem = editBarBtnItems;
    }
}
#pragma mark —— lazyLoad
-(NSShadow *)shadow{
    if (!_shadow) {
        _shadow = NSShadow.new;
        _shadow.shadowColor = COLOR_RGB(0,
                                        0,
                                        0,
                                        0.8);
        _shadow.shadowOffset = CGSizeZero;
    }return _shadow;
}



@end
