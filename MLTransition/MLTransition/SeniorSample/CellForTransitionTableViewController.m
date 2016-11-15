//
//  CellForTransitionTableViewController.m
//  MLTransition
//
//  Created by 磊 on 16/5/30.
//  Copyright © 2016年 磊. All rights reserved.
//

#import "CellForTransitionTableViewController.h"
#import "MLFileManager.h"
#import "MLFeedEntity.h"
#import "MLFeedCell.h"
#import "MLTextViewController.h"
#import "MLTransition.h"

@interface CellForTransitionTableViewController ()
@property(nonatomic, strong)NSArray *dataList;
@end
typedef void(^callBack)(NSArray *list);
@implementation CellForTransitionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 200;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self requestData:^(NSArray *list) {
        self.dataList = list;
        [self.tableView reloadData];
    }];
}
- (void)requestData:(callBack)completion {
dispatch_async(dispatch_get_global_queue(0, 0), ^{
   NSDictionary *dataDict = (NSDictionary *)[[MLFileManager sharedInstance]fileAnalyzeWithName:@"data" suffix:@"json"];
    
    NSArray *feed = [dataDict objectForKey:@"feed"];
    NSMutableArray *list = [[NSMutableArray alloc]initWithCapacity:feed.count];
    for (NSDictionary *data in feed) {
        [list addObject:[[MLFeedEntity alloc] initWithDictionary:data]];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        completion(list.copy);
    });
});
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MLFeedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"feedCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MLFeedCell" owner:nil options:nil]firstObject];
    }
    cell.feedEntity = self.dataList[indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  CGRect cellRect = [tableView rectForRowAtIndexPath:indexPath];
    CGRect screenRect = CGRectMake(cellRect.origin.x,
                                   cellRect.origin.y - tableView.contentOffset.y,
                                   cellRect.size.width,
                                   cellRect.size.height);
    MLTextViewController *textVC = [MLTextViewController new];
    textVC.animationRect = screenRect;
    [self pushViewcontroller:textVC animations:^(UIView *containerView, UIView *fromView, UIView *toView, Completion completion) {
        [containerView addSubview:toView];
        CGRect toViewFrame = toView.frame;
        toView.frame = screenRect;
        fromView.alpha = 0.5;
        toView.alpha = 0.3;
        [UIView animateWithDuration:0.8 animations:^{
            toView.alpha = 1.0;
            toView.frame = toViewFrame;
        } completion:^(BOOL finished) {
            fromView.alpha = 1.0;
            [fromView removeFromSuperview];
            completion();
        }];
    }];
}
@end
