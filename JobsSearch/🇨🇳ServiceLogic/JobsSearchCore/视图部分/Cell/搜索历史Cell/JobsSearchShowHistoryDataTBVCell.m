//
//  JobsSearchShowHistoryDataTBVCell.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "JobsSearchShowHistoryDataTBVCell.h"
#import "UITableViewCell+WhiteArrows.h"

@interface JobsSearchShowHistoryDataTBVCell ()

@end

@implementation JobsSearchShowHistoryDataTBVCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    JobsSearchShowHistoryDataTBVCell *cell = (JobsSearchShowHistoryDataTBVCell *)[tableView dequeueReusableCellWithIdentifier:ReuseIdentifier];
    if (!cell) {
        cell = [[JobsSearchShowHistoryDataTBVCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                       reuseIdentifier:ReuseIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.contentView.backgroundColor = RandomColor;
        cell.imageView.image = KIMG(@"时钟");
    }return cell;
}

+(CGFloat)cellHeightWithModel:(id _Nullable)model{
    return 50;
}

-(void)richElementsInCellWithModel:(id _Nullable)model{
    self.textLabel.text = model;
}

@end
