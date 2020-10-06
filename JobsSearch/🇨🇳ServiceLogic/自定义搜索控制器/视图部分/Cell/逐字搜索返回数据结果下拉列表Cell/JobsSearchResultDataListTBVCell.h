//
//  JobsSearchResultDataListTBVCell.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/6.
//

#import "TBVCell_style_01.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchResultDataListTBVCell : TBVCell_style_01

+(instancetype)cellWith:(UITableView *)tableView;
+(CGFloat)cellHeightWithModel:(id _Nullable)model;
-(void)richElementsInCellWithModel:(id _Nullable)model;

-(void)actionBlockJobsSearchResultDataListTBVCell:(MKDataBlock)jobsSearchResultDataListTBVCellBlock;

@end

NS_ASSUME_NONNULL_END
