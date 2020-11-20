//
//  JobsSearchHoveringHeaderView.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "ViewForTableViewHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchTableViewHeaderView : ViewForTableViewHeader

@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,assign)BOOL isShowDelBtn;

-(instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier
                              withData:(id _Nullable)data;

-(void)actionBlockJobsSearchHoveringHeaderView:(MKDataBlock _Nullable)jobsSearchHoveringHeaderViewBlock;

@end

NS_ASSUME_NONNULL_END
