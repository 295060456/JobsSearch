//
//  NSString+Others.m
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import "NSString+Others.h"

@implementation NSString (Others)
#pragma mark —— 其他
+(NSString *)test:(NSArray <NSString *>*)arr{
    NSString *resultStr;
    for (int i = 0; i < arr.count; i++) {
        NSString *tempStr = arr[i];
        tempStr = [tempStr stringByReplacingOccurrencesOfString:@"/" withString:@""];//去除字符 /
        [resultStr stringByAppendingString:[NSString stringWithFormat:@"/%@",tempStr]];
    }return resultStr;
}
/// ？？？
-(NSString *)formatDecimalNumber{
    if (!self || self.length == 0) {
        return self;
    }
    NSNumber *number = @(self.doubleValue);
    NSNumberFormatter *formatter = NSNumberFormatter.new;
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    formatter.positiveFormat = @"###,##0.00";
    NSString *amountString = [formatter stringFromNumber:number];
    return amountString;
}

-(NSString *)getAnonymousString{
    if (self.length < 2) {
        return self;
    }
    NSMutableArray* carries = NSMutableArray.array;
    for (int i = 1; i < self.length - 1; i++) {
        char s = [self characterAtIndex:i];
        s = '*';
        NSString *tempString = [NSString stringWithUTF8String:&s];
        [carries addObject:tempString];
    }
    NSString *string = [carries componentsJoinedByString:@""];
    NSString *anonymousString = [self stringByReplacingCharactersInRange:NSMakeRange(1, self.length - 2)
                                                              withString:string];
    return anonymousString;
}

@end
