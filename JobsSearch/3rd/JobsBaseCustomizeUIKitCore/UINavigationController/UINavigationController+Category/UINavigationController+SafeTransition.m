//
//  UINavigationController+SafeTransition.m
//  FirefoxGames
//
//  Created by Billie on 2020/3/8.
//  Copyright © 2020 FirefoxGames. All rights reserved.
//

#import "UINavigationController+SafeTransition.h"
#import "TYFFSwizzle.h"
#import <objc/runtime.h>

@interface UINavigationController () <UINavigationControllerDelegate>
@end

@implementation UINavigationController (SafeTransition)

+ (void)load {
    TYFFSwizzleMethod([self class], @selector(pushViewController:animated:), [self class], @selector(safePushViewController:animated:));
    TYFFSwizzleMethod([self class], @selector(popViewControllerAnimated:), [self class], @selector(safePopViewControllerAnimated:));
    TYFFSwizzleMethod([self class], @selector(popToRootViewControllerAnimated:), [self class], @selector(safePopToRootViewControllerAnimated:));
    TYFFSwizzleMethod([self class], @selector(popToViewController:animated:), [self class], @selector(safePopToViewController:animated:));
}

#pragma mark - setter & getter
- (void)setViewTransitionInProgress:(BOOL)property {
    NSNumber *number = [NSNumber numberWithBool:property];
    objc_setAssociatedObject(self, @selector(viewTransitionInProgress), number, OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)viewTransitionInProgress {
    NSNumber *number = objc_getAssociatedObject(self, @selector(viewTransitionInProgress));
    return [number boolValue];
}

#pragma mark - Intercept Pop, Push, PopToRootVC
- (NSArray *)safePopToRootViewControllerAnimated:(BOOL)animated {
    if (self.viewTransitionInProgress) return nil;
    
    if (animated) {
        self.viewTransitionInProgress = YES;
    }
    
    NSArray *viewControllers = [self safePopToRootViewControllerAnimated:animated];
    if (viewControllers.count == 0) {
        self.viewTransitionInProgress = NO;
    }
    
    return viewControllers;
}

- (NSArray *)safePopToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewTransitionInProgress) return nil;
    
    if (animated){
        self.viewTransitionInProgress = YES;
    }
    
    NSArray *viewControllers = [self safePopToViewController:viewController animated:animated];
    if (viewControllers.count == 0) {
        self.viewTransitionInProgress = NO;
    }
    
    return viewControllers;
}

- (UIViewController *)safePopViewControllerAnimated:(BOOL)animated {
    if (self.viewTransitionInProgress) return nil;
    
    if (animated) {
        self.viewTransitionInProgress = YES;
    }
    
    UIViewController *viewController = [self safePopViewControllerAnimated:animated];
    if (viewController == nil) {
        self.viewTransitionInProgress = NO;
    }
    
    return viewController;
}

- (void)safePushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 如果当前controller已经在栈里了，则不要继续push
    if([self.childViewControllers containsObject:viewController]){
        return;
    }
    if (self.viewTransitionInProgress == NO) {
        [self safePushViewController:viewController animated:animated];
        
        if (animated) {
            self.viewTransitionInProgress = YES;
        }
    }
}
- (void)ty_popToRootViewControllerBySetControllersAnimated:(BOOL)animated {
    if (!animated) {
        NSArray *list = @[self.childViewControllers.firstObject];
        [self setViewControllers:list animated:animated];
    }else{
        [self ty_popToRootViewControllerBySetControllersAnimated:animated];
    }
}
@end

@implementation UIViewController (SafeTransitionLock)

+ (void)load {
    TYFFSwizzleMethod([self class],@selector(viewDidAppear:), [self class], @selector(safeViewDidAppear:));
}

- (void)safeViewDidAppear:(BOOL)animated {
    self.navigationController.viewTransitionInProgress = NO;
    
    [self safeViewDidAppear:animated];
}

@end
