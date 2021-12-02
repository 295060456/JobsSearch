//
//  NSString+Path.m
//  Casino
//
//  Created by Jobs on 2021/12/1.
//

#import "NSString+Path.h"

@implementation NSString (Path)

#pragma mark —— iOS 获取文件的 文件名 和 后缀
/// 从路径中获得完整的文件名 （带后缀）
-(NSString *)getFullFileNameByFilePath{
    return self.lastPathComponent;
}
/// 从路径中获得完整的文件名 （不带后缀）
-(NSString *)getOnlyFileNameByFilePath{
    return self.getFullFileNameByFilePath.stringByDeletingPathExtension;
}
/// 从路径中获得文件完整的后缀名 （不带'.'）
+(NSString *)getSuffixFileName:(NSString *)filePath{
    return filePath.getFullFileNameByFilePath.pathExtension;
}
#pragma mark —— 目录获取
/// 获取bundle路径
+(NSString *)bundlePath{
    return NSBundle.mainBundle.bundlePath;;
}
/// 获取沙盒的主目录路径：
+(NSString *)homeDir{
    return NSHomeDirectory();
}
/// 获取真机沙盒中Documents的目录路径：
+(NSString *)documentsDir{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                NSUserDomainMask,
                                                YES) firstObject];
}
/// 获取沙盒中Library的目录路径：
+(NSString *)libraryDir{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,
                                                NSUserDomainMask,
                                                YES) lastObject];
}
/// 获取沙盒中NSUserDefaults的保存位置
+(NSString *)userDefaultsDir{
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,
                                               NSUserDomainMask,
                                               YES).firstObject;
}
/// 获取沙盒中Libarary/Preferences的目录路径：
+(NSString *)preferencesDir{
    return [NSString.libraryDir stringByAppendingPathComponent:@"Preferences"];
}
/// 获取沙盒中Library/Caches的目录路径：
+(NSString *)cachesDir{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,
                                                NSUserDomainMask,
                                                YES) firstObject];
}
/// 获取沙盒中tmp的目录路径：供系统使用，程序员不要使用，因为随时会被销毁
+(NSString *)tmpDir{
    return NSTemporaryDirectory();
}

@end
