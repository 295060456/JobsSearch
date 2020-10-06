//
//  JobsSearchResultDataListTBVCell.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/6.
//

#import "JobsSearchResultDataListTBVCell.h"

@interface JobsSearchResultDataListTBVCell ()

@property(nonatomic,copy)MKDataBlock jobsSearchResultDataListTBVCellBlock;

@end

@implementation JobsSearchResultDataListTBVCell

+(instancetype)cellWith:(UITableView *)tableView{
    JobsSearchResultDataListTBVCell *cell = (JobsSearchResultDataListTBVCell *)[tableView dequeueReusableCellWithIdentifier:ReuseIdentifier];
    if (!cell) {
        cell = [[JobsSearchResultDataListTBVCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                      reuseIdentifier:ReuseIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.contentView.backgroundColor = RandomColor;
    }return cell;
}

+(CGFloat)cellHeightWithModel:(id _Nullable)model{
    return 50;
}

-(void)richElementsInCellWithModel:(id _Nullable)model{
    
}

-(void)actionBlockJobsSearchResultDataListTBVCell:(MKDataBlock)jobsSearchResultDataListTBVCellBlock{
    self.jobsSearchResultDataListTBVCellBlock = jobsSearchResultDataListTBVCellBlock;
}

@end
