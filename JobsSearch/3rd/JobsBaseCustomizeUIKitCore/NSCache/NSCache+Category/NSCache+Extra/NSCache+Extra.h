//
//  NSCache+Extra.h
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#import <Foundation/Foundation.h>
#import "NSString+Path.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSCache (Extra)
/// 计算单个目录缓存文件大小
+(CGFloat)calcFolderSizeAtPath:(NSString *)path;
/// 计算全部缓存文件大小
+(CGFloat)calcCacheSize;
/// 根据路径删除文件
+(void)cleanCacheByPath:(NSString *)path;
/// 清除全部缓存
+(void)cleanAllCaches;

@end

NS_ASSUME_NONNULL_END
