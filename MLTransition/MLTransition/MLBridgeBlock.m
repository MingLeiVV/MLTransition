//
//  MLBridgeBlock.m
//  MLTransition
//
//  Created by 磊 on 16/4/7.
//  Copyright © 2016年 磊. All rights reserved.
//

#import "MLBridgeBlock.h"
#import "UIView+Position.h"
#define navigationBar toController.navigationController.navigationBar
#define Duration 2
#define UIScreen_Width [UIScreen mainScreen].bounds.size.width
#define UIScreen_Height [UIScreen mainScreen].bounds.size.height
#define movePosition 300

NSInteger jumpType;
@implementation MLBridgeBlock
+ (animationType)mlGetAnimationWithType:(UIViewAnimationType)type jumpType:(UIViewControllerJumpType)jumpType completion:(completion)finish{
    jumpType = jumpType;
    switch (type) {
        case UIViewAnimationTypeGradient:
            return [self Gradient:finish];
            break;
            case UIViewAnimationTypeFall:
            return [self Fall:finish];
            break;
            case UIViewAnimationTypeZoom:
            return [self Zoom:finish];
            break;
            case UIViewAnimationTypeScale:
            return [self Scale:finish];
            break;
            case UIViewAnimationTypeSlideOut:
            return [self SlideOut:finish];
            break;
            case UIViewAnimationTypeFlip:
            return [self Flip:finish];
            break;
    }
    return [self None:finish];
}
+ (void)transitionSeting:(UIViewController *)toController {
    if (jumpType == UIViewControllerJumpTypePop) {
        CGRect tabBarF = toController.tabBarController.tabBar.frame;
        toController.tabBarController.tabBar.frame = CGRectMake(0, tabBarF.origin.y, tabBarF.size.width, tabBarF.size.height);
    }
}
+ (animationType)Gradient:(completion)finish{
    
    animationType gradient = ^(UIView *fromView,UIView *toView,UIViewController *toController){
        fromView.alpha = 1.0;
        toView.alpha = 0.0;
        navigationBar.alpha = 0.0;
        [UIView animateWithDuration:Duration animations:^{
            fromView.alpha = 0.0;
            toView.alpha = 1.0;
            navigationBar.alpha = 1.0;
        } completion:^(BOOL finished) {
            finish();
            [self animationFinish:fromView toView:toView];
        }];
        
    };
    return gradient;
}
+ (animationType)Zoom:(completion)finish {
    animationType zoom = ^(UIView *fromView,UIView *toView,UIViewController *toController){
        CABasicAnimation *windowSpecial   = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        fromView.alpha = 0.5;
        toView.alpha = 0.5;
        navigationBar.alpha = 0.0;
        windowSpecial.fromValue           = @(0.01);
        
        windowSpecial.toValue             = @(1);
        
        windowSpecial.duration = Duration - 1;
        
        windowSpecial.repeatCount         = 1;
        windowSpecial.removedOnCompletion = NO;
         [toView.layer addAnimation:windowSpecial forKey:windowSpecial.keyPath];
        [UIView animateWithDuration:Duration animations:^{
                fromView.alpha = 0.0;
                toView.alpha = 1.0;
                navigationBar.alpha = 1.0;
        } completion:^(BOOL finished) {
            finish();
            [self animationFinish:fromView toView:toView];
        }];
    };
    return zoom;
}
+ (animationType)Scale:(completion)finish {
    animationType scale =  ^(UIView *fromView,UIView *toView,UIViewController *toController){
        CABasicAnimation *windowSpecial   = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        fromView.alpha = 1.0;
        toView.alpha = 0.3;
        navigationBar.alpha = 0.0;
        windowSpecial.fromValue           = @(1);
        windowSpecial.toValue             = @(0.01);
        windowSpecial.duration = Duration - 1;
        windowSpecial.repeatCount         = 1;
        windowSpecial.removedOnCompletion = NO;
        
        [fromView.layer addAnimation:windowSpecial forKey:windowSpecial.keyPath];
        [UIView animateWithDuration:Duration animations:^{
            fromView.alpha = 0.0;
            toView.alpha = 1.0;
            navigationBar.alpha = 1.0;
        } completion:^(BOOL finished) {
            finish();
            [self animationFinish:fromView toView:toView];
        }];

    };
    
    return scale;
}
+ (animationType)Fall:(completion)finish {
    animationType fall = ^(UIView *fromView,UIView *toView,UIViewController *toController){
            [self transitionSeting:toController];
        CABasicAnimation *position   = [CABasicAnimation animationWithKeyPath:@"position.y"];
        fromView.alpha = 1.0;
        toView.alpha = 0.3;
        navigationBar.alpha = 0.0;
        position.fromValue           = @(-UIScreen_Height);
        position.toValue             = @(movePosition);
        position.duration = Duration;
        position.repeatCount         = 1;
        position.removedOnCompletion = NO;
        [toView.layer addAnimation:position forKey:position.keyPath];
        
        // 对导航条和tabBar条做相对应的处理
        [navigationBar.layer addAnimation:[self getNavigationBar:UIViewAnimationTypeFall] forKey:position.keyPath];
        
        [UIView animateWithDuration:Duration animations:^{
            toView.alpha = 1.0;
            navigationBar.alpha = 1.0;
        } completion:^(BOOL finished) {
            finish();
            [self animationFinish:fromView toView:toView];
        }];
    };
    return fall;
}
+ (animationType)SlideOut:(completion)finish {
    animationType slideOut = ^(UIView *fromView,UIView *toView,UIViewController *toController){
        [self transitionSeting:toController];
        CABasicAnimation *position   = [CABasicAnimation animationWithKeyPath:@"position.y"];
        fromView.alpha = 1.0;
        toView.alpha = 0.3;
        navigationBar.alpha = 0.0;
        position.fromValue           = @(movePosition);
        position.toValue             = @(-UIScreen_Height);
        position.duration = Duration;
        position.repeatCount         = 1;
        position.removedOnCompletion = NO;
        [fromView.layer addAnimation:position forKey:position.keyPath];
        // 对导航条和tabBar条做相对应的处理
        [navigationBar.layer addAnimation:[self getNavigationBar:UIViewAnimationTypeSlideOut] forKey:position.keyPath];
        
        [UIView animateWithDuration:Duration animations:^{
            fromView.alpha = 0.0;
            toView.alpha = 1.0;
            navigationBar.alpha = 1.0;
        } completion:^(BOOL finished) {
            finish();
            [self animationFinish:fromView toView:toView];
        }];
    };
    return slideOut;

}

