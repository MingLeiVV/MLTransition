//
//  MLTextViewController.m
//  MLTransition
//
//  Created by 磊 on 16/5/31.
//  Copyright © 2016年 磊. All rights reserved.
//

#import "MLTextViewController.h"
#import "UIView+Position.h"
#import "MLTransition.h"

@interface MLTextViewController ()<UIScrollViewDelegate>
@property(nonatomic, strong)UIWebView *webView;
@property(nonatomic, strong)UILabel   *closeTipLabel;
@property(nonatomic, strong)UIImageView   *closeTipView;
@end

@implementation MLTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
- (void)setupUI {
    self.webView = ({
        UIWebView *webView = [UIWebView new];
        webView.frame = self.view.bounds;
        webView.scrollView.delegate = self;
        webView.backgroundColor = [UIColor whiteColor];
        NSURLRequest *requst = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
        [webView loadRequest:requst];
        webView;
    });
    self.view = self.webView;
    [self.webView addSubview:({
        self.closeTipView = [UIImageView new];
        self.closeTipView.hidden = YES;
        self.closeTipView.frame = CGRectMake(self.webView.centerX - 80, [UIScreen mainScreen].bounds.size.height - 30, 30, 30);
        self.closeTipView;
    })];
    [self.webView addSubview:({
        self.closeTipLabel = [UILabel new];
        self.closeTipLabel.hidden = YES;
        self.closeTipLabel.textColor = [UIColor lightGrayColor];
        self.closeTipLabel.frame = CGRectMake(CGRectGetMaxX(self.closeTipView.frame), CGRectGetMinY(self.closeTipView.frame), 0, 0);
        self.closeTipLabel;
    })];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.bounds;
    CGSize size = scrollView.contentSize;
    UIEdgeInsets inset = scrollView.contentInset;
    CGFloat currentOffset = offset.y + bounds.size.height - inset.bottom;
    CGFloat maximumOffset = size.height;
    if(currentOffset - maximumOffset > _closeTipView.height && currentOffset - maximumOffset <= 80){
        self.closeTipView.image = [UIImage imageNamed:@"release-ic-close"];
        [self.closeTipView sizeToFit];
        self.closeTipLabel.text = @"上拉关闭此页";
        [self.closeTipLabel sizeToFit];
        self.closeTipLabel.hidden = NO;
        self.closeTipView.hidden = NO;
    }else if (currentOffset - maximumOffset > 80){
        self.closeTipView.image = [UIImage imageNamed:@"pullup-ic-close"];
        [self.closeTipView sizeToFit];
        self.closeTipLabel.text = @"松开关闭此页";
        [self.closeTipLabel sizeToFit];
        self.closeTipLabel.hidden = NO;
        self.closeTipView.hidden = NO;
    }else {
        self.closeTipLabel.hidden = YES;
        self.closeTipView.hidden = YES;
    }
    if (scrollView.isDecelerating && currentOffset - maximumOffset > 80) {
        [self popViewcontrollerAnimations:^(UIView *containerView, UIView *fromView, UIView *toView, Completion completion) {
            [containerView addSubview:toView];
            fromView.alpha = 1.0;
            toView.alpha = 0.2;
            [UIView animateWithDuration:0.8 animations:^{
                fromView.frame = self.animationRect;
                toView.alpha = 1.0;
            } completion:^(BOOL finished) {
                [fromView removeFromSuperview];
                completion();
            }];
        }];
    }
}
@end
