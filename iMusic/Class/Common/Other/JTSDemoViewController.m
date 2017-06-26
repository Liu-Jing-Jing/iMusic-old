//
//  JTSDemoViewController.m
//  iMusic
//
//  Created by Mark Lewis on 17-6-26.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import "JTSDemoViewController.h"
#import "JTSImageViewController.h"
#import "JTSImageInfo.h"
#define TRY_AN_ANIMATED_GIF 0

@interface JTSDemoViewController ()
@property (nonatomic, strong) UIImageView *bigImageButton;
@end

@implementation JTSDemoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    self.bigImageButton = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 300, 225)];
    self.bigImageButton.image = [UIImage imageNamed:@"mooc"];
    self.bigImageButton.userInteractionEnabled = YES;
    [self.view addSubview:self.bigImageButton];
    
    UILongPressGestureRecognizer *longPressRecognizer = [[UILongPressGestureRecognizer alloc] init];
    [longPressRecognizer addTarget:self action:@selector(bigButtonTapped:)];
    [self.bigImageButton addGestureRecognizer:longPressRecognizer];
//    [self.bigImageButton setAccessibilityLabel:@"Photo of a cat wearing a Bane costume."];
    self.bigImageButton.layer.cornerRadius = self.bigImageButton.bounds.size.width/2.0f;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
}

- (void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)bigButtonTapped:(id)sender
{
    
    // Create image info
    JTSImageInfo *imageInfo = [[JTSImageInfo alloc] init];
#if TRY_AN_ANIMATED_GIF == 1
    imageInfo.imageURL = [NSURL URLWithString:@"http://media.giphy.com/media/O3QpFiN97YjJu/giphy.gif"];
#else
    imageInfo.image = self.bigImageButton.image;
#endif
    imageInfo.referenceRect = self.bigImageButton.frame;
    imageInfo.referenceView = self.bigImageButton.superview;
    imageInfo.referenceContentMode = self.bigImageButton.contentMode;
    imageInfo.referenceCornerRadius = self.bigImageButton.layer.cornerRadius;
    
    // Setup view controller
    JTSImageViewController *imageViewer = [[JTSImageViewController alloc] initWithImageInfo:imageInfo mode:JTSImageViewControllerMode_Image backgroundStyle:JTSImageViewControllerBackgroundOption_Scaled];
    
    // Present the view controller.
    [imageViewer showFromViewController:self transition:JTSImageViewControllerTransition_FromOriginalPosition];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
