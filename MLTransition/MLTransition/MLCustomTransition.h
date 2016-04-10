//
//  MLCustomTransition.h
//  MLTransition
//
//  Created by 磊 on 16/4/8.
//  Copyright © 2016年 磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^Completion)();
@interface MLCustomTransition : NSObject

- (instancetype)initTransitionDuration:(CFTimeInterval)transitionT formViewAlpha:(CGFloat)formAlpha toViewAlpha:(CGFloat)toAlpha isDismiss:(BOOL)isDismiss completion:(Completion)completion;
@end
