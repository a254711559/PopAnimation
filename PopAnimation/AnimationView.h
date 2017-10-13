//
//  AnimationView.h
//  PopAnimation
//
//  Created by 田向阳 on 2017/10/12.
//  Copyright © 2017年 田向阳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Additions.h"

#define  kAnimationDuration  0.18

@interface AnimationView : UIView

@property (nonatomic, copy) void(^viewWillDisappear)(void);

- (void)showInView:(UIView *)view;
- (void)hideView;

@end
