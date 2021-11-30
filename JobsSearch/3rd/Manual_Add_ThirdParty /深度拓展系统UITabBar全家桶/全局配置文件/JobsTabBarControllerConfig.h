//
//  TabBarControllerConfig.h
//  TabbarItemLottie
//
//  Created by Jobs on 2020/10/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsTabBarControllerConfig : NSObject

@property(nonatomic,strong)UIViewController *vc;
@property(nonatomic,strong)NSString *title;//显示标题
@property(nonatomic,strong)NSString *lottieName;//有值则启用Lottie动画
@property(nonatomic,strong)UIImage *imageSelected; //选中状态的静态图
@property(nonatomic,strong)UIImage *imageUnselected;//未选中状态的静态图
@property(nonatomic,strong)UIColor *titleCorNormal;//未选中标题颜色
@property(nonatomic,strong)UIColor *titleCorSelected;//选中标题颜色
@property(nonatomic,strong)UIFont *fontNormal;//未选中字体
@property(nonatomic,strong)UIFont *fontSelected;//未选中字体
@property(nonatomic,assign)CGFloat humpOffsetY;//Y轴凸起的偏移量 传0就是不凸起
@property(nonatomic,assign)NSUInteger tag;

@end

NS_ASSUME_NONNULL_END
