//
//  UIViewController+MLSegue.h
//  MLTransition
//
//  Created by 磊 on 15/11/10.
//  Copyright © 2015年 磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLTransitionAnimation.h"
#define ML_EXTERN extern
typedef void(^Completion)();
@interface UIViewController (MLSegue) <UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>
@property(nonatomic, copy)NSString *direction;

- (void)presentViewcontroller:(UIViewController *)viewController animationType:(UIViewAnimationType)animationType completion:(Completion)completion;
- (void)dismissViewcontrollerAnimationType:(UIViewAnimationType)animationType completion:(Completion)completion;

- (void)pushViewcontroller:(UIViewController *)viewController animationType:(UIViewAnimationType)animationType;
- (void)popViewcontrollerAnimationType:(UIViewAnimationType)animationType;



ML_EXTERN NSString * const kMLTransitionFromRight;
ML_EXTERN NSString * const kMLTransitionFromLeft;
ML_EXTERN NSString * const kMLTransitionFromTop;
ML_EXTERN NSString * const kMLTransitionFromBottom;
@end
