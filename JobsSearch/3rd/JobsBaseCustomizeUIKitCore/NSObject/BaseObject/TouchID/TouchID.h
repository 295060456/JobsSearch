
#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>

typedef NS_ENUM(NSInteger,TouchID_Style_Details) {
    TouchIDStyle_1 = 0,// 系统取消授权，如其他APP切入
    TouchIDStyle_2 = 1 << 0,// 用户取消验证Touch ID
    TouchIDStyle_3 = 1 << 1,// 授权失败
    TouchIDStyle_4 = 1 << 2,// 系统未设置密码
    TouchIDStyle_5 = 1 << 3,// 设备Touch ID不可用、例如未打开
    TouchIDStyle_6 = 1 << 4,// 设备Touch ID不可用、用户未录入
    TouchIDStyle_7 = 1 << 5,// 用户选择输入密码、切换主线程处理
    TouchIDStyle_8 = 1 << 6,// 其他情况、切换主线程处理
    TouchIDStyle_9 = 1 << 7,  // TouchID is not enrolled
    TouchIDStyle_10 = 1 << 8,// A passcode has not been set
    TouchIDStyle_11 = 1 << 9,// TouchID not available
};

typedef NS_ENUM(NSInteger,TouchID_Success_Or_Error) {
    TouchID_Success = 0,        //验证成功，主线程处理UI  ****
    TouchID_Error = 1 << 0,     // 不支持指纹识别
};

NS_ASSUME_NONNULL_BEGIN

@interface TouchID : NSObject

@property(nonatomic,copy)void(^MyBlock_TouchID_Style_Details)(TouchID_Style_Details);
@property(nonatomic,copy)void(^MyBlock_TouchID_Success_Or_Error)(TouchID_Success_Or_Error);

+(instancetype)Touch_ID;

@end

NS_ASSUME_NONNULL_END
