//
//  SecondViewController.m
//  MLTransition
//
//  Created by 磊 on 15/11/10.
//  Copyright © 2015年 磊. All rights reserved.
//

#import "SecondViewController.h"
#import "UIViewController+MLSegue.h"
@interface SecondViewController ()
@property(nonatomic ,strong)UIImageView *imageView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    [self setUp];
    
}
- (BOOL)hidesBottomBarWhenPushed {
    return  YES;
}
- (void)setUp {

    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Home"]];
    
    self.imageView = imageView;
    
    [self.view addSubview:self.imageView];
    
    
    imageView.frame = self.view.bounds;
    
    self.imageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeCurrentView)];
    
    tap.numberOfTapsRequired = 1;
    
    [self.view addGestureRecognizer:tap];

}
- (void)closeCurrentView {
//    [self popViewcontrollerAnimationType:UIViewAnimationTypeSlideOut];
//    [self dismissViewcontrollerAnimationType:UIViewAnimationTypeGradient completion:nil];
    [self dismissViewcontrollerAnimationType:UIViewAnimationTypeFlip completion:nil];
}
@end
