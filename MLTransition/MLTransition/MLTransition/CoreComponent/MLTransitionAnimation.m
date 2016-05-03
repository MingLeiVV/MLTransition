//
//  MLTransitionAnimation.m
//  MLTransition
//
//  Created by 磊 on 16/3/23.
//  Copyright © 2016年 磊. All rights reserved.
//

#import "MLTransitionAnimation.h"
#import "UIView+Position.h"
#define isIOS8 [UIDevice currentDevice].systemVersion.doubleValue > 8.0

@interface MLTransitionAnimation ()
@property (nonatomic ,assign)UIViewAnimationType type;
@property (nonatomic ,assign)UIViewControllerJumpType jumpType;
@end
@implementation MLTransitionAnimation

+ (instancetype)mlTransitionWithAnimationType:(UIViewAnimationType)type jumpType:(UIViewControllerJumpType)jumpType{
    return [[self alloc]initTransitionWithAnimationType:type jumpType:jumpType];
}
- (instancetype)initTransitionWithAnimationType:(UIViewAnimationType)type jumpType:(UIViewControllerJumpType)jumpType{
    self = [super init];
    if (self) {
        _type = type;
        _jumpType = jumpType;
    }
    
    return self;
}
// 此方法必须实现
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 0;
}
// 关键方法，所有动画在这里实现
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
        [containerView addSubview:toView];
    animationType animationBlock = [MLBridgeBlock mlGetAnimationWithType:_type jumpType:_jumpType completion:^{
        [transitionContext completeTransition:YES];
    }];
    animationBlock(containerView,fromView,toView,toVc,fromVc);
}

@end
