//
//  GPTransitionAnimator.m
//  controllerTransitionAnimaitonDemo
//
//  Created by 李广鹏 on 16/6/30.
//  Copyright © 2016年 李广鹏. All rights reserved.
//

#import "GPTransitionAnimator.h"

@implementation GPTransitionAnimator


// 自定义动画时长
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.4;
}

// 核心动画，自定义动画效果. 当控制器切换的时候，执行此方法，生成动画上下文.
// A->B A称之为From控制器，B称之为To控制器。同理 B->A B为from A为to
// 可以通过 UITransitionContextFromViewControllerKey/UITransitionContextToViewControllerKey 获取到切换的from 与 to控制器
// 注意： containerView 相当于容器视图，需要将toView加到此上面
// 在方法最后 一定要执行 [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    
    // 获取 from to viewcontroller
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 获取容器视图 containerView
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toViewController.view];
    
    
    // 设置动画
    toViewController.view.alpha = 1.0;
    toViewController.view.frame = CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 200);
    
    
    UIView *backView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    backView.backgroundColor = [UIColor blackColor];
    backView.alpha = 0.4;
    [toViewController.view.superview insertSubview:backView atIndex:1];
    
    
    [UIView animateWithDuration:0.4 animations:^{
        
        fromViewController.view.transform = CGAffineTransformMakeScale(0.9, 0.9);
    } completion:^(BOOL finished) {
        
    }];
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
        toViewController.view.frame = [UIScreen mainScreen].bounds;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        [backView removeFromSuperview];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
    
    
}

@end
