//
//  NSObject+Class.h
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Class)
// 返回并打印成员变量列表
-(NSMutableArray <NSString *>*)printIvarList;
// 返回并打印属性列表
-(NSMutableArray <NSString *>*)printPropertyList;
// 返回并打印方法列表
-(NSMutableArray <NSString *>*)printMethodList;
// 返回并打印协议列表
-(NSMutableArray <NSString *>*)printProtocolList;
/**
    1、字典是hash映射，是无序的，如果需要有序则需要避开字典，所以对模型进行操作是大前提
    2、字典和模型的差距在于序列化
    3、字典化的模型里面，依据有序的（从上至下）属性名字排列，去取值，映射到数组里面
 */
-(NSMutableArray *)readModelPropertyValueByOrder;

@end

NS_ASSUME_NONNULL_END
