//
//  NonHoveringHeaderView.m
//  HeaderDemo
//
//  Created by zyd on 2018/6/22.
//  Copyright © 2018年 zyd. All rights reserved.
//

#import "NonHoveringHeaderView.h"

@interface NonHoveringHeaderView ()

@end

@implementation NonHoveringHeaderView

-(instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {

    }return self;
}

-(void)richElementsInCellWithModel:(id _Nullable)model{
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    if (self.nonHoveringHeaderViewBlock) {
        self.nonHoveringHeaderViewBlock(@1);
    }
}

-(void)actionBlockNonHoveringHeaderView:(MKDataBlock)nonHoveringHeaderViewBlock{
    _nonHoveringHeaderViewBlock = nonHoveringHeaderViewBlock;
}

@end
