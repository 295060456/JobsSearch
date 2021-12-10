//
//  TabbarVC.m
//  TabbarItemLottie
//
//  Created by 叶晓倩 on 2017/9/29.
//  Copyright © 2017年 xa. All rights reserved.
//

#import "JobsTabbarVC.h"

@interface JobsTabbarVC ()
// Data
@property(nonatomic,assign)BOOL isOpenPPBadge;
@property(nonatomic,assign)NSInteger subViewControllerCount;
@property(nonatomic,strong)NSMutableArray <UIView *>*UITabBarButtonMutArr;//UITabBarButton 是内部类 直接获取不到，需要间接获取

@property(nonatomic,strong)NSMutableArray <UIViewModel *>*pullListAutoSizeViewMutArr;

@end

@implementation JobsTabbarVC

- (void)dealloc{
    NSLog(@"Running self.class = %@;NSStringFromSelector(_cmd) = '%@';__FUNCTION__ = %s", self.class, NSStringFromSelector(_cmd),__FUNCTION__);
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
static JobsTabbarVC *static_tabbarVC = nil;
+(instancetype)sharedInstance{
    @synchronized(self){
        if (!static_tabbarVC) {
            static_tabbarVC = JobsTabbarVC.new;
        }
    }return static_tabbarVC;
}

-(void)loadView{
    [super loadView];
    self.delegate = self;
    self.isOpenScrollTabbar = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.isOpenScrollTabbar) {
        self.view.target = self;
        self.view.panGR.enabled = self.isOpenScrollTabbar;
//        @weakify(self)
        self.view.callbackBlock = ^(id weakSelf, id arg, UIGestureRecognizer *data3) {
//            @strongify(self)
            [weakSelf panGestureRecognizer:(UIPanGestureRecognizer *)data3];
        };
    }
    
    self.myTabBar.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.isHiddenNavigationBar = YES;
    [self UISetting];//最高只能在viewWillAppear，在viewDidLoad不出效果 self.tabBar.subviews为空
    [self 添加长按手势];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    self.myTabBar.height += self.myTabBar.customTabBarOffsetHeight;
    self.myTabBar.y = self.view.height - self.myTabBar.height;

//    [self ppBadge:YES];
}
// 开启/关闭 PPBadgeView的效果,至少在viewDidLayoutSubviews后有效
-(void)ppBadge:(BOOL)open{
    self.isOpenPPBadge = open;
    if (open) {
        for (UITabBarItem *item in self.tabBar.items) {
            if ([item.title isEqualToString:@"首页"]) {
                [item pp_addBadgeWithText:@"919+"];
    #pragma mark —— 动画
                [UIView animationAlert:item.badgeView];//图片从小放大
                shakerAnimation(item.badgeView, 2, 20);//重力弹跳动画效果
    //            [UIView 视图上下一直来回跳动的动画:item.badgeView];
            }
        }
    }
}
#pragma mark —— 一些私有方法
/// 判别是否有Lottie
/// @param index index
-(BOOL)judgeLottieWithIndex:(NSInteger)index{
    JobsTabBarControllerConfig *config = (JobsTabBarControllerConfig *)self.tabBarControllerConfigMutArr[index];
    return ![NSString isNullString:config.lottieName];
}

-(void)UISetting{
    for (int i = 0; i < self.tabBarControllerConfigMutArr.count; i++) {
        
//        viewController.view.backgroundColor = RandomColor;
        JobsTabBarControllerConfig *config = (JobsTabBarControllerConfig *)self.tabBarControllerConfigMutArr[i];
        // For Test
//        if ([self judgeLottieWithIndex:i]) {
//            [self addLottieImage:config.lottieName];// 有Lottie动画名，则优先创建Lottie动画
//        }
        
        UIViewController *viewController = self.childMutArr[i];
        viewController.title = config.title;
        viewController.tabBarItem = [JobsTabBarItem.alloc initWithConfig:config];
        
        if (config.humpOffsetY != 0) {
            //一般的图片
            [viewController.tabBarItem setImageInsets:UIEdgeInsetsMake(-config.humpOffsetY,
                                                                       0,
                                                                       -config.humpOffsetY / 2,
                                                                       0)];//修改图片偏移量，上下，左右必须为相反数，否则图片会被压缩
            [viewController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, 0)];//修改文字偏移量
        }

        if (![viewController isKindOfClass:UINavigationController.class]) {//防止UIImagePickerController崩
            BaseNavigationVC *nav = [BaseNavigationVC.alloc initWithRootViewController:viewController];
            nav.title = config.title;
            [self.childMutArr replaceObjectAtIndex:i withObject:nav];//替换元素，每个VC加Navigation
        }
    }
