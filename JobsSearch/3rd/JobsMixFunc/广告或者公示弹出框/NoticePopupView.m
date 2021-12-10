//
//  NoticePopupView.m
//  UBallLive
//
//  Created by Jobs on 2020/10/26.
//

#import "NoticePopupView.h"

@interface NoticePopupView ()

@property(nonatomic,strong)UIImageView *imageView;

@end

@implementation NoticePopupView

-(instancetype)init{
    if (self = [super init]) {
        
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
//外层数据渲染
-(void)richElementsInViewWithModel:(id _Nullable)model{
    self.imageView.alpha = 1;
}

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = UIImageView.new;
        _imageView.image = KIMG(@"登录弹窗");
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }return _imageView;
}

@end
