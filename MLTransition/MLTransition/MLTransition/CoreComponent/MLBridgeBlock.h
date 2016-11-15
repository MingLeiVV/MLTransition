//
//  MLBridgeBlock.h
//  MLTransition
//  block动画
//  Created by 磊 on 16/4/7.
//  Copyright © 2016年 磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_OPTIONS(NSInteger, UIViewAnimationType) {
    UIViewAnimationTypeNone     = 1,
    UIViewAnimationTypeGradient = 1 << 1,//  渐变
    UIViewAnimationTypeZoom     = 1 << 2,// 放大
    UIViewAnimationTypeScale    = 1 << 3,// 缩小
    UIViewAnimationTypeFall     = 1 << 4,// 落下
    UIViewAnimationTypeSlideOut = 1 << 5,// 滑出
    UIViewAnimationTypeFlipPage = 1 << 6,// 翻页
    UIViewAnimationTypeFlip     = 1 << 7,// 翻转
    UIViewAnimationTypeCubeFlip = 1 << 8,// 立体翻转
    UIViewAnimationTypeStack    = 1 << 9,// 堆叠
    UIViewAnimationTypeRipple   = 1 << 10,// 水滴/涟波
    UIViewAnimationTypeBlinds   = 1 << 11,// 百叶窗
    UIViewAnimationTypeTile     = 1 << 12// 平铺
    
};
typedef NS_ENUM(NSInteger, UIViewControllerJumpType) {
    UIViewControllerJumpTypePush,
    UIViewControllerJumpTypePop,
    UIViewControllerJumpTypePresent,
    UIViewControllerJumpTypeDismiss
};
typedef BOOL (^completion)();
typedef void(^animationType)(UIView *containerView,UIView *fromView,UIView *toView,UIViewController *toController,UIViewController *fromController);
@interface MLBridgeBlock : NSObject
+ (animationType)mlGetAnimationWithType:(UIViewAnimationType)type jumpType:(UIViewControllerJumpType)jumpType completion:(completion)finish;
@end
