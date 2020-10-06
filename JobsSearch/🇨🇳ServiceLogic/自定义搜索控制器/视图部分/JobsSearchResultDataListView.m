//
//  JobsSearchResultDataListView.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/6.
//

#import "JobsSearchResultDataListView.h"
#import "JobsSearchResultDataListTBVCell.h"
#import "JobsSearchTableView.h"

@interface JobsSearchResultDataListView ()
<
UITableViewDelegate
,UITableViewDataSource
>

@property(nonatomic,strong)JobsSearchTableView *tableView;
@property(nonatomic,copy)MKDataBlock jobsSearchResultDataListViewBlock;
@property(nonatomic,assign)BOOL isOK;

@end

@implementation JobsSearchResultDataListView

-(void)dealloc{
    NSLog(@"Running self.class = %@;NSStringFromSelector(_cmd) = '%@';__FUNCTION__ = %s", self.class, NSStringFromSelector(_cmd),__FUNCTION__);
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = kBlueColor;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    if (!self.isOK) {
        self.tableView.alpha = 1;
        self.isOK = YES;
    }
}
#pragma mark —————————— UITableViewDelegate,UITableViewDataSource ——————————
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [JobsSearchResultDataListTBVCell cellHeightWithModel:nil];
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsSearchResultDataListTBVCell *cell = [JobsSearchResultDataListTBVCell cellWith:tableView];
    [cell richElementsInCellWithModel:nil];
    return cell;
}

-(void)actionBlockJobsSearchResultDataListView:(MKDataBlock)jobsSearchResultDataListViewBlock{
    self.jobsSearchResultDataListViewBlock = jobsSearchResultDataListViewBlock;
}

#pragma mark —— lazyLoad
-(JobsSearchTableView *)tableView{
    if (!_tableView) {
        _tableView = JobsSearchTableView.new;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = UIView.new;
        @weakify(self)
        [_tableView actionBlockJobsSearchTableView:^(id data) {
            @strongify(self)
            if (self.jobsSearchResultDataListViewBlock) {
                self.jobsSearchResultDataListViewBlock(data);
            }
        }];
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }return _tableView;
}

-searchResDataMutArr
//-searchResDataMutArr



@end
