//
//  UIViewController+MLSegue.h
//  MLTransition
//
//  Created by 磊 on 15/11/10.
//  Copyright © 2015年 磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLTransitionAnimation.h"
typedef void(^Completion)();
@interface UIViewController (MLSegue) <UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>

- (void)presentViewcontroller:(UIViewController *)viewController animationType:(UIViewAnimationType)animationType completion:(Completion)completion;
- (void)dismissViewcontrollerAnimationType:(UIViewAnimationType)animationType completion:(Completion)completion;

- (void)pushViewcontroller:(UIViewController *)viewController animationType:(UIViewAnimationType)animationType completion:(Completion)completion;
//-
@end
