//
//  UIViewController+CustomSegue.h
//  MLTransition
//
//  Created by 磊 on 16/4/8.
//  Copyright © 2016年 磊. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^Completion)();
@interface UIViewController (CustomSegue)
// Custom Animation
- (void)presentViewController:(UIViewController *)viewController loadingDuration:(CGFloat)loadT transitionDuration:(CGFloat)transitionT formViewAlpha:(CGFloat)formAlpha toViewAlpha:(CGFloat)toAlpha completion:(Completion)completion;

- (void)dismissViewControllerTransitionDuration:(CGFloat)transitionT formViewAlpha:(CGFloat)formAlpha toViewAlpha:(CGFloat)toAlpha completion:(Completion)completion;
@end
