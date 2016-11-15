//
//  MLBridgeBlock.m
//  MLTransition
//
//  Created by 磊 on 16/4/7.
//  Copyright © 2016年 磊. All rights reserved.
//

#import "MLBridgeBlock.h"
#import "UIView+Position.h"
#import "UIViewController+MLSegue.h"
#import "MLPercentInteractiveTransition.h"
#define navigationBar toController.navigationController.navigationBar
#define Duration 2 // 动画时长
#define UIScreen_Width [UIScreen mainScreen].bounds.size.width
#define UIScreen_Height [UIScreen mainScreen].bounds.size.height
#define movePosition 300

UIViewControllerJumpType _jumpType; // 跳转类型
@implementation MLBridgeBlock
+ (animationType)mlGetAnimationWithType:(UIViewAnimationType)type jumpType:(UIViewControllerJumpType)jumpType completion:(completion)finish{
    _jumpType = jumpType;
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
        case UIViewAnimationTypeFlipPage:
            return [self FlipPage:finish];
            break;
        case UIViewAnimationTypeFlip:
            return [self Flip:finish];
            break;
        case UIViewAnimationTypeCubeFlip:
            return [self CubeFlip:finish];
            break;
        case UIViewAnimationTypeRipple:
            return [self Ripple:finish];
            break;
        case UIViewAnimationTypeStack:
            return [self Stack:finish];
            break;
        case UIViewAnimationTypeBlinds:
            return [self Blinds:finish];
            break;
        case UIViewAnimationTypeTile:
            return [self Tile:finish];
            break;
        default:
            return [self None:finish];
            break;
    }
    return [self None:finish];
}
+ (void)transitionSeting:(UIViewController *)toController {
    if (_jumpType == UIViewControllerJumpTypePop) {
        CGRect tabBarF = toController.tabBarController.tabBar.frame;
        toController.tabBarController.tabBar.frame = CGRectMake(0, tabBarF.origin.y, tabBarF.size.width, tabBarF.size.height);
    }
}
+ (animationType)Gradient:(completion)finish{
    
    animationType gradient = ^(UIView *containerView,UIView *fromView,UIView *toView,UIViewController *toController,UIViewController *fromController){
        fromView.alpha = 1.0;
        toView.alpha = 0.0;
        navigationBar.alpha = 0.0;
        [UIView animateWithDuration:Duration animations:^{
            fromView.alpha = 0.0;
            toView.alpha = 1.0;
            navigationBar.alpha = 1.0;
        } completion:^(BOOL finished) {
            BOOL isFinish = finish();
             [self animationFinish:fromView toView:toView finish:isFinish];
        }];
        
    };
    return gradient;
}
+ (animationType)Zoom:(completion)finish {
    animationType zoom = ^(UIView *containerView,UIView *fromView,UIView *toView,UIViewController *toController,UIViewController *fromController){
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
             [self animationFinish:fromView toView:toView finish:finish()];
        }];
    };
    return zoom;
}
+ (animationType)Scale:(completion)finish {
    animationType scale =  ^(UIView *containerView,UIView *fromView,UIView *toView,UIViewController *toController,UIViewController *fromController){
            [self transitionSeting:toController];
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
             [self animationFinish:fromView toView:toView finish:finish()];
        }];

    };
    
    return scale;
}
+ (animationType)Fall:(completion)finish {
    animationType fall = ^(UIView *containerView,UIView *fromView,UIView *toView,UIViewController *toController,UIViewController *fromController){
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
             [self animationFinish:fromView toView:toView finish:finish()];
        }];
    };
    return fall;
}
+ (animationType)SlideOut:(completion)finish {
    animationType slideOut = ^(UIView *containerView,UIView *fromView,UIView *toView,UIViewController *toController,UIViewController *fromController){
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
             [self animationFinish:fromView toView:toView finish:finish()];
        }];
    };
    return slideOut;

}

