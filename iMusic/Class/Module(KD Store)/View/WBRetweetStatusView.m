//
//  WBRetweetStatusView.m
//  iMusic
//
//  Created by Mark Lewis on 17-7-5.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import "WBRetweetStatusView.h"
#import "WBStatus.h"
#import "WBUserModel.h"
#import "WBStatusFrame.h"
#import "WBPhoto.h"
#import "WBPhotosView.h"
#import "UIImageView+WebCache.h"


@interface WBRetweetStatusView()
/** 被转发微博作者的昵称 */
@property (nonatomic, weak) UILabel *retweetNameLabel;
/** 被转发微博的正文\内容 */
@property (nonatomic, weak) UILabel *retweetContentLabel;
/** 被转发微博的配图 */
@property (nonatomic, weak) WBPhotosView *retweetPhotosView;
@end

@implementation WBRetweetStatusView



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.userInteractionEnabled = YES;
        // 1.设置被转发微博的背景图片
        UIImage *bgImage = [UIImage imageNamed:@"timeline_retweet_bg"];
        self.image = [bgImage stretchableImageWithLeftCapWidth:bgImage.size.width*0.9 topCapHeight:bgImage.size.height*0.5];
        
        
        // 2.被转发微博作者的昵称
        UILabel *retweetNameLabel = [[UILabel alloc] init];
        retweetNameLabel.font = WBRetweetStatusNameFont;
        retweetNameLabel.textColor = MKLColor(67, 107, 163);
        retweetNameLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:retweetNameLabel];
        self.retweetNameLabel = retweetNameLabel;
        
        
        // 3.被转发微博的正文\内容
        UILabel *retweetContentLabel = [[UILabel alloc] init];
        retweetContentLabel.font = WBRetweetStatusContentFont;
        retweetContentLabel.backgroundColor = [UIColor clearColor];
        retweetContentLabel.numberOfLines = 0;
        retweetContentLabel.textColor = MKLColor(90, 90, 90);
        [self addSubview:retweetContentLabel];
        self.retweetContentLabel = retweetContentLabel;
        
        
        // 4.被转发微博的配图
        WBPhotosView *retweetPhotosView = [[WBPhotosView alloc] init];
        [self addSubview:retweetPhotosView];
        self.retweetPhotosView = retweetPhotosView;
        
    }
    return self;
}

- (void)setStatusFrame:(WBStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    WBStatus *retweetStatus = statusFrame.status.retweeted_status;
    WBUserModel *user = retweetStatus.user;
    
    // 1.昵称
    self.retweetNameLabel.text = [NSString stringWithFormat:@"@%@", user.name];
    self.retweetNameLabel.frame = self.statusFrame.retweetNameLabelF;
    
    // 2.正文
    self.retweetContentLabel.text = retweetStatus.text;
    self.retweetContentLabel.frame = self.statusFrame.retweetContentLabelF;
    
    // 3.配图
    if (retweetStatus.pic_urls.count)
    {
        self.retweetPhotosView.hidden = NO;
        self.retweetPhotosView.frame = self.statusFrame.retweetPhotosViewF;
        self.retweetPhotosView.photos = retweetStatus.pic_urls;
    }
    else
    {
        self.retweetPhotosView.hidden = YES;
    }
}


- (UIImage *)stretchableImageWithNamed:(NSString *)name
{
    
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
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
