//
//  JobsSearchVC.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "BaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchVC : BaseVC

+ (instancetype)ComingFromVC:(UIViewController *)rootVC
                 comingStyle:(ComingStyle)comingStyle
           presentationStyle:(UIModalPresentationStyle)presentationStyle
               requestParams:(nullable id)requestParams
                     success:(MKDataBlock)block
                    animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
