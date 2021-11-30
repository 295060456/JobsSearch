//
//  TabBarItem.m
//  TabbarItemLottie
//
//  Created by Jobs on 2020/10/14.
//

#import "JobsTabBarItem.h"

@interface JobsTabBarItem ()

@property(nonatomic,strong)JobsTabBarControllerConfig *tabBarControllerConfig;

@end

@implementation JobsTabBarItem

-(instancetype)initWithConfig:(JobsTabBarControllerConfig *)config{
    if (self = [super init]) {
        if (config) {
            self.tabBarControllerConfig = config;
            
            self.image = [config.imageUnselected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            self.selectedImage = [config.imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            self.title = config.title;
            
            [self setTitleTextAttributes:@{NSForegroundColorAttributeName: config.titleCorNormal}
                                forState:UIControlStateNormal];
            [self setTitleTextAttributes:@{NSForegroundColorAttributeName: config.titleCorSelected}
                                forState:UIControlStateSelected];
        }
    }return self;
}

@end
