//
//  JobsSearchVC.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "BaseVC.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JobsSearchItemStyle) {
    JobsSearchItemStyle_0,// 两竖列的列表的形式，前三用高亮显示
    JobsSearchItemStyle_1,// 随机色 混排
    JobsSearchItemStyle_2,// 3列表格形式
};

@interface JobsSearchVC : BaseVC

@property(nonatomic,assign)JobsSearchItemStyle searchItemStyle;
@property(nonatomic,assign)BOOL isHoveringHeaderView;
@property(nonatomic,assign)BOOL isOpenLetterCase;//模糊查询时，是否开启输入字母大小写检测？默认开启

@end

NS_ASSUME_NONNULL_END
