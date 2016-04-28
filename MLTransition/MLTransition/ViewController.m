//
//  ViewController.m
//  MLTransition
//
//  Created by 磊 on 15/11/10.
//  Copyright © 2015年 磊. All rights reserved.
//

#import "ViewController.h"
#import "MLSubmit.h"
#import "SecondViewController.h"
#import "MLTransition.h"
#import "MLPercentInteractiveTransition.h"
#define UISCREEN [UIScreen mainScreen].bounds.size

@interface ViewController ()<UIViewControllerAnimatedTransitioning>
@property(nonatomic ,strong)MLSubmit *submit;
@property(nonatomic, strong)MLPercentInteractiveTransition *percent;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatSubmit];
    
}

- (void)creatSubmit {
    
    UIImage *image = [UIImage imageNamed:@"button"];
    
    UIButton *submit = [[UIButton alloc]initWithFrame:CGRectMake(20, UISCREEN.height - 200, UISCREEN.width - 20 * 2, 60)];
    
    self.submit = submit;
//    submit.backgroundColor = [UIColor colorWithRed:1 green:0.f/255.0f blue:128.0f/255.0f alpha:1];
//    [submit setBackgroundImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
    
//    [submit setTitle:@"login" forState:UIControlStateNormal];
    
    [submit addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:submit];
}

- (void)login {
  SecondViewController *toController =  [[SecondViewController alloc]init];
//    self.percent = [[MLPercentInteractiveTransition alloc]init                               ];
//    [self.percent addPopGesture:toController];
//    [self presentViewController:toController animated:YES completion:nil];
    [self presentViewcontroller:toController animationType:UIViewAnimationTypeFlip completion:nil];
//    [self presentViewController:toController animated:YES completion:nil];
//    [self pushViewcontroller:[[SecondViewController alloc] init] animationType:UIViewAnimationTypeFall];
    
}
@end
