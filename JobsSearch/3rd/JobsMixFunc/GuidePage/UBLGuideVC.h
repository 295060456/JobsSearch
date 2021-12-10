//
//  UBLGuideVC.h
//  UBallLive
//
//  Created by hansong on 16/11/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol UBLGuideVCDelegate <NSObject>
- (void)didClickCancel;
@end

@interface UBLGuideVC : UIViewController
/// 代理
@property (weak,nonatomic) id<UBLGuideVCDelegate> mkDelegate;
@end

NS_ASSUME_NONNULL_END
