//
//  UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.m
//  Casino
//
//  Created by Jobs on 2021/11/19.
//

#import "UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.h"

@implementation UITableViewHeaderFooterView (BaseTableViewHeaderFooterViewProtocol)

//具体由子类进行复写【数据定UI】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    if ([model isKindOfClass:UIViewModel.class]) {
        // TODO
        self.contentView.backgroundColor = kCyanColor;
    }
}
//具体由子类进行复写【数据定高】
+(CGFloat)heightWithModel:(id _Nullable)model{
    return KWidth(5);
}
//具体由子类进行复写【数据Frame】
+(CGRect)viewFrameWithModel:(id _Nullable)model{
    return CGRectMake(0,
                      0,
                      SCREEN_WIDTH,
                      KWidth(5));
}

@end
