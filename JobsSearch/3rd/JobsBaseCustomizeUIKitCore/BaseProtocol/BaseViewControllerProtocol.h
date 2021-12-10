//
//  BaseVCProtocol.h
//  DouDong-II
//
//  Created by Jobs on 2021/3/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BaseProtocol.h"

typedef enum : NSUInteger {
    ComingStyle_PUSH = 0,
    ComingStyle_PRESENT
} ComingStyle;

NS_ASSUME_NONNULL_BEGIN

@protocol BaseViewControllerProtocol <BaseProtocol>

@optional

@property(nonatomic,strong)id requestParams;
@property(nonatomic,weak)UIViewController *rootVC;
@property(nonatomic,assign)ComingStyle pushOrPresent;

@end

NS_ASSUME_NONNULL_END
