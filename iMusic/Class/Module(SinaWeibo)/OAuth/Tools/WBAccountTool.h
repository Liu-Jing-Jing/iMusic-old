//
//  WBAccountTool.h
//  Weibo Demo
//
//  Created by Mark Lewis on 16-8-22.
//  Copyright (c) 2016年 MarkLewis. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WBAccount;
@interface WBAccountTool : NSObject

+ (void)saveAccount:(WBAccount *)account;

+ (WBAccount *)account;

+ (void)accessTokenWithCode:(NSString *)code success:(void(^)())success failure:(void(^)(NSError *error))failure;

@end
