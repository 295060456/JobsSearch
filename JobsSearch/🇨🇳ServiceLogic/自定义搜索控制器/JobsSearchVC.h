//
//  JobsSearchVC.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, HotSearchStyle) {
    HotSearchStyle_1,//横排自适应提行
    HotSearchStyle_2,//一行N列（默认N = 2），前三颜色突出表示
    HotSearchStyle_3,//暂时未定义
};

@interface JobsSearchVC : UIViewController

@property(nonatomic,assign)BOOL isOpenLetterCase;//模糊查询时，是否开启输入字母大小写检测？默认开启

@end

NS_ASSUME_NONNULL_END
