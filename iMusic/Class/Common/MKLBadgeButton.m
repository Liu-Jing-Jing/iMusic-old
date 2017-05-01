//
//  MKLBadgeButton.m
//  iMusic
//
//  Created by Mark Lewis on 17-5-1.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import "MKLBadgeButton.h"

@implementation MKLBadgeButton


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        self.userInteractionEnabled = NO;
        [self setBackgroundImage:[UIImage resizedImageWithName:@"main_badge"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:11];
    }
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    // #warning copy
    // _badgeValue = badgeValue;
    _badgeValue = [badgeValue copy];
    
    if (badgeValue) {
        self.hidden = NO;
        // 设置文字
        [self setTitle:badgeValue forState:UIControlStateNormal];
        
        // 设置frame
        CGRect frame = self.frame;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        if (badgeValue.length > 1)
        {
            // 文字的尺寸
            CGSize badgeSize;
#ifdef __IPHONE_7_0
            NSDictionary *attributesDict = @{NSFontAttributeName:self.titleLabel.font};
            badgeW = [badgeValue sizeWithAttributes:attributesDict].width;
#else
            badgeW = [badgeValue sizeWithFont:self.titleLabel.font];
#endif
            badgeW = badgeSize.width + 10;
        }
        frame.size.width = badgeW;
        frame.size.height = badgeH;
        self.frame = frame;
    } else {
        self.hidden = YES;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
