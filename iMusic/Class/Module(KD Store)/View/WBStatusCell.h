//
//  WBStatusCell.h
//  iMusic
//
//  Created by Mark Lewis on 17-6-23.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBStatusFrame;
@interface WBStatusCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) WBStatusFrame *statusFrame;

@end
