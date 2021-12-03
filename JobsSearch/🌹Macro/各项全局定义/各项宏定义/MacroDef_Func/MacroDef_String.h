//
//  MacroDef_String.h
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#ifndef MacroDef_String_h
#define MacroDef_String_h

/// 本地化字符串
#define LocalString(x, ...)     NSLocalizedString(x, nil)// NSLocalizedString宏做的其实就是在当前bundle中查找资源文件名“Localizable.strings”(参数:键＋注释)
#define StringFormat(format,...) [NSString stringWithFormat:format, ##__VA_ARGS__]
/// 国际化
#define Internationalization(text)  [NSObject localStringWithKey:text]
/// 字体
#define kFontSize(x) [UIFont systemFontOfSize:x weight:UIFontWeightRegular]
/// 沙盒路径
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#endif /* MacroDef_String_h */
