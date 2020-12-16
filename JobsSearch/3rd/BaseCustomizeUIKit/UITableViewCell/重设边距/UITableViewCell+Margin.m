//
//  UITableViewCell+Margin.m
//  JobsIM
//
//  Created by Jobs on 2020/11/13.
//

#import "UITableViewCell+Margin.h"

@implementation UITableViewCell (Margin)

static char *UITableViewCell_Margin_indexPath = "UITableViewCell_Margin_indexPath";
static char *UITableViewCell_Margin_marginX = "UITableViewCell_Margin_marginX";
static char *UITableViewCell_Margin_marginY = "UITableViewCell_Margin_marginY";

@dynamic indexPath;
@dynamic marginX;
@dynamic marginY;

//frame
-(void)setFrame:(CGRect)frame{
    frame.origin.x += self.marginX;
    frame.origin.y += self.marginY;
    frame.size.height -= self.marginY * 2;
    frame.size.width -= self.marginX * 2;
    [super setFrame:frame];
}
#pragma mark —— @property(nonatomic,strong)NSIndexPath *indexPath;
-(NSIndexPath *)indexPath{
    NSIndexPath *idxPath = objc_getAssociatedObject(self, UITableViewCell_Margin_indexPath);
    return idxPath;
}

-(void)setIndexPath:(NSIndexPath *)indexPath{
    objc_setAssociatedObject(self,
                             UITableViewCell_Margin_indexPath,
                             indexPath,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)CGFloat marginX;
-(CGFloat)marginX{
    CGFloat MarginX = [objc_getAssociatedObject(self, UITableViewCell_Margin_marginX) floatValue];
    return MarginX;
}

-(void)setMarginX:(CGFloat)marginX{
    objc_setAssociatedObject(self,
                             UITableViewCell_Margin_marginX,
                             [NSNumber numberWithBool:marginX],
                             OBJC_ASSOCIATION_ASSIGN);
}
#pragma mark —— @property(nonatomic,assign)CGFloat marginY;
-(CGFloat)marginY{
    CGFloat MarginY = [objc_getAssociatedObject(self, UITableViewCell_Margin_marginY) floatValue];
    return MarginY;
}

-(void)setMarginY:(CGFloat)marginY{
    objc_setAssociatedObject(self,
                             UITableViewCell_Margin_marginY,
                             [NSNumber numberWithBool:marginY],
                             OBJC_ASSOCIATION_ASSIGN);
}

@end
