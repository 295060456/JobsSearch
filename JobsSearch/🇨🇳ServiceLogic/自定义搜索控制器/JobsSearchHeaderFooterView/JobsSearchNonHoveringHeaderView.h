//
//  JobsSearchNonHoveringHeaderView.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "NonHoveringHeaderView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchNonHoveringHeaderView : NonHoveringHeaderView

@property(nonatomic,strong)UILabel *titleLab;

- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier
                               withData:(id)data;

@end

NS_ASSUME_NONNULL_END
