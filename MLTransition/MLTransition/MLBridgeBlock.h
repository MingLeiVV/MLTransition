//
//  MLBridgeBlock.h
//  MLTransition
//
//  Created by 磊 on 16/4/7.
//  Copyright © 2016年 磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_OPTIONS(NSInteger, UIViewAnimationType) {
    UIViewAnimationTypeNone     = 0,
    UIViewAnimationTypeGradient = 1 << 0,//  渐变
    UIViewAnimationTypeZoom     = 1 << 1,// 放大
    UIViewAnimationTypeScale    = 1 << 2,// 缩小
    UIViewAnimationTypeFall     = 1 << 3,// 落下
    UIViewAnimationTypeSlideOut = 1 << 4// 滑出
};
typedef void(^completion)();
typedef void(^animationType)(UIView *fromView,UIView *toView);
@interface MLBridgeBlock : NSObject
+ (animationType)mlGetAnimationWithType:(UIViewAnimationType)type completion:(completion)finish;
@end
