//
//  JobsSearchShowHotwordsTBVCell.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/4.
//

#import "TBVCell_style_01.h"
#import "HotLabel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchShowHotwordsTBVCell : TBVCell_style_01

@property(nonatomic,strong)HotLabel *hotLabel;
@property(nonatomic,assign)long indexRow;
@property(nonatomic,assign)long indexSection;

+(instancetype)cellWithTableView:(UITableView *)tableView;
+(CGFloat)cellHeightWithModel:(id _Nullable)model;
-(void)richElementsInCellWithModel:(id _Nullable)model;
-(void)actionBlockJobsSearchShowHotwordsTBVCell:(MKDataBlock _Nullable)jobsSearchShowHotwordsTBVCellBlock;//点击了哪个Btn？

@end

NS_ASSUME_NONNULL_END
