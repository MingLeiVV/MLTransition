//
//  UIViewController+MLSegue.h
//  MLTransition
//
//  Created by 磊 on 15/11/10.
//  Copyright © 2015年 磊. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Completion)();

@interface UIViewController (MLSegue) <UIViewControllerTransitioningDelegate>

- (void)presentViewController:(UIViewController *)viewController loadingDuration:(CGFloat)loadT transitionDuration:(CGFloat)transitionT formViewAlpha:(CGFloat)formAlpha toViewAlpha:(CGFloat)toAlpha completion:(Completion)completion;


- (void)dismissViewControllerTransitionDuration:(CGFloat)transitionT formViewAlpha:(CGFloat)formAlpha toViewAlpha:(CGFloat)toAlpha completion:(Completion)completion;
@end
