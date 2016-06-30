//
//  GPMainViewController.m
//  controllerTransitionAnimaitonDemo
//
//  Created by 李广鹏 on 16/6/30.
//  Copyright © 2016年 李广鹏. All rights reserved.
//

#import "GPMainViewController.h"
#import "GPSecondViewController.h"
#import "GPTransitionAnimator.h"


#define width = [UIScreen mainScreen].bounds.size.width
#define height = [UIScreen mainScreen].bounds.size.height
@interface GPMainViewController () <UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>

@end

@implementation GPMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 40);
    button.center = self.view.center;
    [button setTitle:@"push动画效果" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    // 1. 设置navigation 代理，捕捉push动作
    self.navigationController.delegate = self;
    
    
}

- (void)pushAction:(UIButton *) sender
{
    
    GPSecondViewController *secondVC = [[GPSecondViewController alloc] init];
    
    //  如果是模态 需要设置 transitioningDelegate
//     secondVC.transitioningDelegate = self;
    
    [self.navigationController pushViewController:secondVC animated:YES];
    
}

// 2. 实现 navigationDelegate 方法
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    
    // 3. 自定义类，此类需要实现 UIViewControllerAnimatedTransitioning 代理方法，实现自定义控制器转换的动画。
    
    // 4. 判断是否是 push 和 pop
    if (operation == UINavigationControllerOperationPush) {
            return [[GPTransitionAnimator alloc] init];
    }
    if (operation == UINavigationControllerOperationPop) {
        return nil;
    }
    return nil;
}


#pragma mark - 模态切换切换
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    // present
    return [[GPTransitionAnimator alloc] init];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    // dismiss
    return [[GPTransitionAnimator alloc] init];
}



    
    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
