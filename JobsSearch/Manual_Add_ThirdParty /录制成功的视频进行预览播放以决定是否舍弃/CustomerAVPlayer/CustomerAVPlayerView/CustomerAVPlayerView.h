//
//  CustomerAVPlayer.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/8/18.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RepeatPlayer.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  AVPlayer本身并不能显示视频，而且它也不像MPMoviePlayerController有一个view属性。
 *  如果AVPlayer要显示必须创建一个播放器层AVPlayerLayer用于展示，播放器层继承于CALayer，有了AVPlayerLayer之添加到控制器视图的layer中即可。
 *
 *  要使用AVPlayer首先了解一下几个常用的类：

    AVAsset：主要用于获取多媒体信息，是一个抽象类，不能直接使用。
    AVURLAsset：AVAsset的子类，可以根据一个URL路径创建一个包含媒体信息的AVURLAsset对象。
    AVPlayerItem：一个媒体资源管理对象，管理者视频的一些基本信息和状态，一个AVPlayerItem对应着一个视频资源。
 */

@interface CustomerAVPlayerView : UIView

@property(nonatomic,strong)AVPlayerLayer *playerLayer;
@property(nonatomic,assign)BOOL isSuspend;//是否开启悬浮窗效果
@property(nonatomic,assign)BOOL isTap;

-(instancetype)initWithURL:(NSURL *)movieURL
                 suspendVC:(UIViewController *)suspendVC;
///点击事件回调 参数1：self CustomerAVPlayerView，参数2：手势 UITapGestureRecognizer & UISwipeGestureRecognizer
-(void)actionCustomerAVPlayerBlock:(TwoDataBlock)customerActionAVPlayerBlock;
///错误处理
-(void)errorCustomerAVPlayerBlock:(NoResultBlock)customerErrorAVPlayerBlock;
///播放
-(void)play;
///暂停
-(void)pause;

@end

NS_ASSUME_NONNULL_END
