//
//  MLPercentInteractiveTransition.h
//  MLTransition
//
//  Created by 磊 on 16/4/19.
//  Copyright © 2016年 磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLPercentInteractiveTransition : UIPercentDrivenInteractiveTransition
@property(nonatomic,assign)BOOL interacting;
- (void)addPushGesture:(UIViewController *)viewController;
- (void)addPopGesture:(UIViewController *)viewController;
@end
