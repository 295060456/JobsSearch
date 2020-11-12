//
//  JobsSearchResultDataListTBVCell.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/6.
//

#import "TBVCell_style_01.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchResultDataListTBVCell : TBVCell_style_01

+(instancetype)cellWithTableView:(UITableView *)tableView;
+(CGFloat)cellHeightWithModel:(id _Nullable)model;
-(void)richElementsInCellWithModel:(id _Nullable)model;

-(void)actionBlockJobsSearchResultDataListTBVCell:(MKDataBlock _Nullable)jobsSearchResultDataListTBVCellBlock;//cell 点击事件方法

@end

NS_ASSUME_NONNULL_END
