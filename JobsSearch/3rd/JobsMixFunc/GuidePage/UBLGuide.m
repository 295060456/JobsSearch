//
//  UBLGuide.m
//  UBallLive
//
//  Created by hansong on 16/11/20.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "UBLGuide.h"
#import "UBLGuideVC.h"
@interface UBLGuide()<UBLGuideVCDelegate>
@property(nonatomic,strong)UIWindow * window;
@end

@implementation UBLGuide
#pragma mark - 单例
static UBLGuide *instancdGuide = nil;
+(UBLGuide *)share{
    @synchronized (self) {
        if (!instancdGuide) {
            instancdGuide = [[UBLGuide alloc] init];
        }
    }
    return instancdGuide;
}
#pragma mark - 入口
-(void)scene:(UIWindowScene *)scene API_AVAILABLE(ios(13.0)){
    _window.windowScene = scene;
}
#pragma mark - 初始化
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupLaunchGuide];
    }
    return self;
}
#pragma mark - add
-(void)setupLaunchGuide{
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    #pragma mark - 加载 Gif ｜ 加载 图片
    UBLGuideVC *vc = [UBLGuideVC new];
    vc.mkDelegate = self;
    vc.view.backgroundColor = [UIColor clearColor];
    window.rootViewController = vc;
    window.rootViewController.view.userInteractionEnabled = YES;
    window.windowLevel = UIWindowLevelStatusBar + 1;
    window.hidden = NO;
    window.alpha = 1;
    _window = window;
}

#pragma mark - 移除
-(void)remove{
    if(_window){
        [_window.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            REMOVE_FROM_SUPERVIEW_SAFE(obj)
        }];
        _window.hidden = YES;
        _window = nil;
    }
}
#pragma mark - delegate
- (void)didClickCancel{
    [self remove];
}
@end
