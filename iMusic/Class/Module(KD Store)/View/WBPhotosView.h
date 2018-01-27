//
//  WBPhotosView.h
//  iMusic
//
//  Created by Mark Lewis on 17-7-5.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBPhotosView : UIView
/**
 *  需要展示的图片(数组里面装的都是IWPhoto模型)
 */
@property (nonatomic, strong) NSArray *photos;

/**
 *  根据图片的个数返回相册的最终尺寸
 */
+ (CGSize)photosViewSizeWithPhotosCount:(int)count;
@end
