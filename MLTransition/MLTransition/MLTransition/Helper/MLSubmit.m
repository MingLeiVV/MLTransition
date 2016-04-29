//
//  MLSubmit.m
//  MLLoginTransition
//
//  Created by 磊 on 15/11/9.
//  Copyright © 2015年 磊. All rights reserved.
//

#import "MLSubmit.h"
#import "MLSphere.h"


@interface MLSubmit ()<UIViewControllerAnimatedTransitioning>

@property(nonatomic ,strong)MLSphere *sphereARC;
@property(nonatomic ,copy)Completion block;


@end

@implementation MLSubmit


- (void)loadEndCompletion:(Completion)completion{

    _block = completion;
    [self jumpTransition];
}
- (void)jumpTransition {

    [_sphereARC stopAnimation];
    [_sphereARC removeFromSuperlayer];
    self.userInteractionEnabled = YES;
    
    CABasicAnimation *windowSpecial = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    windowSpecial.fromValue = @(1);
    
    windowSpecial.toValue = @(100);
    
    windowSpecial.duration = 0.5;
    
    windowSpecial.repeatCount = 1;
    
     windowSpecial.delegate = self;
    
    windowSpecial.removedOnCompletion = NO;
    
    [self.layer addAnimation:windowSpecial forKey:windowSpecial.keyPath];
}
- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUp];
    }
    
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {

    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        [self setUp];
    }
    return self;
}

#pragma mark - initialization
- (void)setUp {

    CGFloat radius = self.bounds.size.height * 0.5;
    self.layer.cornerRadius = radius;
    self.clipsToBounds = YES;
    [self addTarget:self action:@selector(scaleTransition) forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
    [self addTarget:self action:@selector(resetTransition) forControlEvents:UIControlEventTouchDragExit];
    [self addTarget:self action:@selector(loadTransition) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark - animationTransition
- (void)scaleTransition {

    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.1 options:0 animations:^{
        
         self.transform = CGAffineTransformScale(self.transform, 0.9, 0.9);
        
    } completion:nil];
}

- (void)resetTransition {

    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.1 options:0 animations:^{
        
        [self clearTransform:self];
        
    } completion:nil];
}
// 鼠标抬起开始加载
- (void)loadTransition {

    self.userInteractionEnabled = NO;
    [self clearTransform:self];
    CABasicAnimation *sphere = [CABasicAnimation animationWithKeyPath:@"bounds.size.width"];
   
    [self.layer addSublayer:self.sphereARC];
    sphere.fromValue = @(self.bounds.size.width);
    sphere.toValue = @(self.bounds.size.height);
    sphere.repeatDuration = 0.5;
    sphere.fillMode = kCAFillModeForwards;
    sphere.repeatCount = 1;
    sphere.removedOnCompletion = NO;
    [self.layer addAnimation:sphere forKey:sphere.keyPath];

    [self.sphereARC startAnimation];
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

    CABasicAnimation *animation = (CABasicAnimation *)anim;
    
    if ([animation.keyPath isEqualToString:@"transform.scale"]) {
        
        [self.layer removeAllAnimations];
        _block();
    }
    
}

// 清除transform属性
- (void)clearTransform:(UIView *)object {

    object.transform = CGAffineTransformIdentity;
}

#pragma mark - lazyLoad
- (MLSphere *)sphereARC {

    if (!_sphereARC) {
        _sphereARC = [[MLSphere alloc]initWithFrame:self.frame];
    }
    
    return _sphereARC;
}
@end




