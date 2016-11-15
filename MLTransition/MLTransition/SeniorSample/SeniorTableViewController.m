//
//  SeniorTableViewController.m
//  MLTransition
//
//  Created by 磊 on 16/5/30.
//  Copyright © 2016年 磊. All rights reserved.
//

#import "SeniorTableViewController.h"
#import "CellForTransitionTableViewController.h"
@interface SeniorTableViewController ()

@end

@implementation SeniorTableViewController

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
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[CellForTransitionTableViewController new] animated:YES];
    }
}
@end
