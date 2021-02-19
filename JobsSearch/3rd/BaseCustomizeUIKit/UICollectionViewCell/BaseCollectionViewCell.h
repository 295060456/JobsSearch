//
//  CollectionViewCell.h
//  UBallLive
//
//  Created by Jobs on 2020/10/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)NSIndexPath *idxPath;

+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath;
+(CGSize)cellSizeWithModel:(id _Nullable)model;// 由具体的子类进行覆写
-(void)richElementsInCellWithModel:(id _Nullable)model;// 由具体的子类进行覆写


@end

NS_ASSUME_NONNULL_END