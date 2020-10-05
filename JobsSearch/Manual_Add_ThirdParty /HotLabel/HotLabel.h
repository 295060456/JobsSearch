//
//  HotLabel.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HotLabel : UIView

@property(nonatomic,assign)CGFloat top;//第一个元素距离HotLabel上边的距离  同样也是下边距（对称性）
@property(nonatomic,assign)CGFloat left;//第一个元素距离HotLabel左边的距离 同样也是右边距（对称性）
@property(nonatomic,assign)CGFloat offsetXForEach;//控件之间的左右距离
@property(nonatomic,assign)CGFloat offsetYForEach;//控件之间的上下距离
@property(nonatomic,strong)UIFont *btnTitleFont;//按钮的字体
@property(nonatomic,strong)UIColor *btnTitleColor;//按钮的字体颜色
@property(nonatomic,strong)NSArray *titleArr;

-(void)actionBlockHotLabel:(MKDataBlock)hotLabelBlock;//点击事件传递
-(CGFloat)heightForHotLabel;//约束走完以后，计算得出的高，用于外界自适应

@end

NS_ASSUME_NONNULL_END
