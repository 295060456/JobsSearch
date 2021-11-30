//
//  JobsPullListTBVCell.m
//  TabbarItemLottie
//
//  Created by Jobs on 2020/10/15.
//

#import "JobsPullListTBVCell.h"

@interface JobsPullListTBVCell ()

@end

@implementation JobsPullListTBVCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    JobsPullListTBVCell *cell = (JobsPullListTBVCell *)[tableView dequeueReusableCellWithIdentifier:ReuseIdentifier];
    if (!cell) {
        cell = [[JobsPullListTBVCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:ReuseIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }return cell;
}

-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.textLabel.text = model.text;
    self.imageView.image = model.image;
}

@end
