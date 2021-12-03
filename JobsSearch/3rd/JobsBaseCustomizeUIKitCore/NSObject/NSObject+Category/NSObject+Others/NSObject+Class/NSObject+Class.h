//
//  NSObject+Class.h
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

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

@end

NS_ASSUME_NONNULL_END
