//
//  TableViewAnimationKit.h
//  TableViewAnimationKit-OC
//
//  Created by alanwang on 2017/7/11.
//  Copyright © 2017年 com.cn.fql. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import "AABlock.h"
#import "MacroDef_Strong@Weak.h"

#import "TableViewAnimationKitConfig.h"

@interface TableViewAnimationKit : NSObject<UICollisionBehaviorDelegate>
/**
 class method to show the tableView animation

 @param animationType : animation type
 @param tableView : the tableView to show animation
 */
+(void)showWithAnimationType:(XSTableViewAnimationType)animationType
                    tableView:(nonnull UITableView *)tableView;
+(void)moveAnimationWithTableView:(nonnull UITableView *)tableView
                   animationBlock:(nullable NoResultBlock)animationBlock
                  completionBlock:(nullable MKDataBlock)completionBlock;
+(void)moveSpringAnimationWithTableView:(nonnull UITableView *)tableView
                         animationBlock:(nullable NoResultBlock)animationBlock
                        completionBlock:(nullable MKDataBlock)completionBlock;
+(void)alphaAnimationWithTableView:(nonnull UITableView *)tableView
                    animationBlock:(nullable NoResultBlock)animationBlock
                   completionBlock:(nullable MKDataBlock)completionBlock;
+(void)fallAnimationWithTableView:(nonnull UITableView *)tableView
                   animationBlock:(nullable NoResultBlock)animationBlock
                  completionBlock:(nullable MKDataBlock)completionBlock;
+(void)shakeAnimationWithTableView:(nonnull UITableView *)tableView
                    animationBlock:(nullable NoResultBlock)animationBlock
                   completionBlock:(nullable MKDataBlock)completionBlock;
+(void)overTurnAnimationWithTableView:(nonnull UITableView *)tableView
                       animationBlock:(nullable NoResultBlock)animationBlock
                      completionBlock:(nullable MKDataBlock)completionBlock;
+(void)toTopAnimationWithTableView:(nonnull UITableView *)tableView
                    animationBlock:(nullable NoResultBlock)animationBlock
                   completionBlock:(nullable MKDataBlock)completionBlock;
+(void)springListAnimationWithTableView:(nonnull UITableView *)tableView
                         animationBlock:(nullable NoResultBlock)animationBlock
                        completionBlock:(nullable MKDataBlock)completionBlock;
+(void)shrinkToTopAnimationWithTableView:(nonnull UITableView *)tableView
                          animationBlock:(nullable NoResultBlock)animationBlock;
+(void)layDownAnimationWithTableView:(nonnull UITableView *)tableView
                      animationBlock:(nullable NoResultBlock)animationBlock
                     completionBlock:(nullable MKDataBlock)completionBlock;
+(void)roteAnimationWithTableView:(nonnull UITableView *)tableView
                   animationBlock:(nullable NoResultBlock)animationBlock
                  completionBlock:(nullable MKDataBlock)completionBlock;


@end
