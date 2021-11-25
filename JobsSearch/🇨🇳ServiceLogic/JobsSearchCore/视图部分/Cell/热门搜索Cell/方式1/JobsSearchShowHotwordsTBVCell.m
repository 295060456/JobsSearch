//
//  JobsSearchShowHotwordsTBVCell.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/4.
//

#import "JobsSearchShowHotwordsTBVCell.h"

@interface JobsSearchShowHotwordsTBVCell ()

@property(nonatomic,copy)MKDataBlock jobsSearchShowHotwordsTBVCellBlock;

@end

@implementation JobsSearchShowHotwordsTBVCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    JobsSearchShowHotwordsTBVCell *cell = (JobsSearchShowHotwordsTBVCell *)[tableView dequeueReusableCellWithIdentifier:ReuseIdentifier];
    if (!cell) {
        cell = [[JobsSearchShowHotwordsTBVCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:ReuseIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }return cell;
}

+(CGFloat)cellHeightWithModel:(id _Nullable)model{
    return 170;
}

-(void)richElementsInCellWithModel:(id _Nullable)model{
    self.jobsHotLabel.viewModelDataArr = (NSArray *)model;
}
//点击了哪个Btn？
-(void)actionBlockJobsSearchShowHotwordsTBVCell:(MKDataBlock _Nullable)jobsSearchShowHotwordsTBVCellBlock{
    self.jobsSearchShowHotwordsTBVCellBlock = jobsSearchShowHotwordsTBVCellBlock;
}
#pragma mark —— lazyLoad
-(JobsHotLabel *)jobsHotLabel{
    if (!_jobsHotLabel) {
        _jobsHotLabel = JobsHotLabel.new;
        @weakify(self)
        [_jobsHotLabel actionViewBlock:^(id data) {//点击了哪个Btn？
            @strongify(self)
            if (self.jobsSearchShowHotwordsTBVCellBlock) {
                self.jobsSearchShowHotwordsTBVCellBlock(data);
            }
        }];
        [self.contentView addSubview:_jobsHotLabel];
        [_jobsHotLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _jobsHotLabel;
}

@end
