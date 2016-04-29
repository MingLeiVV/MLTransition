//
//  MLCustomTransition.h
//  MLTransition
//
//  Created by 磊 on 16/4/8.
//  Copyright © 2016年 磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^Completion)();
typedef void(^animationBlock)(UIView *containerView,UIView *fromView,UIView *toView,Completion completion);
@interface MLCustomTransition : NSObject<UIViewControllerAnimatedTransitioning>
+ (instancetype)mlTransitionWithAnimations:(animationBlock)animations;
- (instancetype)initTransitionWithAnimations:(animationBlock)animations;

@end
