//
//  AppInternationalizationVC.h
//  Casino
//
//  Created by Jobs on 2021/11/19.
//

#import "BaseViewController.h"
#import "UIViewController+BackBtn.h"
#import "UITableViewCell+BaseCellProtocol.h"
#import "UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppInternationalizationVC : BaseViewController
<
UITableViewDelegate
,UITableViewDataSource
>

@end

NS_ASSUME_NONNULL_END
