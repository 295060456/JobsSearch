//
//  MacroDef_Singleton.h
//  Casino
//
//  Created by Jobs on 2021/12/4.
//

#ifndef MacroDef_Singleton_h
#define MacroDef_Singleton_h

/**
    【对单例的宏定义】
    【资料来源】
     1、https://juejin.cn/post/6844904100966957064
     2、https://github.com/huberyhx/HXSingleton
     3、https://www.jianshu.com/p/5a713295da8d
 */
// .h文件
#define HXSingletonH(name) + (instancetype)shared##name;

// .m文件
#define HXSingletonM(name) \
static id _instance; \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}

#endif /* MacroDef_Singleton_h */
/** uses
 
【调用】
 HXPen *pen1 = [[HXPen alloc]init];
 HXPen *pen2 = [HXPen sharedPens];//❤️和下文的Pens相对应
 HXPen *pen3 = [[HXPen alloc]init];
 NSLog(@"\n%p\n%p\n%p",pen1,pen2,pen3);
 
 【定义】
 =========================================
 #import <Foundation/Foundation.h>
 #import "HXSingleton.h"

 @interface HXPen : NSObject
 HXSingletonH(Pens)
 @end
 =========================================
 #import "HXPen.h"
 
 @implementation HXPen
 HXSingletonM(Pens)
 @end
 =========================================
 */
