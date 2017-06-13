//
//  MKLMainNavigationController.m
//  iMusic
//
//  Created by Mark Lewis on 17-6-7.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import "MKLMainNavigationController.h"

@interface MKLMainNavigationController ()

@end

@implementation MKLMainNavigationController

/**
 *  第一次使用这个类的时候会调用(1个类只会调用1次)
 */
+ (void)initialize
{
    // 1.设置导航栏主题
    [self setupNavBarTheme];
    
    // 2.设置导航栏按钮主题
    [self setupBarButtonItemTheme];
}

/**
 *  设置导航栏按钮主题
 */
+ (void)setupBarButtonItemTheme
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置背景
    if (!iOS7)
    {
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_disable"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
        
//        [item setBackButtonBackgroundImage:<#(UIImage *)#> forState:<#(UIControlState)#> barMetrics:<#(UIBarMetrics)#>]
    }
    
    // 设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[UITextAttributeTextColor] = iOS7 ? [UIColor orangeColor] : [UIColor grayColor];
    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    textAttrs[UITextAttributeFont] = [UIFont systemFontOfSize:iOS7 ? 14 : 12];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
    
    // 设置返回按钮的颜色
    //    [item setBackButtonBackgroundImage:[UIImage resizedImageWithName:@"navigationbar_back"]
    //                              forState:UIControlStateNormal
    //                            barMetrics:UIBarMetricsDefault];
    //    [item setBackButtonBackgroundImage:[UIImage imageWithName:@"navigationbar_back_highlighted"]
    //                              forState:UIControlStateHighlighted
    //                            barMetrics:UIBarMetricsDefault];

}

/**
 *  设置导航栏主题
 */
+ (void)setupNavBarTheme
{
    // 取出appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 设置背景
    if (!iOS7) {
        [navBar setBackgroundImage:[UIImage imageWithName:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    }
    
    // 设置标题属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[UITextAttributeTextColor] = [UIColor blackColor];
    // 去掉导航栏Bar上文字的阴影效果
    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    textAttrs[UITextAttributeFont] = [UIFont boldSystemFontOfSize:19];
    [navBar setTitleTextAttributes:textAttrs];
    
    
    [navBar setTintColor:[UIColor orangeColor]];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.viewControllers.count > 0) viewController.hidesBottomBarWhenPushed = YES;
    // 调用父类的方法
    [super pushViewController:viewController animated:animated];
}

@end
