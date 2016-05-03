//
//  MLTransitionAnimation.h
//  MLTransition
//  动画类
//  Created by 磊 on 16/3/23.
//  Copyright © 2016年 磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MLBridgeBlock.h"

@interface MLTransitionAnimation : NSObject <UIViewControllerAnimatedTransitioning>

+ (instancetype)mlTransitionWithAnimationType:(UIViewAnimationType)type jumpType:(UIViewControllerJumpType)jumpType;
- (instancetype)initTransitionWithAnimationType:(UIViewAnimationType)type jumpType:(UIViewControllerJumpType)jumpType;


@end
