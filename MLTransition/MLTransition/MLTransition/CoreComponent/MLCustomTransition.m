//
//  MLCustomTransition.m
//  MLTransition
//
//  Created by 磊 on 16/4/8.
//  Copyright © 2016年 磊. All rights reserved.
//

#import "MLCustomTransition.h"
#import "MLBridgeBlock.h"
#define isIOS8 [UIDevice currentDevice].systemVersion.doubleValue > 8.0
@interface MLCustomTransition ()
@property(nonatomic,copy)animationBlock block;
@end
@implementation MLCustomTransition
+ (instancetype)mlTransitionWithAnimations:(animationBlock)animations{
    return [[self alloc]initTransitionWithAnimations:animations];
}
- (instancetype)initTransitionWithAnimations:(animationBlock)animations{
    self = [super init];
    if (self) {
        self.block = animations;
    }
    
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 0;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *containerView = [transitionContext containerView];
    UIView *fromView = nil;
    UIView *toView = nil;
    UIViewController *toVc =[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (isIOS8) {
        
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    }else {
        
        fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
        toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    }
    Completion completion = ^(){
        toVc.navigationController.delegate = nil;
        toVc.transitioningDelegate = nil;
        fromVc.navigationController.delegate = nil;
        fromVc.transitioningDelegate = nil;
        [self animationFinish:fromView toView:toView];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    };
    if (self.block) {
        self.block(containerView,fromView,toView,completion);
    }
}
- (void)animationFinish:(UIView *)fromView toView:(UIView *)toView {
    [fromView removeFromSuperview];
    [toView.layer removeAllAnimations];
    [fromView.layer removeAllAnimations];
}
@end
