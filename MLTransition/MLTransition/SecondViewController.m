//
//  SecondViewController.m
//  MLTransition
//
//  Created by 磊 on 15/11/10.
//  Copyright © 2015年 磊. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    [self setUp];
}

- (void)setUp {

    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Home"]];
    
    [self.view addSubview:imageView];
    
    imageView.frame = self.view.bounds;
    
    imageView.userInteractionEnabled = YES;
}

@end
