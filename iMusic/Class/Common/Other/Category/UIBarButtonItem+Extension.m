//
//  UIBarButtonItem+Extension.m
//  iMusic
//
//  Created by Mark Lewis on 17-6-9.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageWithName:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithName:highIcon] forState:UIControlStateHighlighted];
    button.frame = (CGRect){CGPointZero, button.currentBackgroundImage.size};
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
@end
