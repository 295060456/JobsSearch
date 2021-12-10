//
//  UICollectionView+RegisterClass.m
//  UBallLive
//
//  Created by Jobs on 2020/10/31.
//

#import "UICollectionView+RegisterClass.h"

@implementation UICollectionView (RegisterClass)

-(void)registerCollectionViewClass{
    
    [self registerClass:CasinoGameCollectionReusableView.class
    forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
    withReuseIdentifier:reuseIdentifier(CasinoGameCollectionReusableView)];
    
    [self registerClass:UICollectionViewCell.class
        forCellWithReuseIdentifier:reuseIdentifier(UICollectionViewCell)];
    [self registerClass:BaseCollectionViewCell.class
        forCellWithReuseIdentifier:reuseIdentifier(BaseCollectionViewCell)];
    [self registerClass:CasinoTopCVCell.class
        forCellWithReuseIdentifier:reuseIdentifier(CasinoTopCVCell)];
    [self registerClass:CasinoBannerCVCell.class
        forCellWithReuseIdentifier:reuseIdentifier(CasinoBannerCVCell)];
    [self registerClass:CasinoMarqueeCVCell.class
        forCellWithReuseIdentifier:reuseIdentifier(CasinoMarqueeCVCell)];
    [self registerClass:CasinoGameCVCell.class
        forCellWithReuseIdentifier:reuseIdentifier(CasinoGameCVCell)];
    [self registerClass:CasinoGameCell.class
        forCellWithReuseIdentifier:reuseIdentifier(CasinoGameCell)];
    [self registerClass:JobsImageNumberViewCVCell.class
        forCellWithReuseIdentifier:reuseIdentifier(JobsImageNumberViewCVCell)];
}

@end
