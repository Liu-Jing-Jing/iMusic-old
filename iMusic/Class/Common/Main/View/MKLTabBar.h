//
//  MKLTabBar.h
//  iMusic
//
//  Created by Mark Lewis on 17-5-1.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MKLTabBar;

@protocol MKLTabBarDelegate <NSObject>
@optional
- (void)tabBar:(MKLTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to;
@end


@interface MKLTabBar : UIView
- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property (nonatomic, weak) id<MKLTabBarDelegate> delegate;
@end
