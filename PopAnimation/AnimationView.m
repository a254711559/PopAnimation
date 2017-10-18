//
//  AnimationView.m
//  PopAnimation
//
//  Created by 田向阳 on 2017/10/12.
//  Copyright © 2017年 田向阳. All rights reserved.
//

#import "AnimationView.h"

static CGFloat bootomHeight = 300.f;

@interface AnimationView ()

@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIVisualEffectView *effectView;

@end

@implementation AnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
#pragma mark - function
- (void)buttonTouchDown:(UIButton *)button
{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        button.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }];
}

- (void)buttonTouchOutside:(UIButton *)button
{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        button.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

- (void)buttonTouchCancle:(UIButton *)button
{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        button.transform = CGAffineTransformMakeScale(1, 1);
    }];
    [self hideView];
}

- (void)buttonClick:(UIButton *)button
{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        button.transform = CGAffineTransformMakeScale(1, 1);
    }];
    [self hideView];
}

- (void)showInView:(UIView *)view
{
    if (!view) {
        return;
    }
    
    [view addSubview:self];
    self.frame = view.bounds;
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.effectView.alpha = 1;
    }];
    
    [self.bottomView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [UIView animateWithDuration:kAnimationDuration delay:idx * 0.03 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            obj.snf_y -= bootomHeight - 10;
            obj.transform = CGAffineTransformMakeScale(1.2, 1.2);
            obj.alpha = 1;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:kAnimationDuration animations:^{
                obj.transform = CGAffineTransformMakeScale(1, 1);
                obj.snf_y += 10;
            }];
        }];
    }];
    
}

- (void)hideView
{
    self.viewWillDisappear? self.viewWillDisappear() : nil;
    NSInteger count = self.bottomView.subviews.count;
    [UIView animateWithDuration:kAnimationDuration * ceil(count/4.0) animations:^{
        self.effectView.alpha = 0;
    }];
    [self.bottomView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [UIView animateWithDuration:kAnimationDuration delay:idx * 0.03 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            obj.snf_y += bootomHeight;
            obj.transform = CGAffineTransformMakeScale(0.8, 0.8);
            obj.alpha = 0;
        } completion:^(BOOL finished) {
            if (idx == count - 1) {
                [self removeFromSuperview];
            }
        }];
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.bottomView.frame = CGRectMake(0, self.snf_height - bootomHeight, self.snf_width, bootomHeight);
    self.effectView.frame = self.bounds;
}

#pragma mark - CreateUI
- (void)createUI
{
    self.effectView = ({
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        effectView.userInteractionEnabled = YES;
        effectView.alpha = 0;
        [effectView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideView)]];
        [self addSubview:effectView];
        effectView;
    });
    
    self.bottomView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:view];
        view;
    });
    
    CGFloat space = 10;
    NSInteger clumn = 4;
    CGFloat width = (WINDOW_WIDTH - (clumn + 1) * space)/clumn;
    
    for (int i = 0; i < 8; i ++ ) {
        int m = i/4;
        int n = i%4;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(n*(width + space) + space, m*(width + space) + space + bootomHeight, width,width);
        [button setImage:[UIImage imageNamed:@(i%4+1).stringValue] forState:0];
        [button setImage:[UIImage imageNamed:@(i%4+1).stringValue] forState:UIControlStateHighlighted];
        button.transform = CGAffineTransformMakeScale(0.8, 0.8);
        button.alpha = 0;
        [button addTarget:self action:@selector(buttonTouchDown:) forControlEvents:UIControlEventTouchDown];
        [button addTarget:self action:@selector(buttonTouchDown:) forControlEvents:UIControlEventTouchDragInside];
        [button addTarget:self action:@selector(buttonTouchOutside:) forControlEvents:UIControlEventTouchDragOutside];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(buttonTouchCancle:) forControlEvents:UIControlEventTouchUpOutside];

        [self.bottomView addSubview:button];
    }
    
}

@end
