//
//  BaseView.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2021/2/5.
//  Copyright © 2021 MonkeyKingVideo. All rights reserved.
//

#import "BaseView.h"

@interface BaseView ()

@end

@implementation BaseView
/**
 协议中是可以定义属性的
 但是只有对应的getter和setter方法，没有对应的成员变量
 而getter和setter就是操作的对应成员变量
 所以就无法调用getter或者setter 否则项目崩溃
 所以需要 @synthesize
 */
@synthesize viewSize = _viewSize;
@synthesize viewRect = _viewRect;
@synthesize viewWidth = _viewWidth;
@synthesize viewHeight = _viewHeight;

-(instancetype)init{
    if (self = [super init]) {
        
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
//具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(id _Nullable)model{}
//具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)viewWidthWithModel:(id _Nullable)model{
    return 0;
}
//具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)viewHeightWithModel:(id _Nullable)model{
    return 0;
}
//具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(id _Nullable)model{
    return CGSizeZero;
}
//具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGRect)viewFrameWithModel:(id _Nullable)model{
    return CGRectZero;
}
/*
    用于以此为基类的View层上所有数据的回调,当然也可以用NSObject分类的方法定位于：@interface NSObject (CallBackInfoByBlock)
 */
-(void)actionBlockBaseView:(MKDataBlock)baseViewBlock{
    self.baseViewBlock = baseViewBlock;
}
//数据（字符串）定宽
-(CGFloat)widthByData:(UIViewModel *_Nonnull)data{
    return [data.text getContentHeightOrWidthWithParagraphStyleLineSpacing:0
                                                     calcLabelHeight_Width:CalcLabelWidth
                                                                      font:data.font
                                              boundingRectWithHeight_Width:data.height];
}
//数据（字符串）定高
-(CGFloat)heightByData:(UIViewModel *_Nonnull)data{
    return [data.text getContentHeightOrWidthWithParagraphStyleLineSpacing:0
                                                     calcLabelHeight_Width:CalcLabelHeight
                                                                      font:data.font
                                              boundingRectWithHeight_Width:data.width];
}



@end
