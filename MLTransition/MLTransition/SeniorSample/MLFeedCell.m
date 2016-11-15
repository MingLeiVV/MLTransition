//
//  MLFeedCell.m
//  MLTransition
//
//  Created by 磊 on 16/5/30.
//  Copyright © 2016年 磊. All rights reserved.
//

#import "MLFeedCell.h"
#import "MLFeedEntity.h"

@interface MLFeedCell ()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UIImageView *map;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *date;

@end
@implementation MLFeedCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setFeedEntity:(MLFeedEntity *)feedEntity {
    _feedEntity = feedEntity;
    _title.text = _feedEntity.title;
    _content.text = _feedEntity.content;
    _map.image = [UIImage imageNamed:_feedEntity.imageName];
    [_map sizeToFit];
    _name.text = _feedEntity.username;
    _date.text = _feedEntity.time;
}



@end
