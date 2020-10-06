//
//  JobsSearchBar.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchBar : UIView

@property(nonatomic,strong)ZYTextField *tf;
@property(nonatomic,strong)UIButton *cancelBtn;

-(void)actionBlockJobsSearchBar:(TwoDataBlock)jobsSearchBarBlock;//事件传递

@end

NS_ASSUME_NONNULL_END
