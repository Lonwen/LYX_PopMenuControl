//
//  PopBottomView.m
//  lyx
//
//  Created by apple on 2017/10/25.
//  Copyright © 2017年 seeday. All rights reserved.
//

#import "PopBottomView.h"
#import "PopBottomCell.h"
#import "UIColor+Transform.h"

#define  ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define  ScreenHeight ([UIScreen mainScreen].bounds.size.height)

@implementation PopBottomView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.bounds = [UIScreen mainScreen].bounds;
        self.alpha = 0.0;
        self.backgroundColor = [UIColor blackColor];
        
        //
        self.view_bg = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight-275, ScreenWidth, 275)];
        self.view_bg.backgroundColor = [UIColor whiteColor];
        self.view_bg.alpha = 0.0;
        //
        
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 275)];
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view_bg addSubview:self.tableView];
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapBgAction:)];
        tap.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

-(void)setData:(NSArray *)data{
    if (data.count > 0) {
        
        _data = data;
        CGFloat height_ = _data.count * 55;
        
        CGRect rect_bg = self.view_bg.frame;
        rect_bg.size.height = height_;
        rect_bg.origin.y = ScreenHeight - height_;
        [self.view_bg setFrame: rect_bg];
        
        CGRect rect_tb = self.tableView.frame;
        rect_tb.size.height = height_;
        [self.tableView setFrame: rect_tb];
        
        [self.tableView reloadData];
        
    }
}


#pragma mark----tableView Delegate or dataSource------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentify = @"cellIdentify";
    PopBottomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (cell == nil) {
        cell = [[PopBottomCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentify];
    }
    
    if (indexPath.row == self.data.count -1) {
        cell.lab_title.textColor = self.cancelColor?self.cancelColor:[UIColor getColor:@"333333"];
    }else{
        cell.lab_title.textColor = [UIColor getColor:@"333333"];
    }
    //
    cell.lab_title.text = _data[indexPath.row][@"name"];
    //
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == _data.count - 1) {
        [self removeOperateView];
    }else{
        self.blockCallBackIndex(_data[indexPath.row]);
        [self removeOperateView];
    }
}


-(void)viewShow{
    //
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [[UIApplication sharedApplication].keyWindow addSubview:self.view_bg];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0.5;
        self.view_bg.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
    //
}


-(void)removeOperateView{
    
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0.0;
        self.view_bg.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.view_bg removeFromSuperview];
    }];
}


#pragma mark-----action-------
-(void)tapBgAction:(UITapGestureRecognizer *)tap{
    
    [self removeOperateView];
}


@end