+ (animationType)FlipPage:(completion)finish {
animationType FlipPage = ^(UIView *containerView,UIView *fromView,UIView *toView,UIViewController *toController,UIViewController *fromController){
    
    toView.alpha = 0.2;
    //增加透视的transform
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -0.002;
    containerView.layer.sublayerTransform = transform;
    
    //给fromVC和toVC分别设置相同的起始frame
    CGRect initialFrame = toController.view.frame;
    fromView.frame = initialFrame;
    toView.frame = initialFrame;
    
    CATransform3D transfromRotate = [self flipPageSetting:([self checkJumpMode] ? fromView : toView)];
    [UIView animateWithDuration:Duration - 1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        //旋转fromView 90度
        toView.alpha = 1.0;
        if ([self checkJumpMode]) {
            fromView.layer.transform = transfromRotate;
        }else {
            toView.layer.transform = transfromRotate;
        }
    } completion:^(BOOL finished) {
        [self updateAnchorPointAndOffset:CGPointMake(0.5, 0.5) view:fromView];
        [self updateAnchorPointAndOffset:CGPointMake(0.5, 0.5) view:toView];
        fromView.layer.transform = CATransform3DIdentity;
        toView.layer.transform = CATransform3DIdentity;
         [self animationFinish:fromView toView:toView finish:finish()];
        
    }];
};
    return FlipPage;
}

+ (animationType)Flip:(completion)finish {
    animationType Flip = ^(UIView *containerView,UIView *fromView,UIView *toView,UIViewController *toController,UIViewController *fromController){
        
        if ([self checkJumpMode]) {
            toView.alpha = 0.0;
            [fromView addSubview:toView];
        }else {
            fromView.alpha = 1.0;
            toView.alpha = 1.0;
            [containerView addSubview:toView];
        }
        CATransition *transition = [CATransition animation];
        transition.type = @"oglFlip";
        transition.subtype = [self getTransitionDirection:fromController];
        transition.duration = Duration;
        [UIView animateWithDuration:Duration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            if ([self checkJumpMode]) {
            toView.alpha = 1.0;
            [fromView.layer addAnimation:transition forKey:nil];
            }else {
            fromView.alpha = 0.0;
            [containerView.layer addAnimation:transition forKey:nil];
            }

        } completion:^(BOOL finished) {
            [containerView addSubview:toView];
             [self animationFinish:fromView toView:toView finish:finish()];
            
        }];
    };
    return Flip;
}

+ (animationType)CubeFlip:(completion)finish {
    animationType CubeFlip = ^(UIView *containerView,UIView *fromView,UIView *toView,UIViewController *toController,UIViewController *fromController){
        [fromView addSubview:toView];
        CATransition *transition = [CATransition animation];
        fromView.alpha = 1.0;
        toView.alpha = 0.5;
        transition.type = @"cube";
        transition.subtype = [self getTransitionDirection:fromController];
        transition.duration = Duration;
        [UIView animateWithDuration:Duration delay:0.0 options:UIViewAnimationOptionTransitionNone animations:^{
            [fromView.layer addAnimation:transition forKey:nil];
            fromView.alpha = 0.7;
            toView.alpha = 1.0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                fromView.alpha = 1.0;
            } completion:^(BOOL finished) {
                [containerView addSubview:toView];
             [self animationFinish:fromView toView:toView finish:finish()];
            }];
            
        }];
        
    };
    return CubeFlip;
}

+ (animationType)Ripple:(completion)finish {
    animationType Ripple = ^(UIView *containerView,UIView *fromView,UIView *toView,UIViewController *toController,UIViewController *fromController){
        [fromView addSubview:toView];
        CATransition *transition = [CATransition animation];
        toView.alpha = 0.0;
        transition.type = @"rippleEffect";
        transition.duration = Duration;
        [UIView animateWithDuration:Duration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            toView.alpha = 1.0;
            [fromView.layer addAnimation:transition forKey:nil];
        } completion:^(BOOL finished) {
            [containerView addSubview:toView];
             [self animationFinish:fromView toView:toView finish:finish()];
            
        }];
    };
    return Ripple;
}

