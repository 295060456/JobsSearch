//
//  JobsSearchShowHotwordsTBVCell.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/4.
//

#import "JobsSearchShowHotwordsTBVCell.h"

@interface JobsSearchShowHotwordsTBVCell ()

@end

@implementation JobsSearchShowHotwordsTBVCell

+(instancetype)cellWith:(UITableView *)tableView{
    JobsSearchShowHotwordsTBVCell *cell = (JobsSearchShowHotwordsTBVCell *)[tableView dequeueReusableCellWithIdentifier:ReuseIdentifier];
    if (!cell) {
        cell = [[JobsSearchShowHotwordsTBVCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:ReuseIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }return cell;
}

+(CGFloat)cellHeightWithModel:(id _Nullable)model{
    return 50;
}

-(void)richElementsInCellWithModel:(id _Nullable)model{
    self.hotLabel.titleArr = (NSArray *)model;
}
#pragma mark —— lazyLoad
-(HotLabel *)hotLabel{
    if (!_hotLabel) {
        _hotLabel = HotLabel.new;
        @weakify(self)
        [_hotLabel actionBlockHotLabel:^(id data) {
            @strongify(self)
        }];
        [self.contentView addSubview:_hotLabel];
        [_hotLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _hotLabel;
}

@end
