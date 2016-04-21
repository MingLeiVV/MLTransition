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
    UIViewAnimationTypeSlideOut = 1 << 4,// 滑出
    UIViewAnimationTypeFlipPage = 1 << 5,// 翻页
    UIViewAnimationTypeFlip     = 1 << 6,// 翻转
    UIViewAnimationTypeCubeFlip = 1 << 7,// 立体翻转
    UIViewAnimationTypeStack    = 1 << 8,// 堆叠
    UIViewAnimationTypeRipple   = 1 << 9// 水滴/涟波
    
};
typedef NS_ENUM(NSInteger, UIViewControllerJumpType) {
    UIViewControllerJumpTypePush,
    UIViewControllerJumpTypePop,
    UIViewControllerJumpTypePresent,
    UIViewControllerJumpTypeDismiss
};
typedef void(^completion)();
typedef void(^animationType)(UIView *containerView,UIView *fromView,UIView *toView,UIViewController *toController);
@interface MLBridgeBlock : NSObject
+ (animationType)mlGetAnimationWithType:(UIViewAnimationType)type jumpType:(UIViewControllerJumpType)jumpType completion:(completion)finish;
@end
