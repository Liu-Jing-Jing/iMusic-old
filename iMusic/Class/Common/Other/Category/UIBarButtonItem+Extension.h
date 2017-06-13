//
//  UIBarButtonItem+Extension.h
//  iMusic
//
//  Created by Mark Lewis on 17-6-9.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;
@end
