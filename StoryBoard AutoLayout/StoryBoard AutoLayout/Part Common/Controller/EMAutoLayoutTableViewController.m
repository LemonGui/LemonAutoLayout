//
//  EMAutoLayoutTableViewController.m
//  StoryBoard AutoLayout
//
//  Created by Lemon on 2018/6/28.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "EMAutoLayoutTableViewController.h"

#define TITLE_KEY @"TITLE_KEY"
#define CLASSNAME_KEY @"CLASSNAME_KEY"
@interface EMAutoLayoutTableViewController ()
@property (nonatomic,strong) NSArray * titleData;

@end

@implementation EMAutoLayoutTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.titleData = @[@{TITLE_KEY:@"基本使用",CLASSNAME_KEY:@"EMSimpleUseViewController"},
                       @{TITLE_KEY:@"设置比例",CLASSNAME_KEY:@"EMScaleViewController"},
                       @{TITLE_KEY:@"修改约束",CLASSNAME_KEY:@"EMModifyConstrainsController"},
                       @{TITLE_KEY:@"TableView自动布局",CLASSNAME_KEY:@"EMStatusViewController"},
                       @{TITLE_KEY:@"动画",CLASSNAME_KEY:@"EMAnimationViewController"}];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    cell.textLabel.text = self.titleData[indexPath.row][TITLE_KEY];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * className = self.titleData[indexPath.row][CLASSNAME_KEY];
    UIViewController * vc = [NSClassFromString(className) new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
