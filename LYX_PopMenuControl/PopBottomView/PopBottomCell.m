//
//  PopBottomCell.m
//  lyx
//
//  Created by apple on 2017/10/25.
//  Copyright © 2017年 seeday. All rights reserved.
//

#import "PopBottomCell.h"
#import "UIColor+Transform.h"

#define  ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define  ScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define lineColor_Values_shallow [UIColor getColor:@"ececec"]

@implementation PopBottomCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.lab_title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 55)];
        self.lab_title.font = [UIFont systemFontOfSize:15];
        self.lab_title.textColor = [UIColor getColor:@"333333"];
        self.lab_title.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.lab_title];
        
        UIView *viewLine = [[UIView alloc]initWithFrame:CGRectMake(15, 55-0.5, ScreenWidth-15*2, 0.5)];
        viewLine.backgroundColor = lineColor_Values_shallow;
        [self.contentView addSubview:viewLine];
        
        
    }
    return self;
}



@end
