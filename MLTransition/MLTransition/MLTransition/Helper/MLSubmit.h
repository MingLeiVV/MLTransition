//
//  MLSubmit.h
//  MLLoginTransition
//
//  Created by 磊 on 15/11/9.
//  Copyright © 2015年 磊. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^Completion)();
@interface MLSubmit : UIButton

- (void)loadEndCompletion:(Completion)completion;


@end

