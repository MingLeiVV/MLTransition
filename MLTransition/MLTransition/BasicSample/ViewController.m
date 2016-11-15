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
#import "MLPercentInteractiveTransition.h"
#define UISCREEN [UIScreen mainScreen].bounds.size

@interface ViewController ()
@property(nonatomic ,strong)MLSubmit *submit;
@property(nonatomic, strong)SecondViewController *secondViewController;
@property(nonatomic, assign)UIViewAnimationType push;
@property(nonatomic, assign)UIViewAnimationType pop;
@end

@implementation ViewController

+ (instancetype)viewControllerWithPushType:(UIViewAnimationType)pushType popType:(UIViewAnimationType)popType {
    return [[self alloc]initWithPushType:pushType popType:popType];
}
- (instancetype)initWithPushType:(UIViewAnimationType)pushType popType:(UIViewAnimationType)popType {
    if(self = [super init]) {
        self.push = pushType;
        self.pop = popType;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBackGroundImage];
    [self creatSubmit];
}

- (void)initBackGroundImage {
    UIImageView *bgImgView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:bgImgView];
    bgImgView.image = [UIImage imageNamed:@"login"];
}
- (void)creatSubmit {
    
    UIImage *image = [UIImage imageNamed:@"button"];
    
    UIButton *submit = [[UIButton alloc]initWithFrame:CGRectMake(20, UISCREEN.height - 200, UISCREEN.width - 20 * 2, 60)];
    
    self.submit = submit;
//    submit.backgroundColor = [UIColor colorWithRed:1 green:0.f/255.0f blue:128.0f/255.0f alpha:1];
//    [submit setBackgroundImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
//    
//    [submit setTitle:@"login" forState:UIControlStateNormal];
    
    [submit addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:submit];
}

- (void)login {
//    self.percent = [[MLPercentInteractiveTransition alloc]init                               ];
//    [self.percent addPopGesture:toController];
//    [self presentViewcontroller:self.secondViewController animationType:_push completion:nil];
    /**
     *  仿原始调用，简单的不能再简单
     */
    self.direction = kMLTransitionFromTop;
    [self presentViewcontroller:self.secondViewController animationType:_push completion:nil];
//    [self pushViewcontroller:self.secondViewController animationType:_push];
}

- (SecondViewController *)secondViewController {
    if (!_secondViewController) {
        // 只用作示例，方便演示，pop或者dismiss动画方式完全可以写在本身调用上。
        _secondViewController = [SecondViewController viewControllerWithJump:UIViewControllerJumpTypePresent Type:_pop];
    }
    return _secondViewController;
}
@end
