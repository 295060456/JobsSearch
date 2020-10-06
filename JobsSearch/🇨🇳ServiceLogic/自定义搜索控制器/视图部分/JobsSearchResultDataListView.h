//
//  JobsSearchResultDataListView.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchResultDataListView : UIView

@property(nonatomic,strong)NSMutableArray <NSString *>*searchResDataMutArr;

-(void)actionBlockJobsSearchResultDataListView:(MKDataBlock)jobsSearchResultDataListViewBlock;

@end

NS_ASSUME_NONNULL_END
