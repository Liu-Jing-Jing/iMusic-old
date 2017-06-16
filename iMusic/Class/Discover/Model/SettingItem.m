//
//  SettingItem.m
//  Weibo Demo
//
//  Created by Mark Lewis on 16-8-23.
//  Copyright (c) 2016年 MarkLewis. All rights reserved.
//

#import "SettingItem.h"

@implementation SettingItem
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    SettingItem *item = [[self alloc]init];
    item.icon = icon;
    item.title = title;
    return item;
}
+ (instancetype)itemWithTitle:(NSString *)title
{
    SettingItem *item = [[self alloc]init];
    item.title = title;
    return item;
}

@end
