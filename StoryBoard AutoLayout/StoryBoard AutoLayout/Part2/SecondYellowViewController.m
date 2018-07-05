//
//  SecondYellowViewController.m
//  StoryBoard AutoLayout
//
//  Created by Lemon on 2018/7/5.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "SecondYellowViewController.h"

@interface SecondYellowViewController ()

@end

@implementation SecondYellowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setVcTitle:(NSString *)vcTitle{
    _vcTitle =  vcTitle;
    self.title = vcTitle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
