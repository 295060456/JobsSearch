//
//  CustomTabBar.h
//  HitTesting
//
//  Created by mac on 2017/5/19.
//  Copyright © 2017年 flowyears. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"

// 超过 6 个 系统会变成更多，过不了审核
@interface JobsTabBar : UITabBar<BaseViewProtocol>

-(CGFloat)customTabBarOffsetHeight;

@end
