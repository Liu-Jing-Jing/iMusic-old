//
//  MJMoviePlayerViewController.m
//  05.媒体播放
//
//  Created by apple on 14-4-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJMoviePlayerViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface MJMoviePlayerViewController ()
@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;
@end

@implementation MJMoviePlayerViewController

- (MPMoviePlayerController *)moviePlayer
{
    if (!_moviePlayer) {
        // 负责控制媒体播放的控制器
        _moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:self.movieURL];
        _moviePlayer.view.frame = self.view.bounds;
        _moviePlayer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:_moviePlayer.view];
    }
    return _moviePlayer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.moviePlayer play];
    [self addNotification];
}

- (void)viewDidAppear:(BOOL)animated
{
    self.moviePlayer.fullscreen = YES;
}

#pragma mark - 添加通知
- (void)addNotification
{
    // 1. 添加播放状态的监听
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(stateChanged) name:MPMoviePlayerPlaybackStateDidChangeNotification object:nil];
    // 2. 播放完成
    [nc addObserver:self selector:@selector(finished) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    // 3. 全屏
    [nc addObserver:self selector:@selector(finished) name:MPMoviePlayerDidExitFullscreenNotification object:nil];
    // 4. 截屏完成通知
    [nc addObserver:self selector:@selector(captureFinished:) name:MPMoviePlayerThumbnailImageRequestDidFinishNotification object:nil];
    
    // 数组中有多少时间,就通知几次
    // MPMovieTimeOptionExact 精确
    // MPMovieTimeOptionNearestKeyFrame 大概齐
    [self.moviePlayer requestThumbnailImagesAtTimes:@[@(5.0), @(20.0)] timeOption:MPMovieTimeOptionNearestKeyFrame];
}

- (void)captureFinished:(NSNotification *)notification
{
    if([self.delegate respondsToSelector:@selector(moviePlayerDidCapturedWithImage:)])
    {
        // NSLog(@"%@", notification);
        [self.delegate moviePlayerDidCapturedWithImage:notification.userInfo[MPMoviePlayerThumbnailImageKey]];
    }
}

- (void)finished
{
    // 1. 删除通知监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    // 2. 返回上级窗体
    // 谁申请,谁释放!
    [self.delegate moviePlayerDidFinished];
    NSLog(@"完成");
}

/**
 MPMoviePlaybackStateStopped,           停止
 MPMoviePlaybackStatePlaying,           播放
 MPMoviePlaybackStatePaused,            暂停
 MPMoviePlaybackStateInterrupted,       中断
 MPMoviePlaybackStateSeekingForward,    下一个
 MPMoviePlaybackStateSeekingBackward    前一个
 */
- (void)stateChanged
{
    switch (self.moviePlayer.playbackState) {
        case MPMoviePlaybackStatePlaying:
            NSLog(@"播放");
            break;
        case MPMoviePlaybackStatePaused:
            NSLog(@"暂停");
            break;
        case MPMoviePlaybackStateStopped:
            // 执行[self.moviePlayer stop]或者前进后退不工作时会触发
            NSLog(@"停止");
            break;
        default:
            break;
    }
}

@end
