//
//  WBSubtitleItem.h
//  iMusic
//
//  Created by Mark Lewis on 17-6-26.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import "RETableViewItem.h"

@interface WBSubtitleItem : RETableViewItem

@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) UIFont *subtitleFont;
@property (nonatomic, assign) NSTextAlignment subtitleAlignment;

+ (WBSubtitleItem *)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle;

+ (WBSubtitleItem *)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle imageName:(NSString *)imageName;

+ (WBSubtitleItem *)itemWithTitle:(NSString *)title imageName:(NSString *)imageName;

@end
