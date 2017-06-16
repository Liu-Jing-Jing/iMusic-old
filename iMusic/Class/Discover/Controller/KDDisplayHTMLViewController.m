//
//  KDDisplayHTMLViewController.m
//  iMusic
//
//  Created by Mark Lewis on 17-6-13.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import "KDDisplayHTMLViewController.h"

@interface KDDisplayHTMLViewController ()<UIWebViewDelegate, UIActionSheetDelegate>

@end

@implementation KDDisplayHTMLViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.contentWebView = webView;
    [self.view addSubview:webView];
    webView.delegate = self;
    
    
    
    //添加工具条
    CGFloat barH = 33;
    CGFloat barW = self.view.bounds.size.width;
    CGFloat barX = 0;
    CGFloat barY = self.view.bounds.size.height - barH;
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(barX, barY, barW, barH)];
    
    UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(closedController)];
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *backToTop = [[UIBarButtonItem alloc] initWithTitle:@"🔼" style:UIBarButtonItemStylePlain target:self action:@selector(backToPageTop)];
    [toolbar setItems:@[closeItem, flexible, backToTop]];
    [self.view addSubview:toolbar];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 必须要等view出现才能调用显示actionSheet
    [self showActionSheetView];
}
- (void)closedController
{
    [self dismissViewControllerAnimated:YES completion:^{
        // MKLog(@"closed");
    }];
}

- (void)backToPageTop
{
    // if(document.documentElement.scrollTop==0)clearTimeout(scrolldelay);
    // window.scrollBy(0,-10);scrolldelay=setTimeout('pageScroll()',100);}<ahref="pageScroll();
    NSString *js = @"window.scroll(0,0);";
    // 2.执行JavaScript代码
    [self.contentWebView stringByEvaluatingJavaScriptFromString:js];
}
- (void)showActionSheetView
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Browser"
                                                             delegate:self
                                                    cancelButtonTitle:@"awesome-iosDescription.html"
                                               destructiveButtonTitle:@"退出"
                                                    otherButtonTitles:@"awesome-ios.html", @"awesome-pdf", nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==actionSheet.destructiveButtonIndex)
    {
        [self performSelector:@selector(closedController) withObject:nil afterDelay:0.1];
    }
    
    NSString *filename = @"awesome-iosDescription.html";
    switch (buttonIndex)
    {
        case 1:
            filename = @"awesome-ios.html";
            break;
        case 2:
            filename = @"awesome-ios.pdf";
            break;
        default:
            break;
    }
    
    // 创建URL
    NSURL *url = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
    
    // 创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 发送请求加载网页
    [self.contentWebView loadRequest:request];
}

/**
 *  网页加载完毕的时候调用
 */
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // 跳到id对应的网页标签
    
    // 1.拼接Javacript代码
    NSString *js = @"document.title;";
    // 2.执行JavaScript代码
    NSString *pageTitle = [webView stringByEvaluatingJavaScriptFromString:js];
    MKLog(@"%@", pageTitle);
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
