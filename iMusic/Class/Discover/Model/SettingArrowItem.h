//
//  SettingArrowItem.h
//  Weibo Demo
//
//  Created by Mark Lewis on 16-8-23.
//  Copyright (c) 2016年 MarkLewis. All rights reserved.
//

#import "SettingItem.h"

@interface SettingArrowItem : SettingItem

// 点击cell 运行的控制器
@property (nonatomic, assign) Class destVcClass;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;
@end
