//
//  UIViewController+CustomSegue.m
//  MLTransition
//
//  Created by 磊 on 16/4/8.
//  Copyright © 2016年 磊. All rights reserved.
//

#import "UIViewController+CustomSegue.h"
#import "MLSubmit.h"
@interface UIViewController ()

@end

static double TransitionDuration;
static double formAlphaV;
static double toAlphaV;

@implementation UIViewController (CustomSegue)
//- (void)presentViewController:(UIViewController *)viewController loadingDuration:(CGFloat)loadT transitionDuration:(CGFloat)transitionT formViewAlpha:(CGFloat)formAlpha toViewAlpha:(CGFloat)toAlpha completion:(Completion)completion {
//
//    TransitionDuration = transitionT;
//    formAlphaV = formAlpha;
//    toAlphaV = toAlpha;
//    self.block = completion;
//
//    viewController.transitioningDelegate = self;
//
//    UIView *subView = [self isHaveMLSubmit];
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(loadT * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        typeof(self) __weak weakSelf = self;
//        if (subView) {
//
//            MLSubmit *submit = (MLSubmit *)subView;
//            [submit loadEndCompletion:^{
//                [weakSelf presentViewController:viewController animated:YES completion:nil];
//
//            }];
//        }
//
//    });
//
//
//}
//
//- (void)dismissViewControllerTransitionDuration:(CGFloat)transitionT formViewAlpha:(CGFloat)formAlpha toViewAlpha:(CGFloat)toAlpha completion:(Completion)completion {
//
//    TransitionDuration = transitionT;
//    formAlphaV = formAlpha;
//    toAlphaV = toAlpha;
//    self.block = completion;
//    self.transitioningDelegate = self;
//    [self dismissViewControllerAnimated:YES completion:nil];
//}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    source.transitioningDelegate = nil;
    return nil;
    //           return [[MLTransitionAnimation alloc]initTransitionDuration:TransitionDuration formViewAlpha:formAlphaV toViewAlpha:toAlphaV isDismiss:NO completion:self.block];
    
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    dismissed.transitioningDelegate = nil;
    return nil;
    //        return [[MLTransitionAnimation alloc]initTransitionDuration:TransitionDuration formViewAlpha:formAlphaV toViewAlpha:toAlphaV isDismiss:YES completion:self.block];
}

- (UIView *)isHaveMLSubmit {
    
    for (UIView *subView in self.view.subviews) {
        
        if ([subView isKindOfClass:[MLSubmit class]]) {
            
            return subView;
        }
    }
    
    return nil;
}
@end
