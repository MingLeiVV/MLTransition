//
//  UIViewController+MLSegue.h
//  MLTransition
//
//  Created by 磊 on 15/11/10.
//  Copyright © 2015年 磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLTransitionAnimation.h"
#import "MLCustomTransition.h"
#define ML_EXTERN extern
@class MLPercentInteractiveTransition;
typedef void(^Completion)();
@interface UIViewController (MLSegue)
/**
 *  在转场之前设置转场动画的方向,默认是Left
 */
@property(nonatomic, copy)NSString *direction;
@property(nonatomic, strong)MLPercentInteractiveTransition *percentInteractive;
/**
 *  模块转场
 *
 *  @param viewController 跳转的控制器
 *  @param animationType  动画类型
 *  @param completion     转场结束后操作
 */
- (void)presentViewcontroller:(UIViewController *)viewController animationType:(UIViewAnimationType)animationType completion:(Completion)completion;

- (void)dismissViewcontrollerAnimationType:(UIViewAnimationType)animationType completion:(Completion)completion;

- (void)pushViewcontroller:(UIViewController *)viewController animationType:(UIViewAnimationType)animationType;

- (void)popViewcontrollerAnimationType:(UIViewAnimationType)animationType;

// Custom Animation
/**
 *  block转场动画，completion代表转场结束标志，执行此block系统会做后续处理
 *
 *  @param viewController 跳转的控制器
 *  @param animations     动画block块
 */
- (void)presentViewcontroller:(UIViewController *)viewController animations:(animationBlock)animations;

- (void)dismissViewcontrollerAnimations:(animationBlock)animations;

- (void)pushViewcontroller:(UIViewController *)viewController animations:(animationBlock)animations;;

- (void)popViewcontrollerAnimations:(animationBlock)animations;

/**
 *  转场方向属性
 */
ML_EXTERN NSString * const kMLTransitionFromRight;
ML_EXTERN NSString * const kMLTransitionFromLeft;
ML_EXTERN NSString * const kMLTransitionFromTop;
ML_EXTERN NSString * const kMLTransitionFromBottom;
@end
