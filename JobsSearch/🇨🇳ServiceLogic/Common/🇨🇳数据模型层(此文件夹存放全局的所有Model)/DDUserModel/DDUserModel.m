//
//  DDUserModel.m
//  DouDong-II
//
//  Created by xxx on 2021/1/10.
//

#import "DDUserModel.h"

@implementation DDUserModel

- (id)mj_newValueFromOldValue:(id)oldValue
                     property:(MJProperty *)property{
    if ([property.name isEqualToString:@"headImage"]) {
        return [NSURL URLWithString:oldValue];
    }return oldValue;
}

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
        @"ID" : @"id"
    };
}
#pragma mark —— 默认值设置

@end
