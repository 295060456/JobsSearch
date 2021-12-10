//
//  ImageNumberView.m
//  Casino
//
//  Created by Jobs on 2021/11/29.
//

#import "JobsImageNumberView.h"

@interface JobsImageNumberView ()
// UI
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)BaseCollectionView *collectionView;
// Data
@property(nonatomic,strong)NSArray <UIImage *>*dataMutArr;

@end

@implementation JobsImageNumberView

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = kClearColor;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
//具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(NSArray <UIImage *>*_Nullable)model{
    self.dataMutArr = model;
    self.collectionView.alpha = 1;
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    JobsImageNumberViewCVCell *cell = [JobsImageNumberViewCVCell cellWithCollectionView:collectionView
                                                                   forIndexPath:indexPath];
    [cell richElementsInCellWithModel:self.dataMutArr[indexPath.row]];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.dataMutArr.count;
}
#pragma mark —— UICollectionViewDelegate
//允许选中时，高亮
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
// 高亮完成后回调
-(void)collectionView:(UICollectionView *)collectionView
didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
// 由高亮转成非高亮完成时的回调
-(void)collectionView:(UICollectionView *)collectionView
didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
// 设置是否允许选中
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
// 设置是否允许取消选中
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
// 选中操作
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
// 取消选中操作
-(void)collectionView:(UICollectionView *)collectionView
didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
#pragma mark —— UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [JobsImageNumberViewCVCell cellSizeWithModel:self.dataMutArr[indexPath.row]];
}
///每个item之间的间距 横（行）间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
///每个item之间的间距  列(纵)间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
///内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout*)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
#pragma mark —— lazyLoad
-(UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = UICollectionViewFlowLayout.new;
        _layout.scrollDirection = (UICollectionViewScrollDirection)UICollectionViewScrollDirectionVertical;
    }return _layout;
}

-(BaseCollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[BaseCollectionView alloc] initWithFrame:CGRectZero
                                               collectionViewLayout:self.layout];
        
        _collectionView.backgroundColor = kClearColor;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.showsVerticalScrollIndicator = NO;

        [_collectionView registerCollectionViewClass];

        [self addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }return _collectionView;
}

@end
