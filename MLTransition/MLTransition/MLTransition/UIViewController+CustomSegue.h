//
//  UIViewController+CustomSegue.h
//  MLTransition
//
//  Created by 磊 on 16/4/8.
//  Copyright © 2016年 磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLCustomTransition.h"
#import "MLTransitionAnimation.h"
typedef void(^Completion)();
@interface UIViewController (CustomSegue)<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>
// Custom Animation
//- (void)presentViewcontroller:(UIViewController *)viewController animations:(animationBlock)animations;
//
//- (void)dismissViewcontrollerAnimations:(animationBlock)animations;
//
//- (void)pushViewcontroller:(UIViewController *)viewController animations:(animationBlock)animations;;
//
//- (void)popViewcontrollerAnimations:(animationBlock)animations;;
- (void)presentViewcontroller:(UIViewController *)viewController animationType:(UIViewAnimationType)animationType completion:(Completion)completion;

- (void)dismissViewcontrollerAnimationType:(UIViewAnimationType)animationType completion:(Completion)completion;

- (void)pushViewcontroller:(UIViewController *)viewController animationType:(UIViewAnimationType)animationType;

- (void)popViewcontrollerAnimationType:(UIViewAnimationType)animationType;

@end
