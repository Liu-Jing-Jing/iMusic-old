//
//  WBSubtitleItem.m
//  iMusic
//
//  Created by Mark Lewis on 17-6-26.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import "WBSubtitleItem.h"

@implementation WBSubtitleItem
+ (WBSubtitleItem *)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle
{
    WBSubtitleItem *item = [[WBSubtitleItem alloc]init];
    item.title = title;
    item.subtitle = subtitle;
    
    return item;
}

+ (WBSubtitleItem *)itemWithTitle:(NSString *)title imageName:(NSString *)imageName
{
    WBSubtitleItem *item = [[WBSubtitleItem alloc]init];
    item.title = title;
    item.image = [UIImage imageWithName:imageName];
    
    return item;
}

+ (WBSubtitleItem *)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle imageName:(NSString *)imageName
{
    WBSubtitleItem *item = [WBSubtitleItem itemWithTitle:title subtitle:subtitle];
    item.image = [UIImage imageWithName:imageName];
    return item;
}

@end
