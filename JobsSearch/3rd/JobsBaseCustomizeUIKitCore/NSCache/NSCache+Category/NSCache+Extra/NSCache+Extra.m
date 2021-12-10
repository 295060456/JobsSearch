//
//  NSCache+Extra.m
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#import "NSCache+Extra.h"

@implementation NSCache (Extra)
/// 计算单个目录缓存文件大小
+(CGFloat)calcFolderSizeAtPath:(NSString *)path{
    // 利用NSFileManager实现对文件的管理
    NSFileManager *manager = NSFileManager.defaultManager;
    CGFloat size = 0;
    if ([manager fileExistsAtPath:path]) {
        // 获取该目录下的文件，计算其大小
        NSArray *childrenFile = [manager subpathsAtPath:path];
        for (NSString *fileName in childrenFile) {
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            size += [manager attributesOfItemAtPath:absolutePath
                                              error:nil].fileSize;
        }
        // 将大小转化为M
        return size / 1024.0 / 1024.0;
    }return 0;
}
/// 计算全部缓存文件大小
+(CGFloat)calcCacheSize{
    CGFloat libraryDirSize = [NSCache calcFolderSizeAtPath:NSString.libraryDir];
    CGFloat tmpDirSize = [NSCache calcFolderSizeAtPath:NSString.tmpDir];
    return libraryDirSize + tmpDirSize;
}
/// 根据路径删除文件
+(void)cleanCacheByPath:(NSString *)path{
    // 利用NSFileManager实现对文件的管理
    NSFileManager *fileManager = NSFileManager.defaultManager;
    if ([fileManager fileExistsAtPath:path]) {
        // 获取该路径下面的文件名
        NSArray *childrenFiles = [fileManager subpathsAtPath:path];
        for (NSString *fileName in childrenFiles) {
            // 拼接路径
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            // 将文件删除
            [fileManager removeItemAtPath:absolutePath
                                    error:nil];
        }
    }
}
/// 清除全部缓存
+(void)cleanAllCaches{
    [NSCache cleanCacheByPath:NSString.libraryDir];
    [NSCache cleanCacheByPath:NSString.tmpDir];
}

@end
