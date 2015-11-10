//
//  MLTransition.h
//  MLTransition
//
//  Created by 磊 on 15/11/10.
//  Copyright © 2015年 磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MLTransition : NSObject <UIViewControllerAnimatedTransitioning>


- (void)setTransitionDuration:(CGFloat)transitionT formViewAlpha:(CGFloat)formAlpha toViewAlpha:(CGFloat)toAlpha;

@end
