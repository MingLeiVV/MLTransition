//
//  MLFileManager.m
//  MLTransition
//
//  Created by 磊 on 16/5/30.
//  Copyright © 2016年 磊. All rights reserved.
//

#import "MLFileManager.h"

@implementation MLFileManager

static id _instance;
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[MLFileManager alloc]init];
    });
    return _instance;
}

- (NSObject *)fileAnalyzeWithName:(NSString *)fileName suffix:(NSString *)suffix {
    NSString *pathStr = [[NSBundle mainBundle]pathForResource:fileName ofType:suffix];
    NSData *json = [NSData dataWithContentsOfFile:pathStr];
    
    NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
    
    if ([dataDict isKindOfClass:[NSDictionary class]]) {
        return dataDict;
    }
    else if ([dataDict isKindOfClass:[NSArray class]]) {
        return (NSArray *)dataDict;
    }
 
    return nil;
}
@end
