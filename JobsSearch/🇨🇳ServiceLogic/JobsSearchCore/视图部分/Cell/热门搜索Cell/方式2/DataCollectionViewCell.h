//
//  DataCollectionViewCell.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/22.
//

#import "BaseCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface DataCollectionViewCell : BaseCollectionViewCell

@property(nonatomic,assign)long indexRow;
@property(nonatomic,assign)long indexSection;

-(void)richElementsInCellWithModel:(id _Nullable)model;

@end

NS_ASSUME_NONNULL_END
