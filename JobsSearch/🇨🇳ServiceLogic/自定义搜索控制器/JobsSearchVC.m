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

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
#pragma mark —————————— UITableViewDelegate,UITableViewDataSource ——————————
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 50;
    }else if (indexPath.section == 1){
        return [JobsSearchShowHistoryDataTBVCell cellHeightWithModel:nil];
    }else{}
    return 0;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
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
    return 50;
}

-(UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    
    if (self.isHoveringHeaderView) {
        JobsSearchHoveringHeaderView *header = [[JobsSearchHoveringHeaderView alloc] initWithReuseIdentifier:NSStringFromClass(JobsSearchHoveringHeaderView.class)
                                                                                                    withData:self.sectionTitleMutArr[section]];
        @weakify(self)
        [header setHoveringHeaderViewBlock:^(id data) {
            @strongify(self)
            [self.view endEditing:YES];
        }];
        return header;
    }else{
        JobsSearchNonHoveringHeaderView *header = [[JobsSearchNonHoveringHeaderView alloc] initWithReuseIdentifier:NSStringFromClass(JobsSearchNonHoveringHeaderView.class)
                                                                                                          withData:self.sectionTitleMutArr[section]];
        @weakify(self)
        [header setNonHoveringHeaderViewBlock:^(id data) {
            @strongify(self)
            [self.view endEditing:YES];
        }];
        return header;
    }
    
//    {
//        Class headerClass = self.isHoveringHeaderView ? JobsSearchHoveringHeaderView.class : JobsSearchNonHoveringHeaderView.class;
//        UIView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass(headerClass)];
//        return header;
//    }

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
        _tableView.scrollEnabled = NO;
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
        @weakify(self)
        [_jobsSearchBar actionBlockJobsSearchBar:^(id data) {
            NSLog(@"KKK = %@",data);
            if ([data isKindOfClass:NSString.class]) {
                NSString *str = (NSString *)data;
                if ([str isEqualToString:@"textFieldShouldEndEditing:"]) {//正常位
                    /*
                     *    使用弹簧的描述时间曲线来执行动画 ,当dampingRatio == 1 时,动画会平稳的减速到最终的模型值,而不会震荡.
                     *    小于1的阻尼比在达到完全停止之前会震荡的越来越多.
                     *    如果你可以使用初始的 spring velocity 来 指定模拟弹簧末端的对象在加载之前移动的速度.
                     *    他是一个单位坐标系统,其中2被定义为在一秒内移动整个动画距离.
                     *    如果你在动画中改变一个物体的位置,你想在动画开始前移动到 100 pt/s 你会超过0.5,
                     *    dampingRatio 阻尼
                     *    velocity 速度
                     */
                    [UIView animateWithDuration:1
                                          delay:0
                         usingSpringWithDamping:1
                          initialSpringVelocity:20
                                        options:UIViewAnimationOptionCurveEaseInOut
                                     animations:^{
                        @strongify(self)
                        self->_jobsSearchBar.tf.frame = CGRectMake(10,
                                                                   10,
                                                                   SCREEN_WIDTH - 20,
                                                                   self->_jobsSearchBar.mj_h - 20);
                        self->_jobsSearchBar.cancelBtn.frame = CGRectMake(SCREEN_WIDTH - 10,
                                                                          10,
                                                                          0,
                                                                          0);
                    } completion:^(BOOL finished) {
                        
                    }];
                }
                else if([str isEqualToString:@"textFieldShouldBeginEditing:"]){//编辑期
                    /*
                     *    使用弹簧的描述时间曲线来执行动画 ,当dampingRatio == 1 时,动画会平稳的减速到最终的模型值,而不会震荡.
                     *    小于1的阻尼比在达到完全停止之前会震荡的越来越多.
                     *    如果你可以使用初始的 spring velocity 来 指定模拟弹簧末端的对象在加载之前移动的速度.
                     *    他是一个单位坐标系统,其中2被定义为在一秒内移动整个动画距离.
                     *    如果你在动画中改变一个物体的位置,你想在动画开始前移动到 100 pt/s 你会超过0.5,
                     *    dampingRatio 阻尼
                     *    velocity 速度
                     */
                    [UIView animateWithDuration:1
                                          delay:0
                         usingSpringWithDamping:1
                          initialSpringVelocity:20
                                        options:UIViewAnimationOptionCurveEaseInOut
                                     animations:^{
                        @strongify(self)
                        self->_jobsSearchBar.tf.frame = CGRectMake(10,
                                                                   10,
                                                                   SCREEN_WIDTH - 20 - 80 - 10,
                                                                   self->_jobsSearchBar.mj_h - 20);
                        
                        self->_jobsSearchBar.cancelBtn.frame = CGRectMake(SCREEN_WIDTH - 80 - 10,
                                                                          10,
                                                                          80,
                                                                          self->_jobsSearchBar.mj_h - 20);
                    } completion:^(BOOL finished) {
                        
                    }];
                }
                else if ([str isEqualToString:@"cancelBtn"]){//取消按钮点击事件
                    [self.view endEditing:YES];
                }else{}
            }
        }];
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
