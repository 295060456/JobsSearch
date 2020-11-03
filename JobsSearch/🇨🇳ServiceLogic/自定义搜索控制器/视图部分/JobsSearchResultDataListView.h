//
//  JobsSearchResultDataListView.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/6.
//

#import <UIKit/UIKit.h>
#import "JobsSearchTableView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchResultDataListView : UIView

@property(nonatomic,strong)JobsSearchTableView *tableView;
@property(nonatomic,strong)NSMutableArray <NSString *>*searchResDataMutArr;
@property(nonatomic,assign)BOOL isEndScroll;//是否停止滚动

-(void)actionBlockJobsSearchResultDataListView:(MKDataBlock _Nullable)jobsSearchResultDataListViewBlock;

@end

NS_ASSUME_NONNULL_END
