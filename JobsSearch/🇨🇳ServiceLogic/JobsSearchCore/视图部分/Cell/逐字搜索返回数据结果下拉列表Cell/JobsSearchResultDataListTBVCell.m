//
//  JobsSearchResultDataListTBVCell.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/6.
//

#import "JobsSearchResultDataListTBVCell.h"

@interface JobsSearchResultDataListTBVCell ()<UIGestureRecognizerDelegate>

@property(nonatomic,strong)UITapGestureRecognizer *tapGR;
@property(nonatomic,copy)MKDataBlock jobsSearchResultDataListTBVCellBlock;

@end

@implementation JobsSearchResultDataListTBVCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    JobsSearchResultDataListTBVCell *cell = (JobsSearchResultDataListTBVCell *)[tableView dequeueReusableCellWithIdentifier:ReuseIdentifier];
    if (!cell) {
        cell = [[JobsSearchResultDataListTBVCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                      reuseIdentifier:ReuseIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.contentView.backgroundColor = RandomColor;
        cell.imageView.image = KIMG(@"放大镜");
        cell.tapGR.enabled = YES;
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
#pragma mark —— UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}
//cell 点击事件方法
-(void)actionBlockJobsSearchResultDataListTBVCell:(MKDataBlock _Nullable)jobsSearchResultDataListTBVCellBlock{
    self.jobsSearchResultDataListTBVCellBlock = jobsSearchResultDataListTBVCellBlock;
}
/*  主承载view实现了 touchesBegan 或者手势响应
 *  那么 手势响应优先执行touchesBegan 或者手势响应 而跳过代理方法导致 didSelectRowAtIndexPath 失效
 *  此时需要在cell子类里面重写touchesBegan 或者手势响应 方法以便触发
 */
-(void)tapGRHandleSingleFingerAction:(UITapGestureRecognizer *_Nullable)sender{
    if (self.jobsSearchResultDataListTBVCellBlock) {
        self.jobsSearchResultDataListTBVCellBlock(self.textLabel.text);
    }
}
#pragma mark —— lazyLoad
-(UITapGestureRecognizer *)tapGR{//单击一下
    if (!_tapGR) {
        _tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                         action:@selector(tapGRHandleSingleFingerAction:)];
        _tapGR.numberOfTouchesRequired = 1; //手指数
        _tapGR.numberOfTapsRequired = 1; //tap次数
        _tapGR.delegate = self;
        [self addGestureRecognizer:self.tapGR];
    }return _tapGR;
}

@end
