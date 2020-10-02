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

- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier
                               withData:(id _Nullable)data;

@end

NS_ASSUME_NONNULL_END
