//
//  MLSubmit.m
//  MLLoginTransition
//
//  Created by 磊 on 15/11/9.
//  Copyright © 2015年 磊. All rights reserved.
//

#import "MLSubmit.h"

@implementation MLSubmit

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


- (void)setUp {

    CGFloat radius = self.bounds.size.height * 0.5;
    self.layer.cornerRadius = radius;
    self.clipsToBounds = YES;
}

@end
