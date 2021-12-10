//
//  JobsSocketTools.m
//  UBLLive
//
//  Created by Jobs on 2020/11/28.
//  Copyright © 2020 UBL. All rights reserved.
//

#import "JobsSocketIOTools.h"

@interface JobsSocketIOModel ()

@end
 
@implementation JobsSocketIOModel

@end

@interface JobsSocketIOTools ()

@end

@implementation JobsSocketIOTools

static JobsSocketIOTools *static_socketTools = nil;
+(instancetype)sharedInstance{
    @synchronized(self){
        if (!static_socketTools) {
            static_socketTools = JobsSocketIOTools.new;
        }
    }return static_socketTools;
}
/// 链接后台
-(void)linkServerWithInfo:(id)info
              serverBlock:(MKDataBlock)serverBlock{
    if ([NSString isNullString:self.urlStr]) {
        NSLog(@"链接的URL为空,请检查");
    }else{
        NSURL *url = [[NSURL alloc] initWithString:self.urlStr];
        /**
         1、通过解析字段transports，强行获取websocket配置，而不启用默认的轮询机制
         2、forceWebsockets字段保持开启状态，否则导致transports解析不成功
         **/
        self.socketManager = [[SocketManager alloc] initWithSocketURL:url config:@{@"transports":@[@"websocket"],
                                                                                   @"forceWebsockets":@(YES)}];
        self.socketIOClient = [self.socketManager socketForNamespace:@"/chat"];//自定义命名空间
        [self.socketIOClient on:@"connect"//链接频道
                       callback:^(NSArray *data,
                                  SocketAckEmitter *ack) {
            
            JobsSocketIOModel *socketIOModel = JobsSocketIOModel.new;
            socketIOModel.channelName = @"connect";
            socketIOModel.serverReturnData = data;
            
            if (serverBlock) {
                serverBlock(socketIOModel);
            }

            [self sendInfoToServer:info
                       channelName:@"reg"//注册频道
                   withReturnBlock:^(id data) {
                
                if ([data isKindOfClass:NSNumber.class]) {
                    NSNumber *b = (NSNumber *)data;
                    if (b.boolValue) {
                        NSLog(@"链接socket.IO 成功");
                    }
                }
                
                JobsSocketIOModel *socketIOModel = JobsSocketIOModel.new;
                socketIOModel.channelName = @"reg";
                socketIOModel.serverReturnData = data;
                
                if (serverBlock) {
                    serverBlock(socketIOModel);
                }
            }];
        }];
        
        [self.socketIOClient connect];
        
//        [self recevieInfoFromChannelName:@"joinRoom"
//                     withServerDataBlock:nil];
    }
}
/// 发送消息
/// @param info 消息内容 (注意最外层是数组格式)
/// @param channelName 发送的频道名字
/// @param returnBlock 发送链接成功即返回
-(void)sendInfoToServer:(id)info
            channelName:(NSString *)channelName
        withReturnBlock:(MKDataBlock)returnBlock{
    [self.socketIOClient emit:channelName
                         with:@[info]
                   completion:^{
        
        if (returnBlock) {
            returnBlock(@(YES));
        }
    }];
}
/// 接收消息
/// @param channelName 监听的频道名字
/// @param serverDataBlock 服务器返回值
-(void)recevieInfoFromChannelName:(NSString *)channelName
              withServerDataBlock:(MKDataBlock)serverDataBlock{
    [self.socketIOClient on:channelName
                   callback:^(NSArray *data,
                              SocketAckEmitter *ack) {
        
        NSLog(@"监听的频道名字:%@;该频道返回值:%@",channelName,data);
        
        JobsSocketIOModel *socketIOModel = JobsSocketIOModel.new;
        socketIOModel.channelName = channelName;
        socketIOModel.serverReturnData = data;
        
        if (serverDataBlock) {
            serverDataBlock(socketIOModel);
        }
    }];
}
#pragma mark —— lazyLoad
-(NSString *)urlStr{
    if (!_urlStr) {
        _urlStr = @"http://172.24.135.10:9016";
    }return _urlStr;
}

@end
