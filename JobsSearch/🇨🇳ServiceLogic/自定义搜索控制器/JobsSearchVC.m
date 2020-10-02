//
//  JobsSearchVC.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "JobsSearchVC.h"

#import "JobsSearchBar.h"
#import "JobsSearchHoveringHeaderView.h"
#import "JobsSearchNonHoveringHeaderView.h"
#import "JobsSearchShowHistoryDataTBVCell.h"

@interface JobsSearchVC ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JobsSearchBar *jobsSearchBar;

@property(nonatomic,strong)NSMutableArray *sectionTitleMutArr;
//@property(nonatomic,strong)NSMutableArray *sectionTitleMutArr;

@end

@implementation JobsSearchVC

- (void)dealloc {
    NSLog(@"Running self.class = %@;NSStringFromSelector(_cmd) = '%@';__FUNCTION__ = %s", self.class, NSStringFromSelector(_cmd),__FUNCTION__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KLightGrayColor;
    self.isBackBtnBlackorWhite = YES;
    self.gk_navLeftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backBtnCategory];
    self.gk_navTitle = @"hah";
    [self hideNavLine];
    self.tableView.alpha = 1;
    [self.view bringSubviewToFront:self.gk_navigationBar];
}
#pragma mark —————————— UITableViewDelegate,UITableViewDataSource ——————————
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }else if (indexPath.section == 1){
        return [JobsSearchShowHistoryDataTBVCell cellHeightWithModel:nil];
    }else{}
    return 0;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsSearchShowHistoryDataTBVCell *cell = [JobsSearchShowHistoryDataTBVCell cellWith:tableView];
    cell.index = indexPath.row;
    [cell richElementsInCellWithModel:nil];
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionTitleMutArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return 80;
}

-(UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{

    Class headerClass = self.isHoveringHeaderView ? JobsSearchHoveringHeaderView.class : JobsSearchNonHoveringHeaderView.class;
    UIView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass(headerClass)];
    return header;
}
//实现以下方法,以替换系统默认的右侧小箭头
- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.img = KIMG(@"删除");
    @weakify(self)
    [cell customAccessoryView:^(id data) {
        @strongify(self)
        JobsSearchShowHistoryDataTBVCell *cell = (JobsSearchShowHistoryDataTBVCell *)data;
        NSLog(@"MMM - %ld",cell.index);
    }];
}
#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.new;
        _tableView.backgroundColor = kRedColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableHeaderView = self.jobsSearchBar;
        _tableView.tableFooterView = UIView.new;

        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            if (self.gk_navBarAlpha) {
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
            }else{
                make.top.equalTo(self.view.mas_top);
            }
            
            if ([SceneDelegate sharedInstance].customSYSUITabBarController.lzb_tabBarHidden) {
                make.bottom.equalTo(self.view.mas_bottom);
            }else{
                extern CGFloat LZB_TABBAR_HEIGHT;
                make.bottom.equalTo(self.view.mas_bottom).offset(-LZB_TABBAR_HEIGHT);
            }
        }];
    }return _tableView;
}

-(JobsSearchBar *)jobsSearchBar{
    if (!_jobsSearchBar) {
        _jobsSearchBar = JobsSearchBar.new;
        _jobsSearchBar.mj_size = CGSizeMake(SCREEN_WIDTH, 100);
    }return _jobsSearchBar;
}

-(NSMutableArray *)sectionTitleMutArr{
    if (!_sectionTitleMutArr) {
        _sectionTitleMutArr = NSMutableArray.array;
        [_sectionTitleMutArr addObject:@"热门搜索"];
        [_sectionTitleMutArr addObject:@"搜索历史"];
    }return _sectionTitleMutArr;
}

@end
