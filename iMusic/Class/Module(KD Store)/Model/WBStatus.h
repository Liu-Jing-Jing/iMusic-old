//
//  WBStatus.h
//  iMusic
//
//  Created by Mark Lewis on 17-6-23.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//  微博模型(一个IWStatus对象就代表一条微博)

#import <Foundation/Foundation.h>

@class WBUserModel;
@interface WBStatus : NSObject
/**
 *  微博的内容(文字)
 */
@property (nonatomic, copy) NSString *text;
/**
 *  微博的来源
 */
@property (nonatomic, copy) NSString *source;
/**
 *  微博的时间
 */
@property (nonatomic, copy) NSString *created_at;
/**
 *  微博的ID
 */
@property (nonatomic, copy) NSString *idstr;

/**
 *  微博的配图(数组中装模型:IWPhoto)
 */
@property (nonatomic, strong) NSArray *pic_urls;
/**
 *  微博的单张配图
 */
//@property (nonatomic, copy) NSString *thumbnail_pic;

/**
 *  微博的转发数
 */
@property (nonatomic, assign) int reposts_count;
/**
 *  微博的评论数
 */
@property (nonatomic, assign) int comments_count;
/**
 *  微博的表态数(被赞数)
 */
@property (nonatomic, assign) int attitudes_count;

/**
 *  微博的作者
 */
@property (nonatomic, strong) WBUserModel *user;
/**
 *  被转发的微博
 */
@property (nonatomic, strong) WBStatus *retweeted_status;
@end
