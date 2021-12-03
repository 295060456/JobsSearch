//
//  JobsUserInfoVC.h
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#import "BaseViewController.h"
#import "NSObject+Class.h"

NS_ASSUME_NONNULL_BEGIN
/// 查看外界传进来的对象的属性列表以及对应的值，特别是针对查看当前设备相关信息以及用户数据
@interface JobsShowObjInfoVC : BaseViewController
<
UITableViewDelegate
,UITableViewDataSource
>

@end

NS_ASSUME_NONNULL_END
