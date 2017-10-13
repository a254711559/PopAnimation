//
//  UIView+Additions.m
//  metalk_ios
//
//  Created by WangSuyan on 15/12/9.
//  Copyright © 2015年 张淼. All rights reserved.
//

#import "UIView+Additions.h"

@implementation UIView (Additions)

- (CGFloat)snf_boundsWidth{
    return CGRectGetWidth(self.bounds);
}

- (CGFloat)snf_boundsHeight{
    return CGRectGetHeight(self.bounds);
}

- (void)setSnf_boundsWidth:(CGFloat)w{
    CGRect frame = self.bounds;
    frame.size.width = w;
    self.bounds = frame;
}

- (void)setSnf_boundsHeight:(CGFloat)h{
    CGRect frame = self.bounds;
    frame.size.height = h;
    self.bounds = frame;
}

- (CGFloat)snf_x{
    return CGRectGetMinX(self.frame);
}

- (CGFloat)snf_y{
    return CGRectGetMinY(self.frame);
}

- (CGFloat)snf_width{
    return CGRectGetWidth(self.frame);
}

- (CGFloat)snf_height{
    return CGRectGetHeight(self.frame);
}

- (void)setSnf_x:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setSnf_y:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setSnf_width:(CGFloat)w{
    CGRect frame = self.frame;
    frame.size.width = w;
    self.frame = frame;
}

- (void)setSnf_height:(CGFloat)h{
    CGRect frame = self.frame;
    frame.size.height = h;
    self.frame = frame;
}

- (CGFloat)snf_centerX {
    return CGRectGetMidX(self.frame);
}

- (void)setSnf_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)snf_centerY {
    return CGRectGetMidY(self.frame);
}

- (void)setSnf_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)snf_origin {
    return self.frame.origin;
}



- (void)setSnf_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)snf_size {
    return self.frame.size;
}

- (void)setSnf_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGFloat)snf_left {
    return CGRectGetMinX(self.frame);
}

- (void)setSnf_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)snf_top {
    return CGRectGetMinY(self.frame);
}

- (void)setSnf_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)snf_right {
    return CGRectGetMaxX(self.frame);
}

- (void)setSnf_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)snf_bottom {
    return CGRectGetMaxY(self.frame);;
}

- (void)setSnf_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGPoint)snf_convertPoint:(CGPoint)point toViewOrWindow:(UIView *)view {
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertPoint:point toWindow:nil];
        } else {
            return [self convertPoint:point toView:nil];
        }
    }
    
    UIWindow *from = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    UIWindow *to = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    if ((!from || !to) || (from == to)) return [self convertPoint:point toView:view];
    point = [self convertPoint:point toView:from];
    point = [to convertPoint:point fromWindow:from];
    point = [view convertPoint:point fromView:to];
    return point;
}
@end
