//
//  GPSecondViewController.m
//  controllerTransitionAnimaitonDemo
//
//  Created by 李广鹏 on 16/6/30.
//  Copyright © 2016年 李广鹏. All rights reserved.
//



#import "GPSecondViewController.h"

#define width = [UIScreen mainScreen].bounds.size.width
#define height = [UIScreen mainScreen].bounds.size.height
@interface GPSecondViewController ()

@end

@implementation GPSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    UILabel *desLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    desLabel.font = [UIFont systemFontOfSize:20];
    desLabel.textColor = [UIColor blueColor];
    desLabel.center = self.view.center;
    desLabel.text = @"B Controller";
    [self.view addSubview:desLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
