//
//  MLTransition.m
//  MLTransition
//
//  Created by 磊 on 15/11/10.
//  Copyright © 2015年 磊. All rights reserved.
//

#import "MLTransition.h"

@interface MLTransition ()

@property(nonatomic ,assign)CFTimeInterval transitionDuration;
@property(nonatomic ,assign)CGFloat formAlpha;
@property(nonatomic ,assign)CGFloat toAlpha;

@end
@implementation MLTransition 


- (void)setTransitionDuration:(CGFloat)transitionT formViewAlpha:(CGFloat)formAlpha toViewAlpha:(CGFloat)toAlpha {
 
    _transitionDuration = transitionT;
    _formAlpha = formAlpha;
    _toAlpha = toAlpha;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
 
    
}
@end
