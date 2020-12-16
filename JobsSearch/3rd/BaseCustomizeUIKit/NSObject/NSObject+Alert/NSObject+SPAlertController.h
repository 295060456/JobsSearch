//
//  NSObject+SPAlertController.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/9/12.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AABlock.h"
#if __has_include(<SPAlertController/SPAlertController.h>)
#import <SPAlertController/SPAlertController.h>
#else
#import "SPAlertController.h"
#endif

//  pod 'SPAlertController'# https://github.com/SPStore/SPAlertController 深度定制AlertController

typedef enum : NSUInteger {
    NSObject_SPAlertControllerInitType_1 = 0,//alertControllerWithTitle/message/preferredStyle
    NSObject_SPAlertControllerInitType_2,//alertControllerWithTitle/message/preferredStyle/animationType
    NSObject_SPAlertControllerInitType_3,//alertControllerWithCustomAlertView/preferredStyle/animationType
    NSObject_SPAlertControllerInitType_4,//alertControllerWithCustomHeaderView/preferredStyle/animationType
    NSObject_SPAlertControllerInitType_5,//alertControllerWithCustomActionSequenceView/title/message/preferredStyle/animationType
    NSObject_SPAlertControllerInitType_6,//alertControllerWithTitle/message/preferredStyle/animationType
} NSObject_SPAlertControllerInitType;

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (SPAlertController)

+ (SPAlertController *)SPAlertControllerWithType:(NSObject_SPAlertControllerInitType)SPAlertControllerInitType
                                           title:(NSString *_Nullable)title
                                         message:(NSString *_Nullable)message
                                 customAlertView:(UIView *_Nullable)customAlertView
                                customHeaderView:(UIView *_Nullable)customHeaderView
                        customActionSequenceView:(UIView *_Nullable)customActionSequenceView
                                  preferredStyle:(SPAlertControllerStyle)preferredStyle
                                   animationType:(SPAlertAnimationType)animationType
                             alertActionTitleArr:(NSArray <NSString *> *)alertActionTitleArr
                             alertActionStyleArr:(NSArray <NSNumber *> *)alertActionStyleArr//SPAlertActionStyle
                                  alertBtnAction:(NSArray <NSString *> *)alertBtnActionArr
                                        targetVC:(UIViewController *)targetVC
                                    alertVCBlock:(TwoDataBlock)alertVCBlock;

@end

NS_ASSUME_NONNULL_END

/**
 
 [NSObject SPAlertControllerWithType:NSObject_SPAlertControllerInitType_1
                               title:nil
                             message:nil
                     customAlertView:nil
                    customHeaderView:nil
            customActionSequenceView:nil
                      preferredStyle:SPAlertControllerStyleActionSheet
                       animationType:SPAlertAnimationTypeFromBottom
                 alertActionTitleArr:@[@"继续关注",@"取消关注",@"取消"]
                 alertActionStyleArr:@[@(SPAlertActionStyleDefault),@(SPAlertActionStyleDestructive),@(SPAlertActionStyleCancel)]
                      alertBtnAction:@[@"continueToFocusOn",@"unfollow",@"cancel"]
                            targetVC:self
                        alertVCBlock:^(id data, id data2) {
     
 }];
 
 */
