//
//  ViewController@1.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "ViewController@1.h"
#import "JobsSearchVC.h"

@interface ViewController_1 ()

@property(nonatomic,strong)JobsSearchVC *jobsSearchVC;

@end

@implementation ViewController_1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KYellowColor;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{

    [UIViewController comingFromVC:self
                              toVC:JobsSearchVC.new
                       comingStyle:ComingStyle_PUSH
                 presentationStyle:[UIDevice currentDevice].systemVersion.doubleValue >= 13.0 ? UIModalPresentationAutomatic : UIModalPresentationFullScreen
                     requestParams:@{
                         @"Title":@"搜索功能",
//                         @"HotSearchStyle":@(HotSearchStyle_2)
                         @"HotSearchStyle":@(HotSearchStyle_1)
                     }
          hidesBottomBarWhenPushed:YES
                          animated:YES
                           success:^(id data) {
        
    }];
}

@end
