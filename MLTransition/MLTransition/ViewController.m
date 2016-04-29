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

@interface ViewController ()
@property(nonatomic ,strong)MLSubmit *submit;
@property(nonatomic, strong)MLPercentInteractiveTransition *percent;
@property(nonatomic, strong)SecondViewController *secondViewController;
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
//    self.percent = [[MLPercentInteractiveTransition alloc]init                               ];
//    [self.percent addPopGesture:toController];
//    [self presentViewController:toController animated:YES completion:nil];
//    self.direction = kMLTransitionFromTop;
//    [self presentViewcontroller:self.secondViewController animationType:UIViewAnimationTypeRipple completion:nil];
    [self presentViewcontroller:self.secondViewController animations:^(UIView *containerView, UIView *fromView, UIView *toView, Completion completion) {
        [fromView addSubview:toView];
        CATransition *transition = [CATransition animation];
        fromView.alpha = 1.0;
        toView.alpha = 0.5;
        transition.type = @"cube";
        transition.duration = 2.0;
        [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionTransitionNone animations:^{
            [fromView.layer addAnimation:transition forKey:nil];
            fromView.alpha = 0.7;
            toView.alpha = 1.0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                fromView.alpha = 1.0;
            } completion:^(BOOL finished) {
                [containerView addSubview:toView];
                completion();
            }];
            
        }];
    }];
//    [self presentViewController:toController animated:YES completion:nil];
//    [self pushViewcontroller:[[SecondViewController alloc] init] animationType:UIViewAnimationTypeFall];
}

- (SecondViewController *)secondViewController {
    if (!_secondViewController) {
        _secondViewController = [[SecondViewController alloc]init];
    }
    return _secondViewController;
}
@end
