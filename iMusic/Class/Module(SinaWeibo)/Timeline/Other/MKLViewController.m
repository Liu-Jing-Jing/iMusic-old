//
//  MKLViewController.m
//  iMusic
//
//  Created by Mark Lewis on 17-4-3.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import "MKLViewController.h"
#import "MJMoviePlayerViewController.h"

@interface MKLViewController () <MJMoviePlayerViewControllerDelegate>
@property (nonatomic, strong) MJMoviePlayerViewController *playerController;

@end

@implementation MKLViewController

- (MJMoviePlayerViewController *)playerController
{
    if (!_playerController)
    {
        _playerController = [[MJMoviePlayerViewController alloc] init];
        _playerController.delegate = self;
        _playerController.movieURL = [[NSBundle mainBundle] URLForResource:@"FieldsOfGold.mp3" withExtension:nil];
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
}

- (IBAction)click
{
    [self presentViewController:self.playerController animated:YES completion:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
