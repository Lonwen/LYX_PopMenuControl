//
//  ViewController.m
//  LYX_PopMenuControl
//
//  Created by lyx on 2017/12/8.
//  Copyright © 2017年 lyx. All rights reserved.
//

#import "ViewController.h"
#import "PopBottomView.h"

#define  ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define  ScreenHeight ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *bnt = [UIButton buttonWithType:UIButtonTypeSystem];
    bnt.frame = CGRectMake(ScreenWidth/2-60/2, 150, 60, 40);
    [bnt setTitle:@"pop" forState:0];
    [bnt setTitleColor:[UIColor redColor] forState:0];
    [bnt addTarget:self action:@selector(popAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bnt];
    
    
}

-(void)popAction:(UIButton *)sender{
    
    NSArray *array = @[@{@"name":@"中国",@"id":@"1"},@{@"name":@"美国"},@{@"name":@"日本"},@{@"name":@"取消选择"}];
    
    PopBottomView *pop = [[PopBottomView alloc]initWithFrame:self.view.frame];
    pop.cancelColor = [UIColor redColor];
    pop.data = array;
    pop.blockCallBackIndex = ^(NSDictionary *dictionary){
        NSLog(@"index = %@",dictionary);
    };
    [pop viewShow];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
