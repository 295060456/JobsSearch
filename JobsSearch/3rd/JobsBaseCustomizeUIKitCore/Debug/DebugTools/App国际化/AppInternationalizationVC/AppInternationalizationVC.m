//
//  AppInternationalizationVC.m
//  Casino
//
//  Created by Jobs on 2021/11/19.
//

#import "AppInternationalizationVC.h"

@interface AppInternationalizationVC ()
// UI
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UITableViewHeaderFooterView *userHeaderView;
// Data
@property(nonatomic,strong)NSMutableArray <NSString *>*dataMutArr;

@end

@implementation AppInternationalizationVC

- (void)dealloc{
    NSLog(@"Running self.class = %@;NSStringFromSelector(_cmd) = '%@';__FUNCTION__ = %s", self.class, NSStringFromSelector(_cmd),__FUNCTION__);
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)loadView{
    [super loadView];
    self.setupNavigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = Internationalization(@"App language switch");
    self.gk_navTitleColor = kBlueColor;
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
/// 刷新本界面，且2秒后退出
-(void)refreshAndBack{
    // 刷新本界面
    if (self.dataMutArr.count) {
        _dataMutArr = nil;
    }
    [self.tableView reloadData];
    @jobs_weakify(self)
    DispathdDelaySth(2.0, [weak_self backBtnClickEvent:nil]);
}
/// 接收通知并相应的方法
- (void)languageSwitchNotification:(NSNotification *)notification{
    NSLog(@"通知传递过来的 = %@",notification.object);
}

#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return KWidth(44);
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        return;
    }
    for (UITableViewCell *acell in tableView.visibleCells) {
        acell.accessoryType = acell == cell ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    }
    
    [NSObject setAppLanguageAtIndexPath:indexPath byNotificationName:nil];// 设置App语言环境并发送全局通知LanguageSwitchNotification
    [NSObject changeTabBarItemTitle:indexPath];//【App语言国际化】更改UITabBarItem的标题
    
    [self refreshAndBack];// 刷新本界面，且2秒后退出
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [UITableViewCell cellWithTableView:tableView];
    /// 适配iOS 13夜间模式/深色外观(Dark Mode)
    cell.backgroundColor = [UIColor xy_createWithLightColor:UIColor.whiteColor darkColor:UIColor.whiteColor];
    UIViewModel *viewModel = UIViewModel.new;
    viewModel.text = self.dataMutArr[indexPath.row];
    
    [cell richElementsInCellWithModel:viewModel];
    
    {
        //    用户没有自己设置的语言，则跟随手机系统
        if (![CLLanguageManager userLanguage].length) {
            cell.accessoryType = indexPath.row == 0 ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
        } else {
            if ([NSBundle isChineseLanguage]) {
                if (indexPath.row == 1) {
                    cell.accessoryType = UITableViewCellAccessoryCheckmark;
                } else {
                    cell.accessoryType = UITableViewCellAccessoryNone;
                }
            } else {
                if (indexPath.row == 2) {
                    cell.accessoryType = UITableViewCellAccessoryCheckmark;
                } else {
                    cell.accessoryType = UITableViewCellAccessoryNone;
                }
            }
        }
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return [UITableViewHeaderFooterView heightWithModel:nil];
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView hideSeparatorLineAtLast:indexPath
                                  cell:cell];
}

- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView *headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:NSStringFromClass(UITableViewHeaderFooterView.class)];
    [headerView richElementsInViewWithModel:nil];
//    @weakify(self)
    [headerView actionViewBlock:^(id data) {
//        @strongify(self)
    }];return headerView;
}
#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.new;
        _tableView.backgroundColor = AppMainCor_02;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//        _tableView.scrollEnabled = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.userHeaderView;
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
            make.top.equalTo(self.gk_navigationBar.mas_bottom);
            make.left.right.bottom.equalTo(self.view);
        }];
    }return _tableView;
}

-(UITableViewHeaderFooterView *)userHeaderView{
    if (!_userHeaderView) {
        _userHeaderView = UITableViewHeaderFooterView.new;
        _userHeaderView.frame = [UITableViewHeaderFooterView viewFrameWithModel:nil];
        [_userHeaderView richElementsInViewWithModel:nil];
        @weakify(self)
        [_userHeaderView actionViewBlock:^(id data) {
            @strongify(self)
        }];
    }return _userHeaderView;
}

-(NSMutableArray<NSString *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        
        [_dataMutArr addObject:Internationalization(@"By System")];
        [_dataMutArr addObject:Internationalization(@"Chinese")];
        [_dataMutArr addObject:Internationalization(@"English")];
        
    }return _dataMutArr;
}

@end
