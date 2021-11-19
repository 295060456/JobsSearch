//
//  BaseTableViewHeaderFooterViewProtocol.h
//  Casino
//
//  Created by Jobs on 2021/11/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BaseTableViewHeaderFooterViewProtocol <NSObject>

@optional

-(instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier;
//具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(id _Nullable)model;
//具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)heightWithModel:(id _Nullable)model;
//具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGRect)viewFrameWithModel:(id _Nullable)model;
/*
    用于以此为基类的actionBlockTableViewFooterView的子类的所有数据的回调,当然也可以用NSObject分类的方法定位于：@interface NSObject (CallBackInfoByBlock)
 */
-(void)actionBlockTableViewFooterView:(MKDataBlock _Nullable)tableViewFooterViewBlock;
-(void)actionBlockTableViewHeaderView:(MKDataBlock _Nullable)tableViewHeaderViewBlock;

@end

NS_ASSUME_NONNULL_END
