//
//  JobsPageView.m
//  Casino
//
//  Created by Jobs on 2021/11/24.
//

#import "JobsPageView.h"

@interface JobsPageView ()
/// UI
@property(nonatomic,strong)UITableView *tableView;
/// Data
@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,strong)NSArray <UIViewModel *>*dataArr;

@end

@implementation JobsPageView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.cellHeight = self.height;//16
    [self.tableView reloadData];
}
//具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(NSArray <UIViewModel *>*_Nullable)model{
    self.dataArr = model;
    
//    self.backgroundImageView.image = KIMG(@"抖动钱包抖币用途");
//    self.imageView_1.alpha = 1;
//    self.imageView_2.alpha = 1;
//    self.valueLab.text = model.goldNumber;
//    self.btn.alpha = 1;
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [JobsPageTBVCell cellHeightWithModel:Nil] ? : self.cellHeight;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsPageTBVCell *cell = [JobsPageTBVCell cellWithTableView:tableView];
    [cell richElementsInCellWithModel:self.dataArr[indexPath.row]];
    UIViewModel *viewModel = self.dataArr[indexPath.row];
    viewModel.width = [JobsPageTBVCell cellHeightWithModel:Nil] ? : self.cellHeight;
    [UIView widthByData:viewModel];
    return cell;
}
#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.new;
        _tableView.backgroundColor = kClearColor;
        _tableView.pagingEnabled = YES;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.scrollEnabled = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = UIView.new;
        _tableView.separatorColor = HEXCOLOR(0xEEEEEE);
        
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }return _tableView;
}

@end
