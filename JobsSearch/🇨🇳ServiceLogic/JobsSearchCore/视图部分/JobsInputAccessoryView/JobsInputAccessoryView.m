//
//  JobsInputAccessoryView.m
//  JobsSearch
//
//  Created by Jobs on 2021/3/25.
//

#import "JobsInputAccessoryView.h"

@interface JobsInputAccessoryView ()

@end

@implementation JobsInputAccessoryView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}
//具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(id _Nullable)model{
    self.backgroundColor = kRedColor;
}
//具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(id _Nullable)model{
    return CGSizeMake(SCREEN_WIDTH, 50);
}
//具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGRect)viewFrameWithModel:(id _Nullable)model{
    return CGRectMake(0, 0, SCREEN_WIDTH, 50);
}

@end
