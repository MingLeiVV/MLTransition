//
//  ComplexTableViewController.m
//  MLTransition
//
//  Created by 磊 on 16/5/17.
//  Copyright © 2016年 磊. All rights reserved.
//

#import "ComplexTableViewController.h"
#import "ViewController.h"
@interface ComplexTableViewController ()

@end

@implementation ComplexTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[ViewController viewControllerWithPushType:UIViewAnimationTypeFall popType:UIViewAnimationTypeSlideOut] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[ViewController viewControllerWithPushType:UIViewAnimationTypeFlipPage popType:UIViewAnimationTypeGradient] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[ViewController viewControllerWithPushType:UIViewAnimationTypeStack popType:UIViewAnimationTypeFlip] animated:YES];
            break;
        case 3:
            [self.navigationController pushViewController:[ViewController viewControllerWithPushType:UIViewAnimationTypeCubeFlip popType:UIViewAnimationTypeRipple] animated:YES];
            break;
        case 4:
            [self.navigationController pushViewController:[ViewController viewControllerWithPushType:UIViewAnimationTypeBlinds popType:UIViewAnimationTypeScale] animated:YES];
            break;
    }
}
@end
