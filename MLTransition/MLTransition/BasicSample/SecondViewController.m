//
//  SecondViewController.m
//  MLTransition
//
//  Created by 磊 on 15/11/10.
//  Copyright © 2015年 磊. All rights reserved.
//

#import "SecondViewController.h"
@interface SecondViewController ()
@property(nonatomic ,strong)UIImageView *imageView;
@property(nonatomic, assign)UIViewControllerJumpType jumpType;
@property(nonatomic, assign)UIViewAnimationType type;
@end

@implementation SecondViewController

+ (instancetype)viewControllerWithJump:(UIViewControllerJumpType)jumpType Type:(UIViewAnimationType)type {
    return [[self alloc]initWithJump:jumpType Type:type];
}
- (instancetype)initWithJump:(UIViewControllerJumpType)jumpType Type:(UIViewAnimationType)type {
    if(self = [super init]) {
        self.jumpType = jumpType;
        self.type = type;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    
}
- (BOOL)hidesBottomBarWhenPushed {
    return  YES;
}
- (void)setUp {
    self.title = @"点击屏幕返回";
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
    if (_jumpType == UIViewControllerJumpTypePush) {
        [self popViewcontrollerAnimationType:_type];
    }else if(_jumpType == UIViewControllerJumpTypePresent){
         [self dismissViewcontrollerAnimationType:_type completion:nil];   
    }
}
@end
