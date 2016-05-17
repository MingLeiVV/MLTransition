//
//  BasicTableViewController.m
//  MLTransition
//
//  Created by 磊 on 16/5/17.
//  Copyright © 2016年 磊. All rights reserved.
//

#import "BasicTableViewController.h"
#import "ViewController.h"
@interface BasicTableViewController ()

@end

@implementation BasicTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[ViewController viewControllerWithPushType:UIViewAnimationTypeGradient popType:UIViewAnimationTypeGradient] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[ViewController viewControllerWithPushType:UIViewAnimationTypeZoom popType:UIViewAnimationTypeZoom] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[ViewController viewControllerWithPushType:UIViewAnimationTypeScale popType:UIViewAnimationTypeScale] animated:YES];
            break;
        case 3:
            [self.navigationController pushViewController:[ViewController viewControllerWithPushType:UIViewAnimationTypeFall popType:UIViewAnimationTypeFall] animated:YES];
            break;
        case 4:
            [self.navigationController pushViewController:[ViewController viewControllerWithPushType:UIViewAnimationTypeSlideOut popType:UIViewAnimationTypeSlideOut] animated:YES];
            break;
        case 5:
            [self.navigationController pushViewController:[ViewController viewControllerWithPushType:UIViewAnimationTypeFlipPage popType:UIViewAnimationTypeFlipPage] animated:YES];
            break;
        case 6:
            [self.navigationController pushViewController:[ViewController viewControllerWithPushType:UIViewAnimationTypeFlip popType:UIViewAnimationTypeFlip] animated:YES];
            break;
        case 7:
            [self.navigationController pushViewController:[ViewController viewControllerWithPushType:UIViewAnimationTypeCubeFlip popType:UIViewAnimationTypeCubeFlip] animated:YES];
            break;
        case 8:
            [self.navigationController pushViewController:[ViewController viewControllerWithPushType:UIViewAnimationTypeStack popType:UIViewAnimationTypeStack] animated:YES];
            break;
        case 9:
            [self.navigationController pushViewController:[ViewController viewControllerWithPushType:UIViewAnimationTypeRipple popType:UIViewAnimationTypeRipple] animated:YES];
            break;
        case 10:
            [self.navigationController pushViewController:[ViewController viewControllerWithPushType:UIViewAnimationTypeBlinds popType:UIViewAnimationTypeBlinds] animated:YES];
            break;
            }
}

@end
