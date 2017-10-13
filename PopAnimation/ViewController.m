//
//  ViewController.m
//  PopAnimation
//
//  Created by 田向阳 on 2017/10/12.
//  Copyright © 2017年 田向阳. All rights reserved.
//

#import "ViewController.h"
#import "AnimationView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)go:(UIButton *)sender {
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        sender.transform = CGAffineTransformMakeRotation(M_PI);
    }];
    
    AnimationView *aniView = [[AnimationView alloc] initWithFrame:self.view.bounds];
    [aniView showInView:self.view];
    UIButton *weakSender = sender;
    aniView.viewWillDisappear = ^{
        [UIView animateWithDuration:kAnimationDuration animations:^{
            weakSender.transform =CGAffineTransformIdentity;
        }];
    };
}


@end
