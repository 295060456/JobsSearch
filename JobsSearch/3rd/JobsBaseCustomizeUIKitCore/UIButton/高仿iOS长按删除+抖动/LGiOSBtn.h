//
//  LGiOSBtn.h
//  My_BaseProj
//
//  Created by hello on 2019/7/4.
//  Copyright © 2019 Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadingImage.h"
#import "UIView+Chain.h"
#import "MacroDef_Cor.h"

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

@class LGiOSBtn;

@protocol DZDeleteButtonDelegate <NSObject>

@optional

- (void)deleteButtonRemoveSelf:(LGiOSBtn *_Nonnull)button;

@end

NS_ASSUME_NONNULL_BEGIN
//hidden 的 权限优先级 > alpha
@interface LGiOSBtn : UIButton
// 是否抖动
@property(nonatomic,assign,getter=isShaking)BOOL shaking;
// 右上角的按钮，
@property(nonatomic,strong)UIImageView *iconBtn;
@property(nonatomic,weak)id<DZDeleteButtonDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
