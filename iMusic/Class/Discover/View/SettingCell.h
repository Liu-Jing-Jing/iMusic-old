//
//  SettingCell.h
//  Weibo Demo
//
//  Created by Mark Lewis on 16-8-23.
//  Copyright (c) 2016年 MarkLewis. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingItem;
@interface SettingCell : UITableViewCell
@property (nonatomic, strong) SettingItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
