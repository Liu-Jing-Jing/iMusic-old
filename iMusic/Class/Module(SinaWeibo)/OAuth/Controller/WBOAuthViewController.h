//
//  WBOAuthViewController.h
//  Weibo Demo
//
//  Created by Mark Lewis on 16-8-22.
//  Copyright (c) 2016年 MarkLewis. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WBOAuthViewControllerDelegate <NSObject>

- (void)weiboOAuth2Success;

@end
@interface WBOAuthViewController : UIViewController
@property (nonatomic, weak) id<WBOAuthViewControllerDelegate> delegate;
@end
