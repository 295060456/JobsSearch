//
//  JobsSearchSceneDelegate.h
//  DouYin
//
//  Created by Jobs on 2020/9/21.
//

#import <UIKit/UIKit.h>

@interface JobsSearchSceneDelegate : UIResponder <UIWindowSceneDelegate>

@property(nonatomic,strong)UIWindow *window;
@property(nonatomic,strong)UIWindowScene *windowScene;

+(instancetype)sharedInstance;

@end
