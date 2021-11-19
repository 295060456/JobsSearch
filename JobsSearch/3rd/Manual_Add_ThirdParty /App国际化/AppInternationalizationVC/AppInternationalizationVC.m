//
//  AppInternationalizationVC.m
//  Casino
//
//  Created by Jobs on 2021/11/19.
//

#import "AppInternationalizationVC.h"

#import "UITableViewCell+BaseCellProtocol.h"
#import "UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.h"

@interface AppInternationalizationVC ()
// UI
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UITableViewHeaderFooterView *userHeaderView;
// Data
@property(nonatomic,strong)NSMutableArray <NSString *>*dataMutArr;
@property(nonatomic,strong)NSMutableArray <NSString *>*tabBarTitleMutArr;

@end

@implementation AppInternationalizationVC

- (void)dealloc{
    NSLog(@"Running self.class = %@;NSStringFromSelector(_cmd) = '%@';__FUNCTION__ = %s", self.class, NSStringFromSelector(_cmd),__FUNCTION__);
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)loadView{
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.setupNavigationBarHidden = YES;
    self.gk_navTitle = @"App国际化之应用内部切换语言";
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
/// 【App语言国际化】手动更改UITabBarItem的标题
-(void)changeTabBarItemTitle:(NSIndexPath *)indexPath{
    for (int i = 0; i < AppDelegate.sharedInstance.tabBarVC.childMutArr.count; i ++) {
        UIViewController *vc = AppDelegate.sharedInstance.tabBarVC.childMutArr[i];
        vc.tabBarItem.title = self.tabBarTitleMutArr[i];
    }
}
/// 设置App语言环境
-(void)setAppLanguageAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            [CLLanguageManager setUserLanguage:nil];
        }break;
        case 1:{
            [CLLanguageManager setUserLanguage:@"zh-Hans"];
        }break;
        case 2:{
            [CLLanguageManager setUserLanguage:@"en"];
        }break;
            
        default:
            break;
    }
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
    
    switch (indexPath.row) {
        case 0:{
            [CLLanguageManager setUserLanguage:nil];
        }break;
        case 1:{
            [CLLanguageManager setUserLanguage:@"zh-Hans"];
        }break;
        case 2:{
            [CLLanguageManager setUserLanguage:@"en"];
        }break;
            
        default:
            break;
    }
    
    [self setAppLanguageAtIndexPath:indexPath];
    [self changeTabBarItemTitle:indexPath];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [UITableViewCell cellWithTableView:tableView];
    
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
        [_dataMutArr addObject:NSLocalizedString(@"跟随系统", nil)];
        [_dataMutArr addObject:NSLocalizedString(@"中文", nil)];
        [_dataMutArr addObject:NSLocalizedString(@"英文", nil)];
    }return _dataMutArr;
}

-(NSMutableArray<NSString *> *)tabBarTitleMutArr{
    if (!_tabBarTitleMutArr) {
        _tabBarTitleMutArr = NSMutableArray.array;
        
        [_tabBarTitleMutArr addObject:[NSObject localStringWithKey:@"Home"]];
        [_tabBarTitleMutArr addObject:[NSObject localStringWithKey:@"XiMa"]];
        [_tabBarTitleMutArr addObject:[NSObject localStringWithKey:@"Recharge"]];
        [_tabBarTitleMutArr addObject:[NSObject localStringWithKey:@"CustomerService"]];
        [_tabBarTitleMutArr addObject:[NSObject localStringWithKey:@"MemberCenter"]];
        
    }return _tabBarTitleMutArr;
}

@end
