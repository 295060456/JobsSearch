//
//  ViewController@3.m
//  My_BaseProj
//
//  Created by Administrator on 04/06/2019.
//  Copyright © 2019 Administrator. All rights reserved.
//

#import "ViewController@3.h"

@interface ViewController_3 ()<GKViewControllerPushDelegate>
{
    
}

@end

@implementation ViewController_3

- (void)dealloc {
    NSLog(@"Running self.class = %@;NSStringFromSelector(_cmd) = '%@';__FUNCTION__ = %s", self.class, NSStringFromSelector(_cmd),__FUNCTION__);
}

#pragma mark - Lifecycle
-(instancetype)init{
    if (self = [super init]) {
       
    }return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kBlueColor;
    
    self.gk_navTitle = @"Demo";
    self.gk_navTitleColor = [UIColor whiteColor];
    self.gk_navBackgroundColor = [UIColor redColor];
    self.gk_navShadowColor = [UIColor blackColor];
    self.gk_backStyle = GKNavigationBarBackStyleWhite;
    self.gk_navItemRightSpace = 0;
    
    self.gk_interactivePopDisabled = NO;
    self.gk_fullScreenPopDisabled = NO;
}

- (void)pushToNextViewController {
    NSLog(@"");
}

@end
