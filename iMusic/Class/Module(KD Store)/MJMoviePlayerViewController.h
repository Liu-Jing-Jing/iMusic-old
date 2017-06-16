//
//  MJMoviePlayerViewController.h
//  05.媒体播放
//
//  Created by apple on 14-4-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MJMoviePlayerViewControllerDelegate <NSObject>

- (void)moviePlayerDidFinished;

@optional
- (void)moviePlayerDidCapturedWithImage:(UIImage *)image;

@end

@interface MJMoviePlayerViewController : UIViewController

@property (nonatomic, weak) id<MJMoviePlayerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSURL *movieURL;

@end
