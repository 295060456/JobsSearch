//
//  JobsSocketTools.h
//  UBLLive
//
//  Created by Jobs on 2020/11/28.
//  Copyright © 2020 UBL. All rights reserved.
//

#import <Foundation/Foundation.h>
@import SocketIO;

NS_ASSUME_NONNULL_BEGIN

@interface JobsSocketIOModel : NSObject

@property(nonatomic,strong)NSString *channelName;//频道名
@property(nonatomic,strong)id serverReturnData;//服务器返回数据

@end

@interface JobsSocketIOTools : NSObject

@property(nonatomic,strong)SocketManager *socketManager;
@property(nonatomic,strong)SocketIOClient *socketIOClient;
@property(nonatomic,strong)NSString *urlStr;

+(instancetype)sharedInstance;
/// 链接后台
-(void)linkServerWithInfo:(id)info
              serverBlock:(MKDataBlock)serverBlock;
/// 发送消息
/// @param info 消息内容 (注意最外层是数组格式)
/// @param channelName 发送的频道名字
/// @param returnBlock 发送链接成功即返回
-(void)sendInfoToServer:(id)info
            channelName:(NSString *)channelName
        withReturnBlock:(MKDataBlock)returnBlock;
/// 接收消息
/// @param channelName 监听的频道名字
/// @param serverDataBlock 服务器返回值
-(void)recevieInfoFromChannelName:(NSString *)channelName
              withServerDataBlock:(MKDataBlock)serverDataBlock;

@end

NS_ASSUME_NONNULL_END
