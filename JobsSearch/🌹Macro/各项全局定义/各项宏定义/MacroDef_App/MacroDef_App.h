//
//  MacroDef_App.h
//  UBallLive
//
//  Created by Jobs on 2020/10/30.
//

#ifndef MacroDef_App_h
#define MacroDef_App_h

/// 播放器view的tag，列表中UI控件唯一tag值
#define kPlayerView 2000

#define isiPhoneX_seriesBottom 34
#define isiPhoneX_seriesTop 44
#define KBottomHeight (isiPhoneX ? 34 :0)
#define kNavigationBarHeight     44
#define KDeviceHeightScale Device_Height / 812    //獲取屏幕高度比例
#define kStatusBarHeight        (isiPhoneX ? 44 :20)
#define kTabBarHeight             (isiPhoneX ? 83 : 49)
//#define KDeviceScale ((Device_Width/375)>1.3?1.3:(Device_Width/375))
#define KDeviceScale [[MKTools shared] deviceScaleMetod]
static const CGFloat JXTableHeaderViewHeight = 289;
static const CGFloat JXheightForHeaderInSection = 50;

#define mkSkipHQAppString @"itms-services://?action=download-manifest&url=https://bt.5li2v2.com/channel/ios/hqbetgame_201_6215472_202009132133_4712.plist"

//输入原型图上的宽和高，对外输出App对应的移动设备的真实宽高
#define KWidth(width) (SCREEN_WIDTH / 375) * (width) //375 对应原型图的宽
#define KHeight(height) (SCREEN_HEIGHT / 743) * (height) //743 对应原型图的高

#endif /* MacroDef_App_h */
