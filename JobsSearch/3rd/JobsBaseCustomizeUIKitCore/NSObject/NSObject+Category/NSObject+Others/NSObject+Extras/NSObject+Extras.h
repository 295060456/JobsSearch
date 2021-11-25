//
//  NSObject+Extras.h
//  TestDemo
//
//  Created by AaltoChen on 15/10/31.
//  Copyright © 2015年 AaltoChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
#import <objc/runtime.h>
#import <sys/sysctl.h>
#import <mach/mach.h>

#import "AABlock.h"
#import "MacroDef_Func.h"
#import "MacroDef_SysWarning.h"
#import "FileFolderHandleTool.h"
#import "LoadingImage.h"

#import "WHToast+DDToast.h"

#if __has_include(<WHToast/WHToast.h>)
#import <WHToast/WHToast.h>
#else
#import "WHToast.h"
#endif

#if __has_include(<GKPhotoBrowser/GKPhotoBrowser.h>)
#import <GKPhotoBrowser/GKPhotoBrowser.h>
#else
#import "GKPhotoBrowser.h"
#endif

#if __has_include(<TABAnimated/TABAnimated.h>)
#import <TABAnimated/TABAnimated.h>
#else
#import "TABAnimated.h"
#endif

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#if __has_include(<LYEmptyView/LYEmptyViewHeader.h>)
#import <LYEmptyView/LYEmptyViewHeader.h>
#else
#import "LYEmptyViewHeader.h"
#endif

#if __has_include(<YYImage/YYImage.h>)
#import <YYImage/YYImage.h>
#else
#import "YYImage.h"
#endif
/**
 @param weakSelf 方便使用，用来打破循环引用。使用时需要改成实际类型，否则没有代码提示.
 @param arg 事件默认传递的对象，比如`NSNotification`，`UIButton`。
 */
typedef void (^callback)(id _Nullable weakSelf, id _Nullable arg);

@interface NSObject (Extras)

@property(nonatomic,strong,nullable)NSIndexPath * __block _indexPath;//CollectionView、TableView等的序列号
@property(nonatomic,assign)NSInteger __block _index;
@property(nonatomic,assign)NSInteger __block _currentPage;//网路请求分页数据的时候的当前页码
@property(nonatomic,assign)NSInteger __block _pageSize;

///震动特效反馈
+(void)feedbackGenerator;
/*
 * 检测用户是否锁屏：根据屏幕光线来进行判定，而不是系统通知
 * 作用范围:在sceneDidEnterBackground（iOS 13及其以上版本有效） && applicationDidEnterBackground（iOS 13以下版本有效）
 * 调试是否进入后台，要断开于Xcode的连接，否则屏幕常亮
 */
+(BOOL)didUserPressLockButton;
/// iOS 限制自动锁屏 lockSwitch:YES(关闭自动锁屏)
+(void)autoLockedScreen:(BOOL)lockSwitch;
/// 打印请求体
+(void)printRequestMessage:(NSURLSessionDataTask *_Nullable)task;
/// 保存图片
+(void)savePic:(GKPhotoBrowser *_Nullable)browser;
/// 获取当前 UIViewController
- (UIViewController *_Nullable)getCurrentViewController;//一般用这个
- (UIViewController *_Nullable)getCurrentViewControllerFromRootVC:(UIViewController *_Nullable)rootVC;
/// 用block来代替selector
SEL _Nullable selectorBlocks(callback _Nonnull ,id _Nullable target);
/// 获取当前设备可用内存
+(double)availableMemory;
/// 获取当前任务所占用内存
+(double)usedMemory;
/// App 国际化相关系统宏二次封装 + 设置缺省值
+(NSString *_Nullable)localStringWithKey:(nonnull NSString *)key;

+(NSString *_Nullable)localizedString:(nonnull NSString *)key
                            fromTable:(nullable NSString *)tableName;

+(NSString *_Nullable)localizedString:(nonnull NSString *)key
                            fromTable:(nullable NSString *)tableName
                             inBundle:(nullable NSBundle *)bundle;

+(NSString *_Nullable)localizedString:(nonnull NSString *)key
                            fromTable:(nullable NSString *)tableName
                             inBundle:(nullable NSBundle *)bundle
                         defaultValue:(nullable NSString *)defaultValue;
