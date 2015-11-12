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
#import "MLTransition.h"

@interface UIViewController ()

@property(nonatomic ,copy) void(^block)();
@end

static const char *blockKey = "blockKey";


static double TransitionDuration;
static double formAlphaV;
static double toAlphaV;

@implementation UIViewController (MLSegue)


- (void)presentViewController:(UIViewController *)viewController loadingDuration:(CGFloat)loadT transitionDuration:(CGFloat)transitionT formViewAlpha:(CGFloat)formAlpha toViewAlpha:(CGFloat)toAlpha completion:(Completion)completion {
    
    TransitionDuration = transitionT;
    formAlphaV = formAlpha;
    toAlphaV = toAlpha;
    self.block = completion;

    viewController.transitioningDelegate = self;
    
    UIView *subView = [self isHaveMLSubmit];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(loadT * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        typeof(self) __weak weakSelf = self;
        if (subView) {
            
            MLSubmit *submit = (MLSubmit *)subView;
            [submit loadEndCompletion:^{
                [weakSelf presentViewController:viewController animated:YES completion:nil];
  
            }];
        }
        
    });
    
    
}

- (void)dismissViewControllerTransitionDuration:(CGFloat)transitionT formViewAlpha:(CGFloat)formAlpha toViewAlpha:(CGFloat)toAlpha completion:(Completion)completion {

    TransitionDuration = transitionT;
    formAlphaV = formAlpha;
    toAlphaV = toAlpha;
    self.block = completion;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {


       return [[MLTransition alloc]initTransitionDuration:TransitionDuration formViewAlpha:formAlphaV toViewAlpha:toAlphaV isDismiss:NO completion:self.block];
    
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {

    return [[MLTransition alloc]initTransitionDuration:TransitionDuration formViewAlpha:formAlphaV toViewAlpha:toAlphaV isDismiss:YES completion:self.block];
}

- (UIView *)isHaveMLSubmit {

    for (UIView *subView in self.view.subviews) {
        
        if ([subView isKindOfClass:[MLSubmit class]]) {
            
            return subView;
        }
    }
    
    return nil;
}


#pragma mark - Synthesis


- (void)setBlock:(void (^)())block {
    
    objc_setAssociatedObject(self, blockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)())block {

   return objc_getAssociatedObject(self, blockKey);
}

@end
