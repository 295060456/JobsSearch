//
//  AppInternationalizationVC.h
//  Casino
//
//  Created by Jobs on 2021/11/19.
//

#import "BaseViewController.h"
#import "MacroDef_Func.h"
#import "UIViewController+BackBtn.h"
#import "UITableViewCell+BaseCellProtocol.h"
#import "UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.h"

//#if __has_include(<XYColorOC/XYColorOC.h>)
//#import <XYColorOC/XYColorOC.h>
//#else
//#import "XYColorOC.h"
//#endif

#import "XYColorOC-umbrella.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppInternationalizationVC : BaseViewController
<
UITableViewDelegate
,UITableViewDataSource
>

@end

NS_ASSUME_NONNULL_END
