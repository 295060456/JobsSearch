//
//  JobsPageTBVCell.m
//  Casino
//
//  Created by Jobs on 2021/11/24.
//

#import "JobsPageTBVCell.h"
#import "NSObject+Extras.h"

@interface JobsPageTBVCell ()

@property(nonatomic,strong)UILabel *textLab;

@end

@implementation JobsPageTBVCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    JobsPageTBVCell *cell = (JobsPageTBVCell *)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier(self.class)];
    if (!cell) {
        cell = [[JobsPageTBVCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:reuseIdentifier(self.class)];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = cell.contentView.backgroundColor = kClearColor;
    }return cell;
}

-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    if (model) {
        self.textLab.textColor = model.textCor;
        self.textLab.text = model.text;
        self.textLab.font = model.font;
        self.textLab.backgroundColor = model.bgCor;
    //    self.imageView.image = (UIImage *)model[@"image"];
    }
}

+(CGFloat)cellHeightWithModel:(id _Nullable)model{
    return 0.f;
}

-(UILabel *)textLab{
    if (!_textLab) {
        _textLab = UILabel.new;
        [self.contentView addSubview:_textLab];
        [_textLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _textLab;
}

@end