+ (animationType)Stack:(completion)finish {
    animationType Stack = ^(UIView *containerView,UIView *fromView,UIView *toView,UIViewController *toController,UIViewController *fromController){
        [fromView addSubview:toView];
        CATransition *transition = [CATransition animation];
        toView.alpha = 0.0;
        transition.type = @"reveal";
        transition.subtype = [self getTransitionDirection:fromController];
        transition.duration = Duration;
        [UIView animateWithDuration:Duration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            toView.alpha = 1.0;
            [fromView.layer addAnimation:transition forKey:nil];
        } completion:^(BOOL finished) {
            [containerView addSubview:toView];
             [self animationFinish:fromView toView:toView finish:finish()];
            
        }];
    };
    return Stack;
}
+ (animationType)Blinds:(completion)finish {
    animationType Stack = ^(UIView *containerView,UIView *fromView,UIView *toView,UIViewController *toController,UIViewController *fromController){
        toView.alpha = 0.5;
        CATransform3D transformScale = [self checkJumpMode] ? [self blindsSetting:toView] : [self blindsSetting:fromView];
        [UIView animateWithDuration:Duration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            if ([self checkJumpMode]) {
                 toView.layer.transform = transformScale;
            }else {
                fromView.layer.transform = transformScale;
            }
            toView.alpha = 1;
        } completion:^(BOOL finished) {
            fromView.layer.transform = CATransform3DIdentity;
            toView.layer.transform = CATransform3DIdentity;
             [self animationFinish:fromView toView:toView finish:finish()];
            
        }];
    };
    return Stack;
}
+ (animationType)Tile:(completion)finish {
    animationType Tile = ^(UIView *containerView,UIView *fromView,UIView *toView,UIViewController *toController,UIViewController *fromController){
        CGRect toViewFrame = toView.frame;
        toView.frame = CGRectMake(0, 0, 20, 20);;
        fromView.alpha = 0.5;
        toView.alpha = 0.3;
        [UIView animateWithDuration:Duration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            toView.alpha = 1;
            toView.frame = toViewFrame;
        } completion:^(BOOL finished) {
            fromView.alpha = 1.0;
            [self animationFinish:fromView toView:toView finish:finish()];
            
        }];
    };
    return Tile;
}
+ (animationType)None:(completion)finish {
    animationType none = ^(UIView *containerView,UIView *fromView,UIView *toView,UIViewController *toController,UIViewController *fromController){
        toView.alpha = 1.0;
         [self animationFinish:fromView toView:toView finish:finish()];
    };
    return none;
}
// 获取动画的方向
+ (NSString *const)getTransitionDirection:(UIViewController *)controller {
    if ([controller.direction isEqualToString:kMLTransitionFromTop]) {
        return kCATransitionFromTop;
    }else if ([controller.direction isEqualToString:kMLTransitionFromBottom]) {
    return kCATransitionFromBottom;
    }else if ([controller.direction isEqualToString:kMLTransitionFromLeft]) {
        return kCATransitionFromLeft;
    }
    return kCATransitionFromRight;
}
// 检查跳转方式是否是push或者present
+ (BOOL)checkJumpMode {
    if (_jumpType == UIViewControllerJumpTypePresent || _jumpType == UIViewControllerJumpTypePush) {
        return YES;
    }
    return NO;
}
// 翻页动画一些设置
+ (CATransform3D)flipPageSetting:(UIView *)fromView {
    if ([self checkJumpMode]) {
        [self updateAnchorPointAndOffset:CGPointMake(0, 0.5) view:fromView];
        return CATransform3DMakeRotation(-M_PI_2, 0, 1, 0);
    }
        fromView.layer.transform = CATransform3DMakeRotation(-M_PI_2, 0.0, 1.0, 0.0);
        [self updateAnchorPointAndOffset:CGPointMake(0.0, 0.5) view:fromView];
        return CATransform3DMakeRotation(0, 0, 1, 0);
}
// 百叶窗动画设置
+ (CATransform3D)blindsSetting:(UIView *)fromView {
    if ([self checkJumpMode]) {
        fromView.layer.transform = CATransform3DMakeScale(1, 0.01, 1);
        return CATransform3DMakeScale(1, 1, 1);
    }
    return CATransform3DMakeScale(1, 0.01, 1);
}
// 动画完成后操作
+ (void)animationFinish:(UIView *)fromView toView:(UIView *)toView finish:(BOOL)finish {
    if (finish) {
        fromView.alpha = 1.0;
        toView.alpha = 1.0;
        [fromView removeFromSuperview];
        [toView.layer removeAllAnimations];
        [fromView.layer removeAllAnimations];
    }else {
        fromView.alpha = 1.0;
        toView.alpha = 0.0;
        [toView.layer removeAllAnimations];
        [fromView.layer removeAllAnimations];
    }

}
// 改变layer锚点
+ (void)updateAnchorPointAndOffset:(CGPoint)anchorPoint view:(UIView *)view{
    view.layer.anchorPoint = anchorPoint;
    view.layer.position    = CGPointMake([UIScreen mainScreen].bounds.size.width * anchorPoint.x, [UIScreen mainScreen].bounds.size.height * anchorPoint.y);
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
