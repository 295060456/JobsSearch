//
//  JobsSearchShowHistoryDataTBVCell.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "TBVCell_style_01.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchShowHistoryDataTBVCell : TBVCell_style_01

@property(nonatomic,assign)long indexRow;
@property(nonatomic,assign)long indexSection;

+(instancetype)cellWithTableView:(UITableView *)tableView;
+(CGFloat)cellHeightWithModel:(id _Nullable)model;
-(void)richElementsInCellWithModel:(id _Nullable)model;

@end

NS_ASSUME_NONNULL_END
