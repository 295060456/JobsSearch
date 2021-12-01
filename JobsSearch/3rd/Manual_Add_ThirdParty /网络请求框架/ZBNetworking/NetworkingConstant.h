//
//  NetworkingConstant.h
//  DouYin
//
//  Created by Jobs on 2020/9/24.
//

#ifndef NetworkingConstant_h
#define NetworkingConstant_h

/********如果需要存储，相应的的 key 宏定义********/
/// 服务器相关
#define HTTPRequestTokenKey @"token"
/// 签名key
#define HTTPServiceSignKey @"sign"
/// 私钥key
#define HTTPServiceKey  @"privatekey"
/// 私钥Value
#define HTTPServiceKeyValue @"/** 你的私钥 **/"
/// 状态码key
#define HTTPServiceResponseCodeKey @"code"
/// 消息key
#define HTTPServiceResponseMsgKey @"msg"
/// 数据data
#define HTTPServiceResponseDataKey  @"data"

/**
 后台定义：
 
 【返回状态码(code)】
 -1、服务器异常。
 0、表示成功。
 1、登录已过期，请重新登录。
 2、授权失败。
 4、限定时间内超过请求次数
 6.、风险操作。
 7、未设置交易密码。
 8、帐号已在其他设备登录。
 
 【需要权限的接口】请求头加上authorization字段，值为服务器颁发的jwt令牌。令牌无感刷新，需实时更新
 */
/// 请求数据返回的状态码、根据自己的服务端数据来
typedef NS_ENUM(NSUInteger, HTTPResponseCode) {//KKK
    
    HTTPResponseCodeServeError = -1,/// 服务器异常
    HTTPResponseCodeSuccess = 0,/// 请求成功
    HTTPResponseCodeLoginDate = 1,/// 登录已过期，请重新登录
    HTTPResponseCodeAuthorizationFailure = 2,/// 授权失败
    HTTPResponseCodeLeakTime = 4,/// 限定时间内超过请求次数
    HTTPResponseCodeRiskOperation = 6,/// 风险操作
    HTTPResponseCodeNoSettingTransactionPassword = 7,/// 未设置交易密码
    HTTPResponseCodeOffline = 8/// 帐号已在其他设备登录
    ///其他代号，展示msg内容即可
};

static NSString *const HTTPServiceErrorDomain = @"HTTPServiceErrorDomain";/// The Http request error domain
static NSString *const HTTPServiceErrorResponseCodeKey = @"HTTPServiceErrorResponseCodeKey";/// 请求成功，但statusCode != 0
static NSString *const HTTPServiceErrorRequestURLKey = @"HTTPServiceErrorRequestURLKey";//请求地址错误
static NSString *const HTTPServiceErrorHTTPStatusCodeKey = @"HTTPServiceErrorHTTPStatusCodeKey";//请求错误的code码key: 请求成功了，但code码是错误提示的code,比如参数错误
static NSString *const HTTPServiceErrorDescriptionKey = @"HTTPServiceErrorDescriptionKey";//请求错误，详细描述key
static NSString *const HTTPServiceErrorMessagesKey = @"HTTPServiceErrorMessagesKey";//服务端错误提示，信息key

#define server_URL NSObject.BaseUrl

#endif /* NetworkingConstant_h */
