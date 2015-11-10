//
//  ViewController.m
//  MLTransition
//
//  Created by 磊 on 15/11/10.
//  Copyright © 2015年 磊. All rights reserved.
//

#import "ViewController.h"
#import "MLSubmit.h"
#define UISCREEN [UIScreen mainScreen].bounds.size

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatSubmit];
}

- (void)creatSubmit {
    
    MLSubmit *submit = [[MLSubmit alloc]initWithFrame:CGRectMake(20, UISCREEN.height - 100, UISCREEN.width - 20 * 2, 40)];
    
    submit.backgroundColor = [UIColor colorWithRed:1 green:0.f/255.0f blue:128.0f/255.0f alpha:1];
    
    [submit setTitle:@"login" forState:UIControlStateNormal];
    
    [submit addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:submit];
}

- (void)login {
    
    
}
@end
