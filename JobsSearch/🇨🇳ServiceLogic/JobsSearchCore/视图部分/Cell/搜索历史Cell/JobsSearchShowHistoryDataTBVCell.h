//
//  JobsSearchShowHistoryDataTBVCell.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "UITableViewCell+Margin.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchShowHistoryDataTBVCell : UITableViewCell

@property(nonatomic,assign)long indexRow;
@property(nonatomic,assign)long indexSection;

+(instancetype)cellWithTableView:(UITableView *)tableView;
+(CGFloat)cellHeightWithModel:(id _Nullable)model;
-(void)richElementsInCellWithModel:(id _Nullable)model;

@end

NS_ASSUME_NONNULL_END
