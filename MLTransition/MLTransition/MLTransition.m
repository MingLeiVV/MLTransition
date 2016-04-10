//
//  MLTransition.m
//  MLTransition
//
//  Created by 磊 on 15/11/10.
//  Copyright © 2015年 磊. All rights reserved.
//

#import "MLTransition.h"
#define isIOS8 [UIDevice currentDevice].systemVersion.doubleValue > 8.0

@interface MLTransition ()

@property(nonatomic ,assign)CFTimeInterval transitionDuration;
@property(nonatomic ,assign)CGFloat formAlpha;
@property(nonatomic ,assign)CGFloat toAlpha;
@property(nonatomic ,copy)Completion transitionEndBlock;
@property(nonatomic ,assign)BOOL isDismiss;

@end
@implementation MLTransition 


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
    UIView *formView = nil;
    UIView *toView = nil;
    
    if (isIOS8) {
        
        formView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    }else {
    
        formView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
        toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    }
    
    if (!_isDismiss) {
    
        if (_formAlpha == 0.0) {
            [formView removeFromSuperview];
        }
        formView.alpha = _formAlpha;
        toView.alpha = _toAlpha;
        [containerView addSubview:toView];
        
        [UIView animateWithDuration:_transitionDuration animations:^{
            
            formView.alpha = 0.0;
            toView.alpha = 1.0;
            
            
        } completion:^(BOOL finished) {
            
            [transitionContext completeTransition:YES];
            if (_transitionEndBlock) {
                
                _transitionEndBlock();
            }
            
        }];
        
    }else {
    
        formView.alpha = _formAlpha;
        toView.alpha = _toAlpha;
        [containerView addSubview:toView];
        
//        CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//        CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//        CAAnimationGroup *group = [[CAAnimationGroup alloc]init];
//        rotation.fromValue = 0;
//        rotation.toValue = @(M_PI * 2);
//        scale.fromValue = @(1.0);
//        scale.toValue = @(0.1);
//        scale.repeatDuration = _transitionDuration;
//        rotation.repeatDuration = _transitionDuration;
//        rotation.repeatCount = 1;
//        scale.repeatCount = 1;
//        scale.removedOnCompletion = NO;
//        rotation.removedOnCompletion = NO;
//        group.animations = @[scale,rotation];
//        [formView.layer addAnimation:group forKey:@"group"];
        
        [UIView animateWithDuration:_transitionDuration animations:^{
            
            formView.alpha = 0.0;
            toView.alpha = 1.0;
            
        } completion:^(BOOL finished) {
            [formView removeFromSuperview];
            [transitionContext completeTransition:YES];
            if (_transitionEndBlock) {
                
                _transitionEndBlock();
            }
            
        }];
    
    }
}
@end