+ (animationType)Flip:(completion)finish {
animationType Flip = ^(UIView *fromView,UIView *toView,UIViewController *toController){
    CABasicAnimation *rotate   = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    fromView.alpha = 1.0;
    toView.alpha = 0.3;
    navigationBar.alpha = 0.0;
    rotate.fromValue           = @(0);
    rotate.toValue             = @(M_PI);
    rotate.duration = Duration;
    rotate.repeatCount         = 1;
    rotate.removedOnCompletion = NO;
    [fromView.layer addAnimation:rotate forKey:rotate.keyPath];
    
    [UIView animateWithDuration:Duration animations:^{
        fromView.alpha = 0.0;
        toView.alpha = 1.0;
        navigationBar.alpha = 1.0;
    } completion:^(BOOL finished) {
        finish();
        [self animationFinish:fromView toView:toView];
    }];
};
    return Flip;
}
+ (animationType)None:(completion)finish {
    animationType none = ^(UIView *fromView,UIView *toView,UIViewController *toController){
    };
    return none;
}
+ (void)animationFinish:(UIView *)fromView toView:(UIView *)toView {
    [toView.layer removeAllAnimations];
    [fromView removeFromSuperview];
}

+ (CABasicAnimation *)getNavigationBar:(UIViewAnimationType)type {
    CABasicAnimation *position   = [CABasicAnimation animationWithKeyPath:@"position.y"];
    if (type == UIViewAnimationTypeFall) {
        position.fromValue           = @(-UIScreen_Height);
        position.toValue             = @(0);
    }else if (type == UIViewAnimationTypeSlideOut) {
        position.fromValue           = @(0);
        position.toValue             = @(-UIScreen_Height);
    }
    position.duration = Duration;
    position.repeatCount         = 1;
    position.removedOnCompletion = NO;
    return position;
}
@end
