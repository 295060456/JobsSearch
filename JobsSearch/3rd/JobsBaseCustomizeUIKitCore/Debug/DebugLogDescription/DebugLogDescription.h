//
//  DebugLogDescription.h
//  JobsComment
//
//  Created by Jobs on 2021/3/30.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "MacroDef_Log.h"

#ifdef DEBUG

@interface NSObject (DebugDescription)

+(void)redirectNSlogToDocumentFolder;

@end

@interface NSDictionary (DebugDescription)
@end

@interface NSArray (DebugDescription)
@end

#endif

