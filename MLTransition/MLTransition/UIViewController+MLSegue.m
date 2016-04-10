//
//  UIViewController+MLSegue.m
//  MLTransition
//
//  Created by 磊 on 15/11/10.
//  Copyright © 2015年 磊. All rights reserved.
//

#import "UIViewController+MLSegue.h"
#import "MLSubmit.h"
#import <objc/runtime.h>

@interface UIViewController ()
@property(nonatomic ,copy) void(^block)();
@property(nonatomic, assign)UIViewAnimationType animationType;
@end

static const char *blockKey = "blockKey";
static const char *animationTypeKey = "animationTypeKey";

@implementation UIViewController (MLSegue)


- (void)presentViewcontroller:(UIViewController *)viewController animationType:(UIViewAnimationType)animationType completion:(Completion)completion{
    viewController.transitioningDelegate = self;
    self.animationType = animationType;
    [self presentViewController:viewController animated:YES completion:completion];
}
- (void)dismissViewcontrollerAnimationType:(UIViewAnimationType)animationType completion:(Completion)completion{
    self.transitioningDelegate = self;
    self.animationType = animationType;
    [self dismissViewControllerAnimated:YES completion:completion];
}
- (void)pushViewcontroller:(UIViewController *)viewController animationType:(UIViewAnimationType)animationType completion:(Completion)completion {
    __weak typeof(self) weakSelf = self;
    weakSelf.navigationController.delegate = self;
    self.animationType = animationType;
    self.block = completion;
    [self.navigationController pushViewController:viewController animated:YES];
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {

    source.transitioningDelegate = nil;
    return [MLTransitionAnimation mlTransitionWithAnimationType:self.animationType];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    dismissed.transitioningDelegate = nil;
    return [MLTransitionAnimation mlTransitionWithAnimationType:self.animationType];
}


- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    self.navigationController.delegate = nil;
    if (operation == UINavigationControllerOperationPush) {
        return [MLTransitionAnimation mlTransitionWithAnimationType:self.animationType];
    }
    return nil;
}

#pragma mark - Synthesis
- (void)setAnimationType:(UIViewAnimationType)animationType {
    objc_setAssociatedObject(self, animationTypeKey, @(animationType), OBJC_ASSOCIATION_ASSIGN);
}

- (UIViewAnimationType)animationType {
    return [objc_getAssociatedObject(self, animationTypeKey) longValue];
}
- (void)setBlock:(void (^)())block {
    
    objc_setAssociatedObject(self, blockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)())block {

   return objc_getAssociatedObject(self, blockKey);
}

@end

