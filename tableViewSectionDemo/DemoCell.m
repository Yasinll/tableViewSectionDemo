//
//  DemoCell.m
//  tableViewSectionDemo
//
//  Created by PatrickY on 2018/3/16.
//  Copyright © 2018年 PatrickY. All rights reserved.
//

#import "DemoCell.h"

@implementation DemoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        //设置cell
        CGFloat cellHeight = self.frame.size.height;
        
        CGFloat imageViewHeight = 28;
        CGFloat imageViewWidth = 39;
        CGFloat imageViewLeftView = 300;
        
        _myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewLeftView, (cellHeight - imageViewHeight) / 2, imageViewWidth, imageViewHeight)];
        
        CGFloat labelHeight = 21;
        CGFloat labelWidth = 120;
        CGFloat labelLeftView = 15;
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(labelLeftView, (cellHeight - labelHeight) / 2, labelWidth, labelHeight)];
        
        [self addSubview:_myImageView];
        [self addSubview:_label];
        
    }
    
    return self;
    
}


@end
