//
//  HoveringHeaderView.h
//  HeaderDemo
//
//  Created by zyd on 2018/6/22.
//  Copyright © 2018年 zyd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HoveringHeaderView : UITableViewHeaderFooterView

@property(nonatomic,strong)UIControl * _Nullable result;
@property(nonatomic,copy)MKDataBlock _Nullable hoveringHeaderViewBlock;

-(instancetype _Nullable)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier;
-(void)richElementsInCellWithModel:(id _Nullable)model;
-(void)actionBlockHoveringHeaderView:(MKDataBlock _Nullable)hoveringHeaderViewBlock;

@end

/* 使用示例
 CommentPopUpNonHoveringHeaderView *header = nil;
 
 {//第一种创建方式
     header = [[CommentPopUpNonHoveringHeaderView alloc]initWithReuseIdentifier:NSStringFromClass(CommentPopUpNonHoveringHeaderView.class)
                                                           withData:@(section)];


 
     [header.result addTarget:self
                       action:@selector(headerIsTapEvent:)
             forControlEvents:UIControlEventTouchUpInside];
 }
 
//    {//第二种创建方式
//        //viewForHeaderInSection 悬停与否
//        Class headerClass = CommentPopUpNonHoveringHeaderView.class;
//    //    Class headerClass = HoveringHeaderView.class;
//
//        header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass(headerClass)];
//    }
 */
