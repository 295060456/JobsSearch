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
    @weakify(self)
    [JobsSearchVC ComingFromVC:weak_self
                   comingStyle:ComingStyle_PUSH
             presentationStyle:UIModalPresentationAutomatic
                 requestParams:nil
                       success:^(id data) {}
                      animated:YES];
}

@end
