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
#import "UIViewController+MLSegue.h"
#define UISCREEN [UIScreen mainScreen].bounds.size

@interface ViewController ()
@property(nonatomic ,strong)MLSubmit *submit;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatSubmit];
}

- (void)creatSubmit {
    
    MLSubmit *submit = [[MLSubmit alloc]initWithFrame:CGRectMake(20, UISCREEN.height - 100, UISCREEN.width - 20 * 2, 40)];
    
    self.submit = submit;
    submit.backgroundColor = [UIColor colorWithRed:1 green:0.f/255.0f blue:128.0f/255.0f alpha:1];
    
    [submit setTitle:@"login" forState:UIControlStateNormal];
    
    [submit addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:submit];
}

- (void)login {
    
    [self presentViewController:[[SecondViewController alloc]init] loadingDuration:1 transitionDuration:1 formViewAlpha:1 toViewAlpha:1 completion:nil];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self presentViewController:[[SecondViewController alloc]init] animated:YES completion:nil];
//    });
    
//    [_submit setLoadingDuration:2 transitionDuration:2 formViewAlpha:0 toViewAlpha:0.4 completion:^{
//        
//        
//    }];
}
@end
