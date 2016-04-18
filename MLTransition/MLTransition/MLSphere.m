//
//  MLSphere.m
//  MLTransition
//
//  Created by 磊 on 15/11/10.
//  Copyright © 2015年 磊. All rights reserved.
//

#import "MLSphere.h"
#import <UIKit/UIKit.h>

@implementation MLSphere

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super init];
    
    if (self) {
        
        self.frame = CGRectMake(0, 0, frame.size.height, frame.size.height);
        [self setUp];
        
    }
    
    return self;
}

- (void)setUp {
    
    CGFloat radius = self.bounds.size.width * 0.5 * 0.6;
    
    CGPoint circleCenter = CGPointMake(self.bounds.size.width * 0.5 , self.bounds.size.width * 0.5);
    
    CGFloat startAngle = 0;
    
    CGFloat endAngle = M_PI * 2;
    
    self.strokeColor = [UIColor whiteColor].CGColor;
    
    self.fillColor = [UIColor clearColor].CGColor;
    
    self.strokeStart = 0;
    
    self.strokeEnd = 0.4;
    
    self.lineWidth = 1;
    

    self.path = [UIBezierPath bezierPathWithArcCenter:circleCenter radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES].CGPath;
}

- (void)startAnimation {
    
    CABasicAnimation *start = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    start.fromValue = 0;
    
    start.toValue = @(2 * M_PI);
    
    start.duration = 0.4;
    
    start.repeatCount = MAXFLOAT;
    
    start.removedOnCompletion = NO;
    
    [self addAnimation:start forKey:start.keyPath];
}

- (void)stopAnimation {

    [self removeAllAnimations];
}
@end
