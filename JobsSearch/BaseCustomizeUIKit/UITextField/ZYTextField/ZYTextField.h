#import <UIKit/UIKit.h>
#import "CJTextField.h"
#import "NSObject+RichText.h"

typedef NS_ENUM(NSUInteger, PlaceHolderAlignment){
    PlaceHolderAlignmentLeft,// 左对齐 默认
    PlaceHolderAlignmentCenter,// 居中对齐
    PlaceHolderAlignmentRight// 右对齐
};

@interface ZYTextField : CJTextField

@property(nonatomic,assign)CGFloat TFRiseHeight;// 键盘在此手机上的最高弹起，区别于全面屏结合非全面屏，有一个安全区域34

@property(nonatomic,strong)UIFont *ZYtextFont;//字体大小
@property(nonatomic,strong)UIColor *ZYtextColor;//文本颜色
@property(nonatomic,strong)UIColor *ZYtintColor;//光标颜色
//
@property(nonatomic,strong)UIColor *ZYplaceholderLabelTextColor_1;//占位文字颜色 失去焦点
@property(nonatomic,strong)UIColor *ZYplaceholderLabelTextColor_2;//占位文字颜色 聚焦状态
@property(nonatomic,strong)UIFont *ZYplaceholderLabelFont_1;//占位文字字体 失去焦点
@property(nonatomic,strong)UIFont *ZYplaceholderLabelFont_2;//占位文字字体 聚焦状态

@property(nonatomic,assign)CGFloat offset;
@property(nonatomic,assign)CGFloat leftViewOffsetX;
@property(nonatomic,assign)CGFloat rightViewOffsetX;

@property(nonatomic,assign)CGFloat ZYTextFieldCornerRadius;
@property(nonatomic,assign)CGFloat ZYTextFieldBorderWidth;
@property(nonatomic,assign)UIColor *ZYTextFieldBorderColor;
@property(nonatomic,assign)BOOL ZYTextFieldMasksToBounds;
@property(nonatomic,assign)PlaceHolderAlignment placeHolderAlignment;//PlaceHolder的位置
@property(nonatomic,assign)CGFloat placeHolderOffset;//左/右/居中 对齐的时候的偏移量 传正值

@property(nonatomic,strong)NSMutableArray <RichLabelDataStringsModel *>*richLabelDataStringsForPlaceHolderMutArr;

@end
