//
//  Irregular_Btn.m
//  TestIrregularView
//
//  Created by LuoKI on 2018/4/23.
//  Copyright © 2018年 LuoLi. All rights reserved.
//

#import "IrregularBtn.h"

@interface IrregularBtn()

@property(nonatomic,strong)UIBezierPath *path;
@property(nonatomic,strong)CAShapeLayer *shapLayer;

@end

@implementation IrregularBtn

static dispatch_once_t dispatchOnce;
-(instancetype)init{
    if (self = [super init]) {
        dispatchOnce = 0;
    }return self;
}
// 绘制图形时添加path遮罩
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    dispatch_once(&dispatchOnce, ^{
        self.shapLayer.hidden = NO;
    });
}
// 点击的覆盖方法，点击时判断点是否在path内，YES则响应，NO则不响应
- (BOOL)pointInside:(CGPoint)point
          withEvent:(UIEvent *)event{
    BOOL res = [super pointInside:point withEvent:event];
    if (res){
        if ([self.path containsPoint:point]){
            return YES;
        }return NO;
    }return NO;
}
#pragma mark —— lazyLoad
-(CAShapeLayer *)shapLayer{
    if (!_shapLayer) {
        _shapLayer = CAShapeLayer.layer;
        _shapLayer.path = self.path.CGPath;
        self.layer.mask = _shapLayer;
    }return _shapLayer;
}

-(UIBezierPath *)path{
    if (!_path) {
        _path = UIBezierPath.bezierPath;
        for (int i = 0; i < self.pointMutArr.count; i++) {
            CGPoint retrievedPoint = self.pointMutArr[i].CGPointValue;
            if (i == 0) {
                [_path moveToPoint:retrievedPoint];
            }else
                [_path addLineToPoint:retrievedPoint];
        }
        [_path closePath];
    }return _path;
}

-(NSMutableArray<NSValue *> *)pointMutArr{
    if (!_pointMutArr) {
        _pointMutArr = NSMutableArray.array;
    }return _pointMutArr;
}

@end
