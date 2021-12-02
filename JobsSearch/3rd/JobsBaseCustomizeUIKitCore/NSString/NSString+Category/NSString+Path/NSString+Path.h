//
//  NSString+Path.h
//  Casino
//
//  Created by Jobs on 2021/12/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Path)

#pragma mark —— iOS 获取文件的 文件名 和 后缀
/// 从路径中获得完整的文件名 （带后缀）
-(NSString *)getFullFileNameByFilePath;
/// 从路径中获得完整的文件名 （不带后缀）
-(NSString *)getOnlyFileNameByFilePath;
/// 从路径中获得文件完整的后缀名 （不带'.'）
+(NSString *)getSuffixFileName:(NSString *)filePath;
#pragma mark —— 目录获取
/// 获取bundle路径
+(NSString *)bundlePath;
/// 获取沙盒的主目录路径：
+(NSString *)homeDir;
/// 获取真机沙盒中Documents的目录路径：
+(NSString *)documentsDir;
/// 获取沙盒中Library的目录路径：
+(NSString *)libraryDir;
/// 获取沙盒中NSUserDefaults的保存位置
+(NSString *)userDefaultsDir;
/// 获取沙盒中Libarary/Preferences的目录路径：
+(NSString *)preferencesDir;
/// 获取沙盒中Library/Caches的目录路径：
+(NSString *)cachesDir;
/// 获取沙盒中tmp的目录路径：供系统使用，程序员不要使用，因为随时会被销毁
+(NSString *)tmpDir;

@end

NS_ASSUME_NONNULL_END
