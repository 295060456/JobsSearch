//
//  ViewController@2.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "ViewController@2.h"
#import "ViewController@3.h"

@interface ViewController_2 ()

@end

@implementation ViewController_2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KGreenColor;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{

    [UIViewController comingFromVC:self
                              toVC:ViewController_3.new
                       comingStyle:ComingStyle_PUSH
                 presentationStyle:[UIDevice currentDevice].systemVersion.doubleValue >= 13.0 ? UIModalPresentationAutomatic : UIModalPresentationFullScreen
                     requestParams:@"测试专用"
          hidesBottomBarWhenPushed:YES
                          animated:YES
                           success:^(id data) {
        
    }];
}


@end
