//
//  BaseViewController.m
//  JobsSearch
//
//  Created by Jobs on 2020/12/1.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)dealloc{
    NSLog(@"Running self.class = %@;NSStringFromSelector(_cmd) = '%@';__FUNCTION__ = %s", self.class, NSStringFromSelector(_cmd),__FUNCTION__);
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

- (instancetype)init{
    if (self = [super init]) {
        
    }return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil {
    if(self = [super initWithNibName:nibNameOrNil
                              bundle:nibBundleOrNil]) {
        self.isHiddenNavigationBar = YES;
        self.setupNavigationBarHidden = YES;
    }return self;
}

-(void)loadView{
    [super loadView];
    self.currentPage = 1;
    self.backgroundImage = KIMG(@"洗码背景图");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.backgroundImage) {
        self.bgImageView.alpha = 1;
    }else{
        self.view.backgroundColor = kWhiteColor;
    }
    
    /*
     *  #pragma mark —— 全局配置 GKNavigationBar -(void)makeGKNavigationBarConfigure
     */
//    {
//        self.gk_navBackgroundColor = kWhiteColor;
//        self.gk_navTitleFont = [UIFont systemFontOfSize:18 weight:UIFontWeightMedium];
//        self.gk_navTitleColor = AppMainCor_01;
//        self.gk_backStyle = GKNavigationBarBackStyleBlack;
//        self.gk_navLineHidden = YES;
//    }
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    NotificationAdd(self, @selector(languageSwitchNotification:), LanguageSwitchNotification, nil);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%d",self.setupNavigationBarHidden);
    self.isHiddenNavigationBar = self.setupNavigationBarHidden;
    [self.navigationController setNavigationBarHidden:self.setupNavigationBarHidden animated:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
#ifdef DEBUG
//    [self ifEmptyData];// 网络异步数据刷新UI会在viewDidAppear以后执行viewWillLayoutSubviews、viewDidLayoutSubviews
#endif
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%d",self.setupNavigationBarHidden);
    self.isHiddenNavigationBar = self.setupNavigationBarHidden;
    [self.navigationController setNavigationBarHidden:self.setupNavigationBarHidden animated:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.view.mjRefreshTargetView.mj_footer.y = self.view.mjRefreshTargetView.contentSize.height;
}

-(void)setGKNav{
    self.gk_navTitle = self.viewModel.text;
    self.gk_navTitleColor = HEXCOLOR(0xD3B698);
    self.gk_navBackgroundColor = HEXCOLOR(0x564533);
    self.gk_navTitleFont = [UIFont systemFontOfSize:KWidth(18) weight:UIFontWeightRegular];
}
/**
 
 #  iOS 状态栏颜色的修改

 【全局修改】
  1、在Info.plist里面加入如下键值对：
     1.1、View controller-based status bar appearance : NO
     1.2、Status bar style : Light Content

  2、[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;// iOS 13 后方法被标注废弃

  1.2 和 2 任意选一个即可

 【局部修改】
  1、在Info.plist里面加入如下键值对：
  View controller-based status bar appearance ： YES //全局是NO、局部是YES
  2、@interface BaseNavigationVC : UINavigationController
     2.1、在 BaseNavigationVC.m里面写入：
     - (UIViewController *)childViewControllerForStatusBarStyle {
             return self.topViewController;
     }
     2.2、在具体的需要修改的VC.m里面写入：
     -(UIStatusBarStyle)preferredStatusBarStyle{
         return UIStatusBarStyleLightContent;
     }
 
 */
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
/*
    用于以此为基类的控制器上所有数据的回调,当然也可以用NSObject分类的方法定位于：@interface NSObject (CallBackInfoByBlock)
 */
-(void)actionBlockViewController:(MKDataBlock)viewControllerBlock{
    self.viewControllerBlock = viewControllerBlock;
}
#pragma mark —— UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
#pragma mark —— BaseProtocol
/// 接收通知并相应的方法【在分类或者基类中实现会屏蔽具体子类的相关实现】
-(void)languageSwitchNotification:(nonnull NSNotification *)notification{
    NSLog(@"通知传递过来的 = %@",notification.object);
}
#pragma mark —— lazyLoad
-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = UIImageView.new;
        _bgImageView.frame = self.view.bounds;
        _bgImageView.image = self.backgroundImage;
        _bgImageView.userInteractionEnabled = YES;
        self.view = _bgImageView;
    }return _bgImageView;
}

@end
