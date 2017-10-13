//
//  UIView+Additions.h
//  metalk_ios
//
//  Created by WangSuyan on 15/12/9.
//  Copyright © 2015年 张淼. All rights reserved.
//

#import <UIKit/UIKit.h>

#define WINDOW_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define WINDOW_WIDTH [UIScreen mainScreen].bounds.size.width

@interface UIView (Additions)

- (CGFloat)snf_x;
- (CGFloat)snf_y;
- (CGFloat)snf_width;
- (CGFloat)snf_height;

- (void)setSnf_x:(CGFloat)x;
- (void)setSnf_y:(CGFloat)y;
- (void)setSnf_width:(CGFloat)w;
- (void)setSnf_height:(CGFloat)h;

- (CGFloat)snf_boundsWidth;
- (CGFloat)snf_boundsHeight;
- (void)setSnf_boundsWidth:(CGFloat)w;
- (void)setSnf_boundsHeight:(CGFloat)h;


- (CGFloat)snf_left;
- (CGFloat)snf_top;
- (CGFloat)snf_right;
- (CGFloat)snf_bottom;
- (void)setSnf_top:(CGFloat)top;
- (void)setSnf_right:(CGFloat)right;
- (void)setSnf_bottom:(CGFloat)bottom;
- (void)setSnf_left:(CGFloat)left;
- (CGFloat)snf_centerX;
- (void)setSnf_centerX:(CGFloat)centerX;
- (CGFloat)snf_centerY;
- (void)setSnf_centerY:(CGFloat)centerY;
- (CGPoint)snf_origin;
- (void)setSnf_origin:(CGPoint)origin;
- (CGSize)snf_size;
- (void)setSnf_size:(CGSize)size;
- (CGPoint)snf_convertPoint:(CGPoint)point toViewOrWindow:(nullable UIView *)view;

@end
