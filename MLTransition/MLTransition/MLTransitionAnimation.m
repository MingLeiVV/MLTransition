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
@end
@implementation MLTransitionAnimation

+ (instancetype)mlTransitionWithAnimationType:(UIViewAnimationType)type {
    return [[self alloc]initTransitionWithAnimationType:type ];
}
- (instancetype)initTransitionWithAnimationType:(UIViewAnimationType)type {
    self = [super init];
    if (self) {
        _type = type;
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
    UIViewController *formVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (isIOS8) {
        
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    }else {
        
        fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
        toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    }
//    [self changeBar:toVc];
        [containerView addSubview:toView];
        [self showTabBar:toVc];
        animationType animationBlock = [MLBridgeBlock mlGetAnimationWithType:_type completion:^{
            [transitionContext completeTransition:YES];
        }];
        animationBlock(fromView,toView,toVc.navigationController.navigationBar);
}
- (void)showTabBar:(UIViewController *)showVc
{
    CGRect tabBarF = showVc.tabBarController.tabBar.frame;
    CGRect navigationBarF = showVc.navigationController.navigationBar.frame;
    showVc.tabBarController.tabBar.frame = CGRectMake(0, tabBarF.origin.y, tabBarF.size.width, tabBarF.size.height);
    showVc.navigationController.navigationBar.frame = CGRectMake(0, navigationBarF.origin.y, navigationBarF.size.width, navigationBarF.size.height);
}
@end
