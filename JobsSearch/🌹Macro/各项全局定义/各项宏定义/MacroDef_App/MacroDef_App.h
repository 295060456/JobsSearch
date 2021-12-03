//
//  MacroDef_App.h
//  UBallLive
//
//  Created by Jobs on 2020/10/30.
//

#ifndef MacroDef_App_h
#define MacroDef_App_h

#define debug 1//是否显示debug控件

static NSString *userInfoKey = @"userinfoKey";
static NSString *PostDraftURLKey = @"PostDraftURL";
static NSString *authorizationKey = @"Authorization";
static NSString *userIdKey = @"userIdKey";

static CGFloat ActiveUserTime = 60 * 10;//10mins 活跃用户

#define AppVersion @"100010017"
#define categoryTitleViewHeight 50
#define Margin_collectionView 12
#define Margin_itemX 15
#define Margin_itemY 12
#define JXTableHeaderViewHeight 290
#define MatchScheduleDetailTableHeaderViewHeight 250
/// 播放器view的tag，列表中UI控件唯一tag值
#define kPlayerViewTag 189
#define HQAPPSTRING @"itms-services://?action=download-manifest&url=https://bt.5li2v2.com/channel/ios/hqbetgame_201_6215472_202009132133_4712.plist"
#define NODATA @"暂无数据"
#define AppMainCor_01 RGB_COLOR(46, 51, 77)
#define AppMainCor_02 RGB_SAMECOLOR(247)
#define AppMainCor_03 HEXCOLOR(0xFAFAFA)
#define AppMainCor_04 RGB_COLOR(132, 134, 140)
#define AppMainCor_05 RGB_SAMECOLOR(153)//
#define AppMainCor_06 HEXCOLOR(0xf8f8f8)
#define AppMainCor_07 RGB_COLOR(247, 131, 97)
#define AppMainCor_08 RGB_COLOR(245, 75, 100)
#define AppMainCor_09 RGB_COLOR(92, 130, 178)
#define AppMainCor_10 RGB_COLOR(149, 97, 19)
#define AppMainCor_11 RGB_COLOR(255, 109, 44)
#define AppMainCor_12 RGB_COLOR(131, 145, 175)
#define AppMainCor_13 RGB_COLOR(245, 86, 100)
#define AppMainCor_14 RGB_COLOR(143, 143, 148)
#define AppMainCor_15 RGB_SAMECOLOR(58)
#define AppMainCor_16 RGB_SAMECOLOR(130)
#define AppMainCor_17 RGB_COLOR(132, 36, 23)
#define AppMainCor_18 RGB_COLOR(62, 66, 101)
#define AppMainCor_19 RGB_SAMECOLOR(155)
#define AppMainCor_20 HEXCOLOR(0xF7F7F7)
#define AppLightGrayCor HEXCOLOR(0xCCCCCC)

//输入原型图上的宽和高，对外输出App对应的移动设备的真实宽高
#define KWidth(width) (MIN(SCREEN_WIDTH, SCREEN_HEIGHT) / 375) * (width) //375 对应原型图的宽
#define KHeight(height) (SCREEN_HEIGHT / 743) * (height) //743 对应原型图的高

#define isiPhoneX_seriesBottom 34
#define isiPhoneX_seriesTop 44

#define KDownChannelUrl @"https://www.doudong999.cn/"
#define KDownChannelStr @"doudong"

#endif /* MacroDef_App_h */
