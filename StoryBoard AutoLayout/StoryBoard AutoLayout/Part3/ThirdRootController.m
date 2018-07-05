//
//  ThirdRootController.m
//  StoryBoard AutoLayout
//
//  Created by Lemon on 2018/7/5.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "ThirdRootController.h"

@interface ThirdRootController ()

@end

@implementation ThirdRootController
- (IBAction)clicl:(id)sender {
    [self.navigationController pushViewController:[NSClassFromString(@"EMStatusViewController") new] animated:YES];
}

- (IBAction)codeRefrenceStoryBoadVc:(UIButton *)sender {
    UIStoryboard * secondStory = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
    UIViewController * vc = nil;
    switch (sender.tag) {
        case 0:
            vc = [secondStory instantiateViewControllerWithIdentifier:@"secondRootVc"];
            break;
        case 1:
            vc = [secondStory instantiateViewControllerWithIdentifier:@"secondYellowVc"];
             [vc setValue:@"代码跳转" forKey:@"vcTitle"];
            break;
        case 2:
            secondStory = [UIStoryboard storyboardWithName:@"First-AutoLayout" bundle:nil];
            vc = [secondStory instantiateInitialViewController];
            break;
        default:
            break;
    }
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

//手动segue
- (IBAction)segueManual:(id)sender {
    [self performSegueWithIdentifier:@"gotoYellowVc" sender:sender];
}


//
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(nullable id)sender{
    return YES;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UIButton class]]) {
    }
    UIViewController * vc = segue.destinationViewController;
    if ([vc  isKindOfClass:NSClassFromString(@"SecondYellowViewController")]) {
        if (((UIButton *)sender).tag == 100) {
             [vc setValue:@"segue跳转(手动触发)" forKey:@"vcTitle"];
        }else{
            [vc setValue:@"segue跳转" forKey:@"vcTitle"];
        }
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
