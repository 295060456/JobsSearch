//
//  main.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import <UIKit/UIKit.h>
#import "JobsSearchAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([JobsSearchAppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
