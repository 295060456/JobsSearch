//
//  NSObject+AppTools.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2021/2/2.
//  Copyright © 2021 MonkeyKingVideo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (AppTools)

/// 登录模块 在适当的时候调用
+(void)toLogin;
/// 鉴别是否登录的标准：userIdKey值对应的token是否为空 【YES  已经登录 ｜  NO   没有登录】
+(BOOL)isLogin;
/// 强制登录
+(void)forcedLogin;
/// 跳转官方交流群
+(void)openGoToPotatol;

+(UIImage *)defaultHeaderImage;
/// 配置关注按钮
+(UIButton *)configAttentionBtn;
///【用户关注】按钮逻辑
+(void)logicAttentionBtn:(UIButton *)btn
                  userID:(NSString *)userID
            successBlock:(nullable MKDataBlock)successBlock;
///【帖子关注】按钮逻辑
+(void)logicAttentionBtn:(UIButton *)btn
                  postID:(NSString *)postID
            successBlock:(nullable MKDataBlock)successBlock;
///【用户添加关注】 POST
+(void)networking_postMyPostGETWithAuthorId:(NSString *)authorId
                               successBlock:(MKDataBlock)successBlock;
///【用户取消关注】
+(void)networking_userFocusDeleteGETWithAuthorId:(NSString *)authorId
                                    successBlock:(MKDataBlock)successBlock;
///【帖子添加关注】 POST
+(void)networking_postFansListPOSTWithAuthorId:(NSString *)authorId
                                  successBlock:(MKDataBlock)successBlock;
///【帖子取消关注】
+(void)networking_postFocusDeleteGETWithAuthorId:(NSString *)authorId
                                    successBlock:(MKDataBlock)successBlock;
/// 进App就要调用这个接口
+(void)refreshToken;
/// 登出清空用户数据
-(void)logOut;
/// app版本信息
+(void)checkVersionBlock:(MKDataBlock)block;
/// 视频列表(关注、点赞)  POST
+(void)networking_loadVideosPOSTWithParameters:(NSDictionary *)parameters
                                  successBlock:(MKDataBlock)successBlock
                                  failureBlock:(MKDataBlock)failureBlock;
/**
 我的喜欢
 datatype  0短视频  1长视频
 */
+(void)networking_myPraiseVideoGETWithParameters:(id)parameters
                                    successBlock:(MKDataBlock)successBlock
                                    failureBlock:(MKDataBlock)failureBlock;


@end

NS_ASSUME_NONNULL_END
