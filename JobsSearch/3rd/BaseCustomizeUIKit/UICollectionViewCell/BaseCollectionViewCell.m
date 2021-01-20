//
//  CollectionViewCell.m
//  UBallLive
//
//  Created by Jobs on 2020/10/18.
//

#import "BaseCollectionViewCell.h"
#import "UICollectionViewCell+ShakeAnimation.h"

@interface BaseCollectionViewCell ()

@end

@implementation BaseCollectionViewCell
//由具体的子类进行覆写
+(CGSize)cellSizeWithModel:(id _Nullable)model{
    return CGSizeZero;
}
//由具体的子类进行覆写
-(void)richElementsInCellWithModel:(id _Nullable)model{}

@end
