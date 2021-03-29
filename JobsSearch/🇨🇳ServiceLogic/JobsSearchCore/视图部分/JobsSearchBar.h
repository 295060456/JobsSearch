//
//  JobsSearchBar.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import <UIKit/UIKit.h>
#import "JobsInputAccessoryView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchBar : UIView<UITextFieldDelegate>

@property(nonatomic,strong)ZYTextField *textField;
@property(nonatomic,strong)UIButton *cancelBtn;
@property(nonatomic,strong)JobsInputAccessoryView *inputAccessoryView;

-(void)actionBlockJobsSearchBar:(TwoDataBlock _Nullable)jobsSearchBarBlock;//事件传递

@end

NS_ASSUME_NONNULL_END
