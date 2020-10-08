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
    if ([model isKindOfClass:NSString.class]) {
        self.textLabel.text = (NSString *)model;
    }
}
//cell 点击事件方法
-(void)actionBlockJobsSearchResultDataListTBVCell:(MKDataBlock)jobsSearchResultDataListTBVCellBlock{
    self.jobsSearchResultDataListTBVCellBlock = jobsSearchResultDataListTBVCellBlock;
}
/*  主承载view实现了 touchesBegan
 *  那么 手势响应优先执行touchesBegan 而跳过代理方法导致 didSelectRowAtIndexPath 失效
 *  此时需要在cell子类里面重写touchesBegan方法以便触发
 */
-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    if (self.jobsSearchResultDataListTBVCellBlock) {
        self.jobsSearchResultDataListTBVCellBlock(self.textLabel.text);
    }
}

@end
