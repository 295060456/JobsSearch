//
//  UBLCustomGifHeader.h
//  DouYin
//
//  Created by John on 2020/11/14.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AABlock.h"
#import "UIView+Measure.h"
#import "MJRefreshConfigModel.h"

#if __has_include(<ReactiveObjC/RACmetamacros.h>)
#import <ReactiveObjC/RACmetamacros.h>
#else
#import "RACmetamacros.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTScope.h>)
#import <ReactiveObjC/RACEXTScope.h>
#else
#import "RACEXTScope.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTKeyPathCoding.h>)
#import <ReactiveObjC/RACEXTKeyPathCoding.h>
#else
#import "RACEXTKeyPathCoding.h"
#endif

//#if __has_include(<ReactiveObjC/RACEXTRuntimeExtensions.h>)
//#import <ReactiveObjC/RACEXTRuntimeExtensions.h>
//#else
//#import "RACEXTRuntimeExtensions.h"
//#endif

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#if __has_include(<lottie-ios/Lottie.h>)
#import <lottie-ios/Lottie.h>
#else
#import "Lottie.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// 下拉刷新Lottie动画
@interface LOTAnimationMJRefreshHeader : MJRefreshGifHeader

@property(nonatomic,strong)MJRefreshConfigModel *refreshConfigModel;
@property(nonatomic,assign)CGSize lOTAnimationViewSize;

-(void)actionBlockRefreshHeader:(MKDataBlock)refreshHeaderBlock;//开始刷新和结束刷新可以做的动作

@end

NS_ASSUME_NONNULL_END
