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

@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)JobsSearchBar *jobsSearchBar;

@property(nonatomic,strong)id requestParams;
@property(nonatomic,assign)ComingStyle pushOrPresent;

@property(nonatomic,strong)NSMutableArray *sectionTitleMutArr;
//@property(nonatomic,strong)NSMutableArray *sectionTitleMutArr;

@end

@implementation JobsSearchVC

- (void)dealloc {
    NSLog(@"Running self.class = %@;NSStringFromSelector(_cmd) = '%@';__FUNCTION__ = %s", self.class, NSStringFromSelector(_cmd),__FUNCTION__);
}

+ (instancetype)ComingFromVC:(UIViewController *)rootVC
                 comingStyle:(ComingStyle)comingStyle
           presentationStyle:(UIModalPresentationStyle)presentationStyle
               requestParams:(nullable id)requestParams
                     success:(MKDataBlock)successBlock
                    animated:(BOOL)animated{
    JobsSearchVC *vc = NSClassFromString(ReuseIdentifier).new;
    vc.requestParams = requestParams;
    @weakify(rootVC)
    switch (comingStyle) {
        case ComingStyle_PUSH:{
            if (rootVC.navigationController) {
                vc.pushOrPresent = ComingStyle_PUSH;
                if (successBlock) {
                    successBlock(vc);
                }
                [weak_rootVC.navigationController pushViewController:vc
                                                            animated:animated];
            }else{
                vc.pushOrPresent = ComingStyle_PRESENT;
                //iOS_13中modalPresentationStyle的默认改为UIModalPresentationAutomatic,而在之前默认是UIModalPresentationFullScreen
                vc.modalPresentationStyle = presentationStyle;
                if (successBlock) {
                    successBlock(vc);
                }
                [weak_rootVC presentViewController:vc
                                          animated:animated
                                        completion:^{}];
            }
        }break;
        case ComingStyle_PRESENT:{
            vc.pushOrPresent = ComingStyle_PRESENT;
            //iOS_13中modalPresentationStyle的默认改为UIModalPresentationAutomatic,而在之前默认是UIModalPresentationFullScreen
            vc.modalPresentationStyle = presentationStyle;
            if (successBlock) {
                successBlock(vc);
            }
            [weak_rootVC presentViewController:vc
                                      animated:animated
                                    completion:^{}];
        }break;
        default:
            NSLog(@"错误的推进方式");
            break;
    }return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KLightGrayColor;
    self.gk_navLeftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backBtn];
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
#pragma mark —— lazyLoad
-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = UIButton.new;
        [_backBtn layoutButtonWithEdgeInsetsStyle:GLButtonEdgeInsetsStyleLeft
                                  imageTitleSpace:8];
        [_backBtn setTitleColor:kWhiteColor
                       forState:UIControlStateNormal];
        [_backBtn setTitle:@"返回"
                  forState:UIControlStateNormal];
        [_backBtn setImage:KBuddleIMG(@"Others", nil, @"back_white")
                  forState:UIControlStateNormal];
//        @weakify(self)
        [[_backBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
//            @strongify(self)
            NSLog(@"");
        }];
    }return _backBtn;
}

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
