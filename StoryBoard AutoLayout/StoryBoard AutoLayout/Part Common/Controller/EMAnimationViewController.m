//
//  EMAnimationViewController.m
//  StoryBoard AutoLayout
//
//  Created by Lemon on 2018/6/29.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "EMAnimationViewController.h"

@interface EMAnimationViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *swiOp;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *space;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightView;

@property (weak, nonatomic) IBOutlet UIView *rotateView;
@end

@implementation EMAnimationViewController
- (IBAction)swichClick:(id)sender {

    [self updateTestViewConstraints];
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}
- (IBAction)rotateClick:(id)sender {
    [self.rotateView.layer removeAllAnimations];
    [UIView animateWithDuration:0.25 animations:^{
        self.rotateView.transform = CGAffineTransformRotate(self.rotateView.transform, M_PI/4);
    }];
}

- (IBAction)rotate360:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.rotateView.transform = CGAffineTransformIdentity;
    if (sender.selected) {
        [self rotateView:self.rotateView];
    }else{
        [self.rotateView.layer removeAllAnimations];
    }
}


- (void)rotateView:(UIView *)view
{
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2.0];
    rotationAnimation.duration = 1;
    rotationAnimation.repeatCount = HUGE_VALF;
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateTestViewConstraints];
}

- (void)updateTestViewConstraints {
    if (self.swiOp.isOn) {
//        self.space.constant = 10.0;
        self.rightView.priority = UILayoutPriorityDefaultHigh+1;
    } else {
//        self.space.constant = self.view.frame.size.width;
        self.rightView.priority = UILayoutPriorityDefaultHigh-1;
    }
}


@end
