//
//  EMModifyConstrainsController.m
//  StoryBoard AutoLayout
//
//  Created by Lemon on 2018/7/17.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "EMModifyConstrainsController.h"

@interface EMModifyConstrainsController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstains;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation EMModifyConstrainsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)modifyCons:(id)sender {
    
    [self.view removeConstraint:self.widthConstains];
    NSLayoutConstraint * new  = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0/4 constant:0];
    
//    NSLayoutConstraint * new  = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:300];
    self.widthConstains = new;
    [self.view addConstraint:new];
}
- (IBAction)modifyConstant:(id)sender {
    self.widthConstains.constant = 50;
}

@end
