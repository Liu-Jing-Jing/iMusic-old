//
//  MKLTabBarViewController.m
//  iMusic
//
//  Created by Mark Lewis on 17-5-1.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import "MKLTabBarViewController.h"
#import "MKLMainNavigationController.h"
#import "MKLHomeViewController.h"
#import "MKLMessageViewController.h"
#import "MKLDiscoverViewController.h"
#import "MKLMeViewController.h"
#import "MKLTabBar.h"
@interface MKLTabBarViewController ()<MKLTabBarDelegate>
/**
 *  自定义的tabbar
 */
@property (nonatomic, weak) MKLTabBar *customTabBar;
@end

@implementation MKLTabBarViewController


/**
 *  初始化tabbar
 */
- (void)setupTabbar
{
    MKLTabBar *customTabBar = [[MKLTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */
- (void)tabBar:(MKLTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to
{
    self.selectedIndex = to;
}

/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildViewControllers
{
    // 1.首页
    MKLHomeViewController *home = [[MKLHomeViewController alloc] init];
    [self setupChildViewController:home title:@"Friend" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    // 2.消息
    MKLMessageViewController *message = [[MKLMessageViewController alloc] init];
    [self setupChildViewController:message title:@"Message" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    // 3.广场
    MKLDiscoverViewController *discover = [[MKLDiscoverViewController alloc] init];
    [self setupChildViewController:discover title:@"Discover" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    // 4.我
    MKLMeViewController *me = [[MKLMeViewController alloc] init];
    [self setupChildViewController:me title:@"Profile" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
}

/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    childVc.title = title;
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    if (iOS7)
    {
        childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; // 不要渲染成系统的颜色
    }
    else
    {
        childVc.tabBarItem.selectedImage = selectedImage;
    }
    
    // 2.包装一个导航控制器
    MKLMainNavigationController *nav = [[MKLMainNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    // 3.添加tabbar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}

#pragma ViewController Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 初始化tabbar
    [self setupTabbar];
    
    // 初始化所有的子控制器
    [self setupAllChildViewControllers];
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews)
    {
        if ([child isKindOfClass:[UIControl class]])
        {
            [child removeFromSuperview];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}
@end
