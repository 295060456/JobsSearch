//
//  UICollectionViewCell+Default.m
//  DouDong-II
//
//  Created by Jobs on 2021/3/11.
//

#import "UICollectionViewCell+Default.h"

@implementation UICollectionViewCell (Default)

+(instancetype)defaultCellWithCollectionView:(nonnull UICollectionView *)collectionView
                                forIndexPath:(nonnull NSIndexPath *)indexPath{
    id cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier(self.class)
                                                        forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerClass:self.class
           forCellWithReuseIdentifier:reuseIdentifier(self.class)];
        [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier(self.class)
                                                  forIndexPath:indexPath];
    }return cell;
}
//具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(id _Nullable)model{
    return CGSizeZero;
}
//具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(id _Nullable)model{}

@end
