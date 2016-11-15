//
//  MLFileManager.h
//  MLTransition
//
//  Created by 磊 on 16/5/30.
//  Copyright © 2016年 磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLFileManager : NSObject
+ (instancetype)sharedInstance;

- (NSObject *)fileAnalyzeWithName:(NSString *)fileName suffix:(NSString *)suffix;
@end
