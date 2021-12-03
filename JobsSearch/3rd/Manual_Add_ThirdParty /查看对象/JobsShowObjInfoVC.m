//
//  JobsUserInfoVC.m
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#import "JobsShowObjInfoVC.h"

@interface JobsShowObjInfoVC ()
/// UI
@property(nonatomic,strong)UITableView *tableView;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation JobsShowObjInfoVC

- (void)dealloc{
    NSLog(@"Running self.class = %@;NSStringFromSelector(_cmd) = '%@';__FUNCTION__ = %s", self.class, NSStringFromSelector(_cmd),__FUNCTION__);
    //    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)loadView{
    [super loadView];

    if ([self.requestParams isKindOfClass:NSObject.class]) {
        NSObject *requestParams = (NSObject *)self.requestParams;
        NSMutableArray <NSString *>*propertyList = requestParams.printPropertyList;
        for (NSString *propertyName in propertyList) {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.text = propertyName;
            viewModel.subText = [requestParams valueForKey:propertyName];
            viewModel.textCor = UIColor.blueColor;
            viewModel.subTextCor = UIColor.redColor;
            [self.dataMutArr addObject:viewModel];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.setupNavigationBarHidden = YES;
    self.view.backgroundColor = KYellowColor;
    self.gk_navTitle = @"用户信息展示";
    self.gk_navTitleColor = UIColor.blackColor;
    self.tableView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [BaseTableViewCell cellHeightWithModel:Nil];
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseTableViewCell *cell = [BaseTableViewCell cellWithTableView:tableView];
    [cell richElementsInCellWithModel:self.dataMutArr[indexPath.row]];
    return cell;
}
#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.new;
        _tableView.backgroundColor = AppMainCor_02;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = UIView.new;
        _tableView.separatorColor = HEXCOLOR(0xEEEEEE);
        //        {
        //            MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
        //            refreshConfigHeader.stateIdleTitle = @"下拉可以刷新";
        //            refreshConfigHeader.pullingTitle = @"下拉可以刷新";
        //            refreshConfigHeader.refreshingTitle = @"松开立即刷新";
        //            refreshConfigHeader.willRefreshTitle = @"刷新数据中";
        //            refreshConfigHeader.noMoreDataTitle = @"下拉可以刷新";
        //
        //            MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
        //            refreshConfigFooter.stateIdleTitle = @"";
        //            refreshConfigFooter.pullingTitle = @"";
        //            refreshConfigFooter.refreshingTitle = @"";
        //            refreshConfigFooter.willRefreshTitle = @"";
        //            refreshConfigFooter.noMoreDataTitle = @"";
        //
        //            self.refreshConfigHeader = refreshConfigHeader;
        //            self.refreshConfigFooter = refreshConfigFooter;
        //
        //            _tableView.mj_header = self.mjRefreshNormalHeader;
        //            _tableView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
        //        }
        
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (self.setupNavigationBarHidden && self.gk_statusBarHidden) {// 系统、GK均隐藏
                make.edges.equalTo(self.view);
            }else{
                if (!self.setupNavigationBarHidden && self.gk_statusBarHidden) {// 用系统的导航栏
                    make.top.equalTo(self.view).offset(NavigationBarAndStatusBarHeight(nil));
                }
                
                if (self.setupNavigationBarHidden && !self.gk_statusBarHidden) {// 用GK的导航栏
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                }
                
                make.left.right.bottom.equalTo(self.view);
            }
        }];
    }return _tableView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
    }return _dataMutArr;
}

@end
