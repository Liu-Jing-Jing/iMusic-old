//
//  WBPhotoView.m
//  iMusic
//
//  Created by Mark Lewis on 17-7-5.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import "WBPhotoView.h"
#import "WBPhoto.h"
#import "UIImageView+WebCache.h"


@interface WBPhotoView()
@property (nonatomic, weak) UIImageView *gifView;
@end

@implementation WBPhotoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        // 添加一个GIF小图片
        UIImage *image = [UIImage imageWithName:@"timeline_image_gif"];
        UIImageView *gifView = [[UIImageView alloc] initWithImage:image];
        [self addSubview:gifView];
        self.gifView = gifView;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.gifView.layer.anchorPoint = CGPointMake(1, 1); // 锚点在右下角
    self.gifView.layer.position = CGPointMake(self.frame.size.width, self.frame.size.height);
}


#pragma mark - SD 下载图片
- (void)setPhoto:(WBPhoto *)photo
{
    _photo = photo;
    
    // 控制gifView的可见性
    self.gifView.hidden = ![photo.thumbnail_pic hasSuffix:@"gif"];
    
    // 下载图片
    [self setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageWithName:@"timeline_image_placeholder"]];
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
