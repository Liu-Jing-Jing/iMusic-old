//
//  WBWeiboTool.m
//  Weibo Demo
//
//  Created by Mark Lewis on 16-8-22.
//  Copyright (c) 2016年 MarkLewis. All rights reserved.
//

#import "WBWeiboTool.h"
#import "WBNewFeatureController.h"
#import "MKLTabBarViewController.h"

@implementation WBWeiboTool

// 选择根控制器
+ (void)chooseRootViewController
{
    
    // 添加转场动画
    CATransition *anim = [CATransition animation];
    anim.type = @"rippleEffect";
    anim.duration = 0.5;
    //    anim.subtype = kCATransitionFromRight;
    //    anim.startProgress = 0.0;
    //    anim.endProgress = 0.5;
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:anim forKey:nil];
    
    // 取出版本号
    NSString *key = @"CFBundleVersion";
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *LastVersion = [defaults stringForKey:key];
    
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    if ([currentVersion isEqualToString:LastVersion])
    {
        // 显示状态栏
        [UIApplication sharedApplication].statusBarHidden = NO;
        // if(![[UIApplication sharedApplication].keyWindow.rootViewController isKindOfClass:[MKLTabBarViewController class]])
        [UIApplication sharedApplication].keyWindow.rootViewController = [[MKLTabBarViewController alloc]init];
    }
    else
    { //不是最新
        [UIApplication sharedApplication].keyWindow.rootViewController = [[WBNewFeatureController alloc]init];
        
        // 设置成最新
        [defaults setObject:currentVersion forKey:key];
        [defaults synchronize];
    }
    
}


@end
