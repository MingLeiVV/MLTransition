//
//  MLPercentInteractiveTransition.h
//  MLTransition
//
//  Created by 磊 on 16/4/19.
//  Copyright © 2016年 磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLTransition.h"
@interface MLPercentInteractiveTransition : UIPercentDrivenInteractiveTransition
@property(nonatomic,assign)BOOL interacting;
@property(nonatomic, assign)UIViewAnimationType type;
- (void)addPopGesture:(UIViewController *)viewController popType:(UIViewAnimationType)type;
@end
