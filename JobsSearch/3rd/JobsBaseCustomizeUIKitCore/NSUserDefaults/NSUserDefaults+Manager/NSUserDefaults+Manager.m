//
//  NSUserDefaults+Manager.m
//  Casino
//
//  Created by Jobs on 2021/12/1.
//

#import "NSUserDefaults+Manager.h"

@implementation NSUserDefaults (Manager)

/// CRUD（create, read, update, delete）

// 存数据【对象类型】对象会转化为json字符串进行存储，因为没有被序列化所以直接存不进去
+(void)updateWithModel:(UserDefaultModel *)userDefaultModel{
    if (![NSString isNullString:userDefaultModel.key]) {
        if (userDefaultModel.obj && ![userDefaultModel.obj isKindOfClass:NSNull.class]) {
            [NSUserDefaults.standardUserDefaults setObject:[userDefaultModel.obj mj_JSONString]
                                                    forKey:userDefaultModel.key];
            [NSUserDefaults.standardUserDefaults synchronize];
            NSLog(@"%@",NSString.userDefaultsDir);
            return;
        }
        
        if (userDefaultModel.booLValue) {
            [NSUserDefaults.standardUserDefaults setBool:userDefaultModel.booLValue
                                                  forKey:userDefaultModel.key];
            [NSUserDefaults.standardUserDefaults synchronize];
            NSLog(@"%@",NSString.userDefaultsDir);
            return;
        }
    }
}
// 读取数据【读取出来是Json字符串,需要在外层用mj_objectWithKeyValues进行解析】
+(id _Nullable)readWithKey:(NSString *)key{
    id data = nil;
    if (![NSString isNullString:key]){
        data = [NSUserDefaults.standardUserDefaults valueForKey:key];
    }return data;
}
// 删除数据
+(void)deleteWithKey:(NSString *)key{
    if (![NSString isNullString:key]){
        [NSUserDefaults.standardUserDefaults removeObjectForKey:key];
    }
}

@end
