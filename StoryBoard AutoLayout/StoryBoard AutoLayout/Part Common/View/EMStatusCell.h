//
//  EMStatusCell.h
//  StoryBoard AutoLayout
//
//  Created by Lemon on 2018/6/28.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMStatusCell : UITableViewCell
@property (nonatomic,strong) NSIndexPath * indexPath;
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * contentText;
@end
