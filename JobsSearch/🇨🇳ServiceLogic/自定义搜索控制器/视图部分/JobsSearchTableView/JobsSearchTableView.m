//
//  JobsSearchTableView.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/6.
//

#import "JobsSearchTableView.h"

@interface JobsSearchTableView ()

@property(nonatomic,copy)MKDataBlock jobsSearchTableViewBlock;

@end

@implementation JobsSearchTableView

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    if (self.jobsSearchTableViewBlock) {
        self.jobsSearchTableViewBlock(@1);
    }
}
//tableView 的点击事件
-(void)actionBlockJobsSearchTableView:(MKDataBlock)jobsSearchTableViewBlock{
    self.jobsSearchTableViewBlock = jobsSearchTableViewBlock;
}

@end
