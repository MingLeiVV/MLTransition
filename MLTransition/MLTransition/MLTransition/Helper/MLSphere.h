//
//  MLSphere.h
//  MLTransition
//
//  Created by 磊 on 15/11/10.
//  Copyright © 2015年 磊. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface MLSphere : CAShapeLayer

- (instancetype)initWithFrame:(CGRect)frame;

- (void)startAnimation;

- (void)stopAnimation;

@end
