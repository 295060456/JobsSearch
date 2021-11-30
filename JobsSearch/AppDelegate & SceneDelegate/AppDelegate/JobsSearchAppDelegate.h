//
//  JobsSearchAppDelegate.h
//  DouYin
//
//  Created by Jobs on 2020/9/21.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "JobsTabbarVC.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"

@interface JobsSearchAppDelegate : UIResponder <UIApplicationDelegate>

@property(readonly,strong)NSPersistentCloudKitContainer *persistentContainer;
@property(nonatomic,assign)BOOL allowOrentitaionRotation;
@property(nonatomic,strong)JobsTabbarVC *tabBarVC;
@property(nonatomic,strong)UIWindow *window;//仅仅为了iOS 13 版本向下兼容而存在

+(instancetype)sharedInstance;
-(void)saveContext;

@end

#pragma clang diagnostic pop
