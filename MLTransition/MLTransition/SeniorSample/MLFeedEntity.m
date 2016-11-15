//
//  MLFeedEntity.m
//  MLTransition
//
//  Created by 磊 on 16/5/30.
//  Copyright © 2016年 磊. All rights reserved.
//

#import "MLFeedEntity.h"

@implementation MLFeedEntity
- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = super.init;
    if (self) {
        _title = dictionary[@"title"];
        _content = dictionary[@"content"];
        _username = dictionary[@"username"];
        _time = dictionary[@"time"];
        _imageName = dictionary[@"imageName"];
    }
    return self;
}
@end
