//
//  MJViewController.m
//  05.媒体播放
//
//  Created by apple on 14-4-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJMoviePlayerViewController.h"

@interface MJViewController () <MJMoviePlayerViewControllerDelegate>
@property (nonatomic, strong) MJMoviePlayerViewController *playerController;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation MJViewController

- (MJMoviePlayerViewController *)playerController
{
    if (!_playerController) {
        _playerController = [[MJMoviePlayerViewController alloc] init];
        _playerController.delegate = self;
        _playerController.movieURL = [[NSBundle mainBundle] URLForResource:@"promo_full.mp4" withExtension:nil];
    }
    return _playerController;
}

- (void)moviePlayerDidFinished
{
    // 谁申请,谁释放
    // dismissViewControllerAnimated将当前视图控制器的模态窗口关闭
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)moviePlayerDidCapturedWithImage:(UIImage *)image
{
    self.imageView.image = image;
}

- (IBAction)click
{
    [self presentViewController:self.playerController animated:YES completion:nil];
}

@end
