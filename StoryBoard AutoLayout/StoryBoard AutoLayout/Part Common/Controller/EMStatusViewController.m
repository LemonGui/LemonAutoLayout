//
//  EMStatusViewController.m
//  StoryBoard AutoLayout
//
//  Created by Lemon on 2018/6/28.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "EMStatusViewController.h"
#import "EMStatusCell.h"
@interface EMStatusViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *statusTableView;
@property (nonatomic, strong) NSArray * dataArray;

@end

@implementation EMStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.statusTableView registerNib:[UINib nibWithNibName:@"EMStatusCell" bundle:nil] forCellReuseIdentifier:@"sss"];
    _statusTableView.rowHeight = UITableViewAutomaticDimension;
    _statusTableView.estimatedRowHeight = 100.0f;
    
    NSString * jsonPath = [[NSBundle mainBundle]pathForResource:@"status" ofType:@"json"] ;
    NSData * jsonData = [[NSData alloc] initWithContentsOfFile:jsonPath];
    NSMutableDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    self.dataArray = jsonDic[@"re"];
  
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    EMStatusCell * cell = [tableView dequeueReusableCellWithIdentifier:@"sss"];
    NSDictionary * dataDetail = self.dataArray[indexPath.row];
    NSString * title = [dataDetail objectForKey:@"post_title"];
    NSString * content = [dataDetail objectForKey:@"post_content"];
    NSString * imageUrl = [dataDetail objectForKey:@"post_image"];
    cell.title = title;
    cell.contentText = content;
    cell.imageUrl = imageUrl;
    cell.indexPath = indexPath;
    return cell;
}

-(void)setVcTitle:(NSString *)vcTitle{
    _vcTitle = vcTitle;
    self.title = vcTitle;
}

@end
