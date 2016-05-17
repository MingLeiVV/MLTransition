//
//  ViewController.h
//  MLTransition
//
//  Created by 磊 on 15/11/10.
//  Copyright © 2015年 磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLTransition.h"
@interface ViewController : UIViewController
+ (instancetype)viewControllerWithPushType:(UIViewAnimationType)pushType popType:(UIViewAnimationType)popType;
- (instancetype)initWithPushType:(UIViewAnimationType)pushType popType:(UIViewAnimationType)popType;
@end

