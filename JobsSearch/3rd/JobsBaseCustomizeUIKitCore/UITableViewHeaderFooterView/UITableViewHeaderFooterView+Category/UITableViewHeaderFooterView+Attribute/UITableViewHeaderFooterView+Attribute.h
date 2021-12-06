//
//  UITableViewHeaderFooterView+Attribute.h
//  HeaderDemo
//
//  Created by zyd on 2018/6/22.
//  Copyright © 2018年 zyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UITableViewHeaderFooterView (Attribute)

@property(nonatomic,weak)UITableView *tableView;
@property(nonatomic,assign)NSUInteger section;

@end
