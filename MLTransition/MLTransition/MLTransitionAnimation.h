//
//  MLTransitionAnimation.h
//  MLTransition
//
//  Created by 磊 on 16/3/23.
//  Copyright © 2016年 磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MLBridgeBlock.h"

typedef NS_ENUM(NSInteger, UIViewControllerJumpType) {
    UIViewControllerJumpTypePush,
    UIViewControllerJumpTypePop,
    UIViewControllerJumpTypeModal,
    UIViewControllerJumpTypeDismiss
};
@interface MLTransitionAnimation : NSObject <UIViewControllerAnimatedTransitioning>

+ (instancetype)mlTransitionWithAnimationType:(UIViewAnimationType)type;
- (instancetype)initTransitionWithAnimationType:(UIViewAnimationType)type;


@end
