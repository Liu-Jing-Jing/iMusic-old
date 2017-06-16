//
//  SettingGroup.h
//  Weibo Demo
//
//  Created by Mark Lewis on 16-8-23.
//  Copyright (c) 2016年 MarkLewis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingGroup : NSObject
// 头部标题
@property (nonatomic, copy) NSString *header;
// 尾部标题
@property (nonatomic, copy) NSString *footer;
// 存放settingitem的数组
@property (nonatomic, copy) NSArray *items;

@end
