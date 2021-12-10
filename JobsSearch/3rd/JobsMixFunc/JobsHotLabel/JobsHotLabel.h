//
//  HotLabel.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/4.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "UIViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsHotLabel : BaseView

@property(nonatomic,assign)CGFloat top;//第一个元素距离HotLabel上边的距离  同样也是下边距（对称性）
@property(nonatomic,assign)CGFloat left;//第一个元素距离HotLabel左边的距离 同样也是右边距（对称性）

@property(nonatomic,strong)NSArray <UIViewModel *>*viewModelDataArr;// 数据源

-(CGFloat)heightForHotLabel;//约束走完以后，计算得出的高，用于外界自适应

@end

NS_ASSUME_NONNULL_END

/**
 uses
 
 // Data
 @property(nonatomic,strong)JobsHotLabel *hl;
 @property(nonatomic,strong)NSMutableArray <UIViewModel *>*hotLabelDataMutArr;
 
 -(JobsHotLabel *)hl{
     if (!_hl) {
         _hl = JobsHotLabel.new;
         _hl.backgroundColor = kClearColor;
         _hl.viewModelDataArr = self.hotLabelDataMutArr;
         [self addSubview:_hl];
         [_hl mas_makeConstraints:^(MASConstraintMaker *make) {
             make.centerX.equalTo(self.subTitleLab);
             make.top.equalTo(self.subTitleLab.mas_bottom).offset(KWidth(29));
             make.bottom.equalTo(self).offset(-KWidth(10));
             make.width.mas_equalTo(250);
         }];
         
         [self layoutIfNeeded];
         NSLog(@"");
         
     }return _hl;
 }

 -(NSMutableArray<UIViewModel *> *)hotLabelDataMutArr{
     if (!_hotLabelDataMutArr) {
         _hotLabelDataMutArr = NSMutableArray.array;
         
         {
             UIViewModel *vm = UIViewModel.new;
             vm.bgImage = KIMG(@"service_skype");
             vm.text = @"";
             vm.size = CGSizeMake(KWidth(46), KWidth(46));
             vm.offsetXForEach = KWidth(46);
             vm.offsetYForEach = KWidth(46);
             [_hotLabelDataMutArr addObject:vm];
         }
         
         {
             UIViewModel *vm = UIViewModel.new;
             vm.bgImage = KIMG(@"service_qq");
             vm.text = @"";
             vm.size = CGSizeMake(KWidth(46), KWidth(46));
             vm.offsetXForEach = KWidth(46);
             vm.offsetYForEach = KWidth(46);
             [_hotLabelDataMutArr addObject:vm];
         }
         
         {
             UIViewModel *vm = UIViewModel.new;
             vm.bgImage = KIMG(@"service_telegram");
             vm.text = @"";
             vm.size = CGSizeMake(KWidth(46), KWidth(46));
             vm.offsetXForEach = KWidth(46);
             vm.offsetYForEach = KWidth(46);
             [_hotLabelDataMutArr addObject:vm];
         }
         
         {
             UIViewModel *vm = UIViewModel.new;
             vm.bgImage = KIMG(@"service_wechat");
             vm.text = @"";
             vm.size = CGSizeMake(KWidth(46), KWidth(46));
             vm.offsetXForEach = KWidth(46);
             vm.offsetYForEach = KWidth(46);
             [_hotLabelDataMutArr addObject:vm];
         }
         
         {
             UIViewModel *vm = UIViewModel.new;
             vm.bgImage = KIMG(@"login_skype");
             vm.text = @"";
             vm.size = CGSizeMake(KWidth(46), KWidth(46));
             vm.offsetXForEach = KWidth(46);
             vm.offsetYForEach = KWidth(46);
             [_hotLabelDataMutArr addObject:vm];
         }
         
         {
             UIViewModel *vm = UIViewModel.new;
             vm.bgImage = KIMG(@"service_meiqia");
             vm.text = @"";
             vm.size = CGSizeMake(KWidth(46), KWidth(46));
             vm.offsetXForEach = KWidth(46);
             vm.offsetYForEach = KWidth(46);
             [_hotLabelDataMutArr addObject:vm];
         }
         
     }return _hotLabelDataMutArr;
 }
 
 
 */
