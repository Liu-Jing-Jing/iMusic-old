//
//  WBUserModel.h
//  iMusic
//
//  Created by Mark Lewis on 17-6-23.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBUserModel : NSObject
/** 用户的ID */
@property (nonatomic, copy) NSString *idstr;

/** 用户的昵称 */
@property (nonatomic, copy) NSString *name;

/** 用户的头像 */
@property (nonatomic, copy) NSString *profile_image_url;

/** 会员等级 */
@property (nonatomic, assign) int mbrank;

/** 会员类型 */
@property (nonatomic, assign) int mbtype;
@end
