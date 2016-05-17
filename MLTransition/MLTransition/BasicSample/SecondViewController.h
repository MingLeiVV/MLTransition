//
//  SecondViewController.h
//  MLTransition
//
//  Created by 磊 on 15/11/10.
//  Copyright © 2015年 磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLTransition.h"
@interface SecondViewController : UIViewController
+ (instancetype)viewControllerWithJump:(UIViewControllerJumpType)jumpType Type:(UIViewAnimationType)type;
- (instancetype)initWithJump:(UIViewControllerJumpType)jumpType Type:(UIViewAnimationType)type;
@end
