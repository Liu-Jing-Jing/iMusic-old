//
//  MKLLoginViewController.m
//  iMusic
//
//  Created by Mark Lewis on 17-6-24.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import "MKLLoginViewController.h"
#import "MKLTabBarViewController.h"
#import "MKLMainNavigationController.h"
#import "WBOAuthViewController.h"


@interface MKLLoginViewController ()<WBOAuthViewControllerDelegate>
@property (nonatomic, weak) UIImageView *bgView;
@end

@implementation MKLLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.image = [UIImage imageNamed:@"new_feature_background"];
    bgImageView.userInteractionEnabled = YES;
    [self.view addSubview:bgImageView];
    
    self.bgView = bgImageView;
    
    
    // 添加两个按钮
    [self setupButtonWithTitle:@"微博授权" andVerticalLocation:0.45 addActionSelector:@selector(startLogin)];
    [self setupButtonWithTitle:@"取消登录" andVerticalLocation:0.6 addActionSelector:@selector(cancelLogin)];
}

- (void)setupButtonWithTitle:(NSString *)title andVerticalLocation:(CGFloat)yPoint addActionSelector:(SEL)sel
{
    // 添加开始按钮
    UIButton *startButton = [[UIButton alloc]init];
    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    
    // 设置位置尺寸
    CGFloat centerX = self.view.frame.size.width * 0.5;
    CGFloat centerY = self.view.frame.size.height * yPoint;
    startButton.center = CGPointMake(centerX, centerY);
    startButton.bounds = (CGRect){CGPointZero, startButton.currentBackgroundImage.size};
    
    // 设置文字
    [startButton setTitle:title forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startButton addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:startButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)cancelLogin
{
    MKLTabBarViewController *tabBarVC = [[MKLTabBarViewController alloc] init];
    // 转场动画
    CATransition *anim = [CATransition animation];
    anim.type = @"rippleEffect";
    anim.duration = 0.5;
    //    anim.subtype = kCATransitionFromRight;
    //    anim.startProgress = 0.0;
    //    anim.endProgress = 0.5;
    
    [self.view.window.layer addAnimation:anim forKey:nil];
    self.view.window.rootViewController = tabBarVC;
    //    [UIView transitionWithView:self.view
    //                      duration:0.5
    //                       options: UIViewAnimationOptionTransitionFlipFromTop
    //                    animations:^{}
    //                    completion:^(BOOL finished) {
    //                    }];
    
    
}

- (void)startLogin
{
    // 之前没有登录成功
    WBOAuthViewController *OAuthViewController = [[WBOAuthViewController alloc] init];
    OAuthViewController.delegate = self;
    MKLMainNavigationController *nav = [[MKLMainNavigationController alloc] initWithRootViewController:OAuthViewController];
    
    // __weak typeof(self) weakThis = self;
    [self presentViewController:nav animated:YES completion:^{
        self.bgView.hidden = YES;
    }];
}

- (void)weiboOAuth2Success
{
    [WBWeiboTool chooseRootViewController];
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



// 动画获取:KYNaviAnimationType,KYNaviAnimationDirection可以参考switch里面的enum,主要是一个类型和方向.

/**
 
 @brief:获取动画方法
 
 
 - (CAAnimation *)animationWithType:(KYNaviAnimationType)animationType direction:(KYNaviAnimationDirection)direction{
 
 CATransition *animation = [CATransition animation];
 
 [animation setDuration:kAnimationDuration];
 
 switch (animationType) {
 
 case KYNaviAnimationTypeFade:
 
 animation.type = kCATransitionFade; //淡化
 
 break;
 
 case KYNaviAnimationTypePush:
 
 animation.type = kCATransitionPush; //推挤
 
 break;
 
 case KYNaviAnimationTypeReveal:
 
 animation.type = kCATransitionReveal; //揭开
 
 break;
 
 case KYNaviAnimationTypeMoveIn:
 
 animation.type = kCATransitionMoveIn;//覆盖
 
 break;
 
 case KYNaviAnimationTypeCube:
 
 animation.type = @"cube";   //立方体
 
 break;
 
 case KYNaviAnimationTypeSuck:
 
 animation.type = @"suckEffect"; //吸收
 
 break;
 
 case KYNaviAnimationTypeSpin:
 
 animation.type = @"oglFlip";    //旋转
 
 break;
 
 case KYNaviAnimationTypeRipple:
 
 animation.type = @"rippleEffect";   //波纹
 
 break;
 
 case KYNaviAnimationTypePageCurl:
 
 animation.type = @"pageCurl";   //翻页
 
 break;
 
 case KYNaviAnimationTypePageUnCurl:
 
 animation.type = @"pageUnCurl"; //反翻页
 
 break;
 
 case KYNaviAnimationTypeCameraOpen:
 
 animation.type = @"cameraIrisHollowOpen";   //镜头开
 
 break;
 
 case KYNaviAnimationTypeCameraClose:
 
 animation.type = @"cameraIrisHollowClose";  //镜头关
 
 break;
 
 default:
 
 animation.type = kCATransitionPush; //推挤
 
 break;
 
 }
 
 
 
 switch (direction) {
 
 case KYNaviAnimationDirectionFromLeft:
 
 animation.subtype = kCATransitionFromLeft;
 
 break;
 
 case KYNaviAnimationDirectionFromRight:
 
 animation.subtype = kCATransitionFromRight;
 
 break;
 
 case KYNaviAnimationDirectionFromTop:
 
 animation.subtype = kCATransitionFromTop;
 
 break;
 
 case KYNaviAnimationDirectionFromBottom:
 
 animation.subtype = kCATransitionFromBottom;
 
 break;
 
 default:
 
 animation.subtype = kCATransitionFromRight;
 
 break;
 
 }
 
 [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
 
 return animation;
 
 }
 */

@end