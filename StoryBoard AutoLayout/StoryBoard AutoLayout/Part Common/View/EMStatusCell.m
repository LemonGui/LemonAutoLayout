//
//  EMStatusCell.m
//  StoryBoard AutoLayout
//
//  Created by Lemon on 2018/6/28.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "EMStatusCell.h"

@interface EMStatusCell()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellTopMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleTopMargin;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *postContentView;
@property (weak, nonatomic) IBOutlet UIImageView *largeImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageBottom;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation EMStatusCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconView.layer.cornerRadius = self.iconView.frame.size.width/2;
}


-(void)setTitle:(NSString *)title{
    _title = title;
    NSMutableAttributedString * att = [self attString:title lineSpace:6 font:18 color:[UIColor blackColor]];
    self.titleView.attributedText = att;
    if (title.length == 0) {
        self.titleTopMargin.constant = 0;
    }else{
        self.titleTopMargin.constant = 10;
    }
}

-(void)setContentText:(NSString *)contentText{
    _contentText = contentText;
    
    NSMutableAttributedString * att = [self attString:contentText lineSpace:6 font:16 color:[UIColor grayColor]];
    self.postContentView.attributedText = att;
}

-(void)setImageUrl:(NSString *)imageUrl{
    _imageUrl = imageUrl;
    if (imageUrl.length > 0) {
        self.largeImageView.image = [UIImage imageNamed:@"girl"];
        self.imageH.constant = 100;
        self.imageBottom.constant = 10;
    }else{
        self.largeImageView.image = nil;
        self.imageH.constant = 0;
        self.imageBottom.constant = 0;
    }
}

- (void)setIndexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
    if (indexPath.row == 0) {
        self.cellTopMargin.constant = 0;
    }else{
        self.cellTopMargin.constant = 10;
    }
}

-(NSMutableAttributedString *)attString:(NSString *)string lineSpace:(CGFloat)lineSpace font:(CGFloat)font color:(UIColor *)color{
    
    NSMutableParagraphStyle * style =  [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpace;
    style.lineBreakMode = NSLineBreakByTruncatingTail;

//    style.minimumLineHeight = [UIFont systemFontOfSize:font].lineHeight;
//    style.maximumLineHeight = [UIFont systemFontOfSize:font].lineHeight;
//    NSBaselineOffsetAttributeName
    NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font],NSForegroundColorAttributeName:color,NSParagraphStyleAttributeName:style}];
    return attStr;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
}

@end
