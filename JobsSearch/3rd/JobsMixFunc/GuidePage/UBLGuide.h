//
//  UBLGuide.h
//  UBallLive
//
//  Created by hansong on 16/11/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UBLGuide : NSObject
+ (UBLGuide *)share;
-(void)scene:(UIWindowScene *)scene API_AVAILABLE(ios(13.0));
@end

NS_ASSUME_NONNULL_END
