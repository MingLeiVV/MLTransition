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

@implementation UIViewController (MLSegue)


- (void)presentViewController:(UIViewController *)viewController loadingDuration:(CGFloat)loadT transitionDuration:(CGFloat)transitionT formViewAlpha:(CGFloat)formAlpha toViewAlpha:(CGFloat)toAlpha completion:(Completion)completion {

    MLSubmit *submit = nil;
    for (UIView *subView in self.view.subviews) {
        
        if ([subView isKindOfClass:[MLSubmit class]]) {
            
            submit = (MLSubmit *)subView;
        }
    }
    
    viewController.transitioningDelegate = self;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(loadT * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([submit loadEnd]) {
            [self presentViewController:viewController animated:YES completion:nil];
            
        }
    });
    
    
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    
    
    
}
@end