/// 加入键盘通知的监听者
-(void)keyboard;
/// 停止刷新【可能还有数据的情况，状态为：MJRefreshStateIdle】
-(void)endRefreshing:(UIScrollView *_Nonnull)targetScrollView;
/// 停止刷新【没有数据的情况，状态为：MJRefreshStateNoMoreData】
-(void)endRefreshingWithNoMoreData:(UIScrollView *_Nonnull)targetScrollView;
/// 根据数据源【数组】是否有值进行判定：占位图 和 mj_footer 的显隐性
-(void)dataSource:(NSArray *_Nonnull)dataSource
      contentView:(UIScrollView *_Nonnull)contentView;
/// 转换为NSData
+(NSData *_Nullable)transformToData:(id _Nullable)object;
/// 监听程序被杀死前的时刻，进行一些需要异步的操作：磁盘读写、网络请求...
-(void)terminalCheck:(MKDataBlock _Nullable)checkBlock;
/// 判断本程序是否存在某个类
+(BOOL)judgementAppExistClassWithName:(nullable NSString *)className;
/// 判断某个实例对象是否存在某个【不带参数的方法】
+(BOOL)judgementObj:(nonnull NSObject *)obj
existMethodWithName:(nullable NSString *)methodName;
/// 如果某个实例对象存在某个【不带参数的方法】，则对其调用执行
/// @param targetObj 靶点，方法在哪里
/// @param methodName 不带参数的方法名
+(void)targetObj:(nonnull NSObject *)targetObj
callingMethodWithName:(nullable NSString *)methodName;
/// 如果某个实例对象存在某个【不带参数的方法】，则对其调用执行
/// @param methodName 不带参数的方法名
-(void)callingMethodWithName:(nullable NSString *)methodName;
/// 使用 dispatch_once 来执行只需运行一次的线程安全代码
/// @param methodName 需要执行的方法的方法名（不带参数）
-(void)dispatchOnceInvokingWithMethodName:(nullable NSString *)methodName;

+(void)methodName:(NSString *_Nonnull)methodName
        targetObj:(NSObject * _Nonnull)targetObj
      paramarrays:(NSArray *_Nullable)paramarrays;
/// 读取本地的plist文件到内存  【 plist ——> NSDictionary * 】
/// @param fileName Plist文件名
-(nullable NSDictionary *)readLocalPlistWithFileName:(nullable NSString *)fileName;

@end
/**
 通知的写法：示例代码
 
 接受通知：
         @weakify(self)
         [NSNotificationCenter.defaultCenter addObserver:self
                                                selector:selectorBlocks(^(id  _Nullable weakSelf,
                                                                          id  _Nullable arg) {
             NSNotification *notification = (NSNotification *)arg;
             NSNumber *b = notification.object;
             NSLog(@"SSS = %d",b.boolValue);
             @strongify(self)
             self.imageView.hidden = !b.boolValue;
             self.imageView.hidden = self.selectedIndex != 4;
             self.imageView.alpha = b.boolValue;
         }, self)
                                                    name:@"点击开拍提示"
                                                  object:nil];
 
 发通知：[NSNotificationCenter.defaultCenter postNotificationName:@"点击开拍提示" object:@(NO)];
 
 */

/**
 NSInvocation的使用，方法多参数传递 示例代码
 
 -(void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event{
     
     NSString *arg1 = @"a";
     NSString *arg2 = @"b";
     NSString *arg3 = @"c";
     MKDataBlock arg4 = ^(id data){
         NSLog(@"嗯，不错");
     };;
     
     NSArray *paramarrays = @[arg1,
                         arg2,
                         arg3,
                         arg4];
     
     [NSObject methodName:@"test:withArg2:andArg3:block:"
                   target:self
              paramarrays:paramarrays];
 }
 
 
 - (NSString *)test:(NSString *)arg1
           withArg2:(NSString *)arg2
            andArg3:(NSString *)arg3
              block:(MKDataBlock)block{
 
     NSLog(@"%@---%@---%@", arg1, arg2, arg3);
     if (block) {
         block(@"嗯！！");
     }
     return @"gaga";
 }
 
 */
