//
//  JobsSearchHoveringHeaderView.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "HoveringHeaderView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchHoveringHeaderView : HoveringHeaderView

@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,assign)BOOL isShowDelBtn;

-(instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier
                              withData:(id _Nullable)data;

-(void)actionBlockJobsSearchHoveringHeaderView:(MKDataBlock)jobsSearchHoveringHeaderViewBlock;

@end

NS_ASSUME_NONNULL_END
