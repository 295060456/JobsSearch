//
//  NSString+Eomji.h
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Eomji)
#pragma mark —— Eomji相关
/// 编码emoji
-(NSString *)emojiEncode;
/// 解码emoji
-(NSString *)emojiDecode;
/// 判断第三方键盘中的表情
-(BOOL)hasEmoji;
/// 去除表情
-(NSString *)disableEmoji;
/// iOS判断某字符串是否是Emoji表情【有一定缺陷，但能满足大多数业务场景需求（因为Emoji在不断的发展更新，不应该本地写死）】
-(BOOL)validateContainsEmoji;

-(BOOL)isHaveAppleEomji;
/**
    过滤表情
    在这个方法中处理  - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
 */
-(BOOL)isContainsTwoEmoji;

@end

NS_ASSUME_NONNULL_END
