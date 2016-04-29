//
//  UIViewController+MLSegue.m
//  MLTransition
//
//  Created by 磊 on 15/11/10.
//  Copyright © 2015年 磊. All rights reserved.
//

#import "UIViewController+MLSegue.h"
#import "MLSubmit.h"
#import "MLPercentInteractiveTransition.h"
#import <objc/runtime.h>

NSString *const kMLTransitionFromRight = @"kMLTransitionFromRight";
NSString *const kMLTransitionFromLeft = @"kMLTransitionFromLeft";
NSString *const kMLTransitionFromTop = @"kMLTransitionFromTop";
NSString *const kMLTransitionFromBottom = @"kMLTransitionFromBottom";

@interface UIViewController ()<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>
@property(nonatomic ,copy) void(^block)();
@property(nonatomic ,copy) void(^animation)(UIView *containerView,UIView *fromView,UIView *toView,Completion completion);
@property(nonatomic, assign)UIViewAnimationType animationType;
@property(nonatomic, strong)MLPercentInteractiveTransition *percentInteractive;
@end
static const char *blockKey = "blockKey";
static const char *animationKey = "animationKey";
static const char *animationTypeKey = "animationTypeKey";
static const char *percentInteractiveKey = "percentInteractiveKey";
static const char *directionKey = "directionKey";
@implementation UIViewController (MLSegue)
#pragma mark - publicMethod
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
- (void)pushViewcontroller:(UIViewController *)viewController animationType:(UIViewAnimationType)animationType{
    __weak typeof(self) weakSelf = self;
    weakSelf.navigationController.delegate = self;
    self.animationType = animationType;
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void)popViewcontrollerAnimationType:(UIViewAnimationType)animationType {
    __weak typeof(self) weakSelf = self;
    weakSelf.navigationController.delegate = self;
    self.animationType = animationType;
    [self.navigationController popViewControllerAnimated:YES];
}
// Custom Animation
- (void)presentViewcontroller:(UIViewController *)viewController animations:(animationBlock)animations {
    viewController.transitioningDelegate = self;
    self.animation = animations;
    [self presentViewController:viewController animated:YES completion:nil];
}
- (void)dismissViewcontrollerAnimations:(animationBlock)animations {
    self.transitioningDelegate = self;
    self.animation = animations;
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)pushViewcontroller:(UIViewController *)viewController animations:(animationBlock)animations {
    __weak typeof(self) weakSelf = self;
    weakSelf.navigationController.delegate = self;
    self.animation = animations;
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void)popViewcontrollerAnimations:(animationBlock)animations {
    __weak typeof(self) weakSelf = self;
    weakSelf.navigationController.delegate = self;
    self.animation = animations;
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - privateMethod
- (void)transitionSetting:(UIViewController *)toController {
    if (self.animationType == UIViewAnimationTypeFlip) {
        self.percentInteractive = [MLPercentInteractiveTransition new];
        [self.percentInteractive addPopGesture:toController];
    }
}

#pragma mark - delegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    source.transitioningDelegate = nil;
    if (self.animationType) {
         return [MLTransitionAnimation mlTransitionWithAnimationType:self.animationType jumpType:UIViewControllerJumpTypePresent];
    }
    return [MLCustomTransition mlTransitionWithAnimations:self.animation];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    dismissed.transitioningDelegate = nil;
    if (self.animationType) {
         return [MLTransitionAnimation mlTransitionWithAnimationType:self.animationType jumpType:UIViewControllerJumpTypeDismiss];
    }
    return [MLCustomTransition mlTransitionWithAnimations:self.animation];
}


- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    self.navigationController.delegate = nil;
    if (self.animationType) {
        if (operation == UINavigationControllerOperationPush) {
            return [MLTransitionAnimation mlTransitionWithAnimationType:self.animationType jumpType:UIViewControllerJumpTypePush];
        } else if (operation == UINavigationControllerOperationPop) {
            return [MLTransitionAnimation mlTransitionWithAnimationType:self.animationType jumpType:UIViewControllerJumpTypePop];
        }
    }

    return [MLCustomTransition mlTransitionWithAnimations:self.animation];
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

- (void)setAnimation:(void (^)(UIView *, UIView *, UIView *, Completion))animation {
    objc_setAssociatedObject(self, animationKey, animation, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UIView *, UIView *, UIView *, Completion))animation {
    
    return objc_getAssociatedObject(self, animationKey);
}

- (void)setPercentInteractive:(MLPercentInteractiveTransition *)percentInteractive {
    objc_setAssociatedObject(self, percentInteractiveKey, percentInteractive, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (MLPercentInteractiveTransition *)percentInteractive {
    return objc_getAssociatedObject(self, percentInteractiveKey);
}
- (void)setDirection:(NSString *)direction {
    objc_setAssociatedObject(self, directionKey, direction, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)direction {
    return objc_getAssociatedObject(self, directionKey);
}
@end

