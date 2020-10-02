//
//  UITableViewHeaderFooterView+Attribute.h
//  HeaderDemo
//
//  Created by zyd on 2018/6/22.
//  Copyright © 2018年 zyd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewHeaderFooterView (Attribute)

@property (weak, nonatomic) UITableView *tableView;
@property (assign, nonatomic) NSUInteger section;

@end
