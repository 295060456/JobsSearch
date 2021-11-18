//
//  TYFSwizzle.h
//  AFNetworking
//
//  Created by Frederic on 2020/11/15.
//

#import <Foundation/Foundation.h>

void TYFFSwizzleMethod(Class originalCls,
                       SEL originalSelector,
                       Class swizzledCls,
                       SEL swizzledSelector);
