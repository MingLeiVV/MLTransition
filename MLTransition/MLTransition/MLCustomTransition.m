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
@property(nonatomic ,assign)CFTimeInterval transitionDuration;
@property(nonatomic ,assign)CGFloat formAlpha;
@property(nonatomic ,assign)CGFloat toAlpha;
@property(nonatomic ,copy)Completion transitionEndBlock;
@property(nonatomic ,assign)BOOL isDismiss;
@end
@implementation MLCustomTransition
- (instancetype)initTransitionDuration:(CFTimeInterval)transitionT formViewAlpha:(CGFloat)formAlpha toViewAlpha:(CGFloat)toAlpha isDismiss:(BOOL)isDismiss completion:(Completion)completion{
    
    self = [super init];
    if (self) {
        _transitionDuration = transitionT;
        _formAlpha = formAlpha;
        _toAlpha = toAlpha;
        _transitionEndBlock = completion;
        _isDismiss = isDismiss;
    }
    
    return self;
}
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return _transitionDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *containerView = [transitionContext containerView];
    UIView *fromView = nil;
    UIView *toView = nil;
    
    if (isIOS8) {
        
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    }else {
        
        fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
        toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    }
//        if (!_isDismiss) {
//    [containerView addSubview:toView];
//    animationType animationBlock = [MLBridgeBlock mlGetAnimationWithType:_type completion:^{
//        [transitionContext completeTransition:YES];
//        if (_transitionEndBlock) {
//            
//            _transitionEndBlock();
//        }
//    }];
//    animationBlock(fromView,toView);
//    
//        }else {
//    
//            [containerView addSubview:toView];
//            animationType animationBlock = [MLBridgeBlock mlGetAnimationWithType:UIViewAnimationTypeZoom completion:^{
//                [transitionContext completeTransition:YES];
//                if (_transitionEndBlock) {
//    
//                    _transitionEndBlock();
//                }
//            }];
//            animationBlock(fromView,toView);
//    
//        }
}
@end