#warning 这句话走了以后 才会有self.tabBar
    self.viewControllers = self.childMutArr;
    
    for (UIView *subView in self.tabBar.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [UIView animationAlert:subView];//图片从小放大
            [self.UITabBarButtonMutArr addObject:subView];
        }
    }
    /// 根据config.lottieName 方法-config.lottieName:offsetY:lottieName:内部做了判空处理
    for (int i = 0; i < self.childMutArr.count; i++) {
        JobsTabBarControllerConfig *config = (JobsTabBarControllerConfig *)self.tabBarControllerConfigMutArr[i];
        [self.tabBar addLottieImage:i
                            offsetY:-config.humpOffsetY / 2
                         lottieName:config.lottieName];
    }
    
    //初始显示【具备Lottie播放条件才进行相关初始化操作】
    if (self.firstUI_selectedIndex < self.viewControllers.count) {
        self.selectedIndex = self.firstUI_selectedIndex;//初始显示哪个
        if ([self judgeLottieWithIndex:self.selectedIndex]) {
            [self.childMutArr[self.firstUI_selectedIndex] lottieImagePlay];
            [self.tabBar animationLottieImage:self.firstUI_selectedIndex];
        }
    }
}
#pragma mark —— 手势事件
-(void)LZBTabBarItemLongPress:(UILongPressGestureRecognizer *)longPressGR {
    switch (longPressGR.state) {
        case UIGestureRecognizerStatePossible:{
            NSLog(@"没有触摸事件发生，所有手势识别的默认状态");
        }break;
        case UIGestureRecognizerStateBegan:{
            //长按手势
            [self 长按手势做什么:longPressGR];
            NSLog(@"一个手势已经开始  但尚未改变或者完成时");
        }break;
        case UIGestureRecognizerStateChanged:{
            NSLog(@"手势状态改变");
        }break;
        case UIGestureRecognizerStateEnded:{// = UIGestureRecognizerStateRecognized
            NSLog(@"手势完成");
        }break;
        case UIGestureRecognizerStateCancelled:{
            NSLog(@"手势取消，恢复至Possible状态");
        }break;
        case UIGestureRecognizerStateFailed:{
            NSLog(@"手势失败，恢复至Possible状态");
        }break;
        default:
            break;
    }
}

-(void)长按手势做什么:(UILongPressGestureRecognizer *)longPressGR{
    
    if (self.isFeedbackGenerator) {
        [NSObject feedbackGenerator];//震动反馈
    }
    
    [JobsPullListAutoSizeView initWithTargetView:self.UITabBarButtonMutArr[longPressGR.view.tag]
                                      dataMutArr:self.pullListAutoSizeViewMutArr];
}

- (void)panGestureRecognizer:(UIPanGestureRecognizer *)pan{
    if (self.transitionCoordinator) {
        return;
    }
    
    if (pan.state == UIGestureRecognizerStateBegan ||
        pan.state == UIGestureRecognizerStateChanged){
        [self beginInteractiveTransitionIfPossible:pan];
    }
}

-(void)beginInteractiveTransitionIfPossible:(UIPanGestureRecognizer *)sender{
    CGPoint translation = [sender translationInView:self.view];
    if (translation.x > 0.f && self.selectedIndex > 0) {
        self.selectedIndex --;
    }else if (translation.x < 0.f && self.selectedIndex + 1 < self.viewControllers.count) {
        self.selectedIndex ++;
    }
}

-(void)添加长按手势{
    for (UIView *subView in self.UITabBarButtonMutArr) {
        subView.tag = [self.UITabBarButtonMutArr indexOfObject:subView];

        subView.numberOfTouchesRequired = 1;//手指数
        subView.minimumPressDuration = 1;
        subView.target = self;
        subView.longPressGR.enabled = YES;
//        @weakify(self)
        subView.callbackBlock = ^(id weakSelf,
                                  id arg,
                                  UIGestureRecognizer *data3) {
//            @strongify(self)
            [weakSelf LZBTabBarItemLongPress:(UILongPressGestureRecognizer *)data3];
        };
    }
}
#pragma mark —— UITabBarDelegate 监听TabBarItem点击事件
- (void)tabBar:(UITabBar *)tabBar
 didSelectItem:(UITabBarItem *)item {

    if ([self.tabBar.items containsObject:item]) {
        NSInteger index = [self.tabBar.items indexOfObject:item];
        NSLog(@"当前点击：%ld",(long)index);
        
        if ([self judgeLottieWithIndex:self.selectedIndex]) {
            [self.tabBar animationLottieImage:(int)index];
        }
        
        if (self.isFeedbackGenerator) {
            [NSObject feedbackGenerator];
        }
        
        if (self.isPlaySound) {
            [NSObject playSoundWithFileName:@"Sound.wav"];
        }

        if (self.isShakerAnimation) {
            shakerAnimation(item.badgeView, 2, 20);//重力弹跳动画效果
        }
        
        if (self.isOpenPPBadge) {
            [item pp_increase];
        }
        
        if (self.isAnimationAlert) {
            UIView *UITabBarButton = self.UITabBarButtonMutArr[index];
            [UIView animationAlert:UITabBarButton];//图片从小放大
        }
    }
}
#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController
shouldSelectViewController:(UIViewController *)viewController {
    
    NSInteger index = [self.childMutArr indexOfObject:viewController];
    if ([viewController isKindOfClass:UIViewController.class] &&
        [self judgeLottieWithIndex:index]) {
        [viewController lottieImagePlay];
    }return YES;
}

- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
           animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                             toViewController:(UIViewController *)toVC{
    // 打开注释 可以屏蔽点击item时的动画效果
//    if (self.panGestureRecognizer.state == UIGestureRecognizerStateBegan || self.panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        NSArray *viewControllers = tabBarController.viewControllers;
        if ([viewControllers indexOfObject:toVC] > [viewControllers indexOfObject:fromVC]) {
            return [[TransitionAnimation alloc] initWithTargetEdge:UIRectEdgeLeft];
        }
        else {
            return [[TransitionAnimation alloc] initWithTargetEdge:UIRectEdgeRight];
        }
//    }
//    else{
//        return nil;
//    }
}

- (id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController
                     interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    if (self.view.panGR.state == UIGestureRecognizerStateBegan ||
        self.view.panGR.state == UIGestureRecognizerStateChanged) {
        return [[TransitionController alloc] initWithGestureRecognizer:self.view.panGR];
    }else {
        return nil;
    }
}
#pragma mark —— lazyLoad
-(JobsTabBar *)myTabBar{
    if (!_myTabBar) {
        _myTabBar = JobsTabBar.new;
        _myTabBar.backgroundImage = KIMG(@"底部导航栏背景(刘海屏)");
        _myTabBar.backgroundColor = UIColor.yellowColor;
        
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.bgCor = kWhiteColor;
        viewModel.bgImage = isiPhoneX_series() ? KIMG(@"底部导航栏背景(刘海屏)") : KIMG(@"底部导航栏背景(非刘海屏)");
        viewModel.isTranslucent = NO;
        viewModel.offsetHeight = KWidth(5);

        [_myTabBar richElementsInViewWithModel:viewModel];
        
        [self setValue:_myTabBar
                forKey:@"tabBar"];//KVC 进行替换
        NSLog(@"");
    }return _myTabBar;
}

-(JobsSuspendBtn *)suspendBtn{
    if (!_suspendBtn) {
        _suspendBtn = JobsSuspendBtn.new;
        [_suspendBtn setImage:KIMG(@"旋转")
                     forState:UIControlStateNormal];
        _suspendBtn.isAllowDrag = NO;//悬浮效果必须要的参数
        BtnClickEvent(_suspendBtn, [self.suspendBtn startRotateAnimation];);
        self.view.vc = weak_self;
        [self.view addSubview:_suspendBtn];
        _suspendBtn.frame = CGRectMake(KWidth(80),
                                       KWidth(100),
                                       KWidth(50),
                                       KWidth(50));
        [UIView cornerCutToCircleWithView:_suspendBtn
                          andCornerRadius:KWidth(25)];
    }return _suspendBtn;
}

-(NSMutableArray<UIView *> *)UITabBarButtonMutArr{
    if (!_UITabBarButtonMutArr) {
        _UITabBarButtonMutArr = NSMutableArray.array;
    }return _UITabBarButtonMutArr;
}

-(NSMutableArray<UIViewController *> *)childMutArr{
    if (!_childMutArr) {
        _childMutArr = NSMutableArray.array;
    }return _childMutArr;
}

-(NSMutableArray<JobsTabBarControllerConfig *> *)tabBarControllerConfigMutArr{
    if (!_tabBarControllerConfigMutArr) {
        _tabBarControllerConfigMutArr = NSMutableArray.array;
    }return _tabBarControllerConfigMutArr;
}

-(NSMutableArray<UIViewModel *> *)pullListAutoSizeViewMutArr{
    if (!_pullListAutoSizeViewMutArr) {
        _pullListAutoSizeViewMutArr = NSMutableArray.array;
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.image = KIMG(@"");
            viewModel.text = @"111";
            [_pullListAutoSizeViewMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.image = KIMG(@"");
            viewModel.text = @"222";
            [_pullListAutoSizeViewMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.image = KIMG(@"");
            viewModel.text = @"333";
            [_pullListAutoSizeViewMutArr addObject:viewModel];
        }
        
    }return _pullListAutoSizeViewMutArr;
}

@end
