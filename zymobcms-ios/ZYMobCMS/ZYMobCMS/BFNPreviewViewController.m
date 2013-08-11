//
//  BFNPreviewViewController.m
//  PPFIphone
//
//  Created by li sha on 13-6-26.
//  Copyright (c) 2013年 li sha. All rights reserved.
//

#import "BFNPreviewViewController.h"
@implementation NSURLRequest(DataController)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host
{
    return YES; // Should probably return YES only for a specific host
}
@end

@interface BFNPreviewViewController ()

@end

@implementation BFNPreviewViewController

@synthesize url, siteName, webFileName, webRequest, isLoadUrl;

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
    
    onFirstPage = YES;
    detailWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    detailWebView.delegate = self;
    detailWebView.scalesPageToFit = YES;
    detailWebView.opaque = NO;
    [detailWebView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:detailWebView];
    
    // 操作视图
    UIView *optView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 82, detailWebView.frame.size.width, 40)];
    [optView setBackgroundColor:[BFUitils rgbColor:246 green:246 blue:246]];
    [self.view addSubview:optView];
    
    CGFloat btnSize = 30;
    CGFloat btnOriginY = (optView.frame.size.height - btnSize) / 2;
    backBtn = [[UIButton alloc] initWithFrame:CGRectMake((optView.frame.size.width - (btnSize * 2 + 100)) / 2, btnOriginY, btnSize, btnSize)];
    [backBtn setImage:[UIImage imageNamed:@"left_arrow1.png"] forState:UIControlStateNormal];
    [backBtn setEnabled:NO];
    [backBtn addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    [optView addSubview:backBtn];
    
    forwardBtn = [[UIButton alloc] initWithFrame:CGRectMake(backBtn.frame.origin.x + btnSize + 100, btnOriginY, btnSize, btnSize)];
    [forwardBtn addTarget:self action:@selector(goForward:) forControlEvents:UIControlEventTouchUpInside];
    [optView addSubview:forwardBtn];
    
    refreshBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 29, 29)];
    [refreshBtn setImage:[UIImage imageNamed:@"refresh.png"] forState:UIControlStateNormal];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:refreshBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    [rightItem release];
    
    [self setBtnState];
    
    [optView release];
    
}


- (void)viewDidDisappear:(BOOL)animated
{
    [detailWebView stopLoading];
}



// [self strToByte:http://www.wenxuecity.com/]
- (NSString *)strToByte:(NSString *)_url
{
    NSData *urlData = [_url dataUsingEncoding: NSUTF8StringEncoding];
    Byte *urlByte = (Byte *)[urlData bytes];
    NSInteger byteLen = [urlData length];
    NSMutableArray *tmpAry = [[NSMutableArray alloc] initWithCapacity:0];
    // 字节数组每元素加1
    for(int i = 0; i < byteLen; i++)
    {
        urlByte[i] = urlByte[i]+1;
        [tmpAry addObject:[NSNumber numberWithInteger:urlByte[i]]];
    }
    
    // 字节数组首位交换
    NSNumber *end = [tmpAry objectAtIndex:[tmpAry count] - 1];
    [tmpAry insertObject:end atIndex:0];
    [tmpAry removeObjectAtIndex:[tmpAry count] - 1];
    
    NSNumber *start = [tmpAry objectAtIndex:1];
    [tmpAry insertObject:start atIndex:[tmpAry count]];
    [tmpAry removeObjectAtIndex:1];
    
    // 字节数组反转
    for(int i = 0; i < byteLen; i++)
    {
        urlByte[i] = [[tmpAry objectAtIndex:byteLen - (i + 1)] intValue];
    }
    
    [tmpAry release];
    
    NSData *adata = [[NSData alloc] initWithBytes:urlByte length:[urlData length]];
    NSString *urlStr = [ASIHTTPRequest base64forData:adata];
    [adata release];
    
    return urlStr;
}

- (void)getHtmlStr:(NSString *)urlStr
{
    NSURL *furl = [NSURL URLWithString:urlStr];
    NSURLRequest *request =[NSURLRequest requestWithURL:furl];
    [detailWebView loadRequest:request];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (BOOL)shouldAutorotate
{
	return YES;
}


- (NSUInteger)supportedInterfaceOrientations
{
	return UIInterfaceOrientationMaskPortrait;
}


-(BOOL)webView:(UIWebView *)inWeb shouldStartLoadWithRequest:(NSURLRequest *)inRequest navigationType:(UIWebViewNavigationType)inType {
    
    if (inType == UIWebViewNavigationTypeLinkClicked) {
        onFirstPage = NO;
    }
    
    NSURL *requestURL =[[inRequest URL ] retain];
    if ([[requestURL scheme] rangeOfString:@"http"].location == NSNotFound && [[requestURL scheme] rangeOfString:@"https"].location == NSNotFound) {
        onFirstPage = YES;
    }
    
    if(!onFirstPage)
    {
        [backBtn setImage:[UIImage imageNamed:@"left_arrow.png"] forState:UIControlStateHighlighted];
        [backBtn setImage:[UIImage imageNamed:@"left_arrow.png"] forState:UIControlStateNormal];
        [backBtn setEnabled:YES];
    }
    else
    {
        [backBtn setImage:[UIImage imageNamed:@"left_arrow1.png"] forState:UIControlStateNormal];
        [backBtn setEnabled:NO];
    }
    
    [requestURL release];
    
    return YES;
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
}


//开始加载的时候执行该方法。
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self setBtnState];
    [refreshBtn removeTarget:self action:@selector(refreshTouchDown:) forControlEvents:UIControlEventTouchUpInside];
}


//加载完成的时候执行该方法。
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [refreshBtn addTarget:self action:@selector(refreshTouchDown:) forControlEvents:UIControlEventTouchUpInside];
}


-(IBAction)goBack:(id)sender {
    if ([detailWebView canGoBack]) {
        // There's a valid webpage to go back to, so go there
        [detailWebView goBack];
    } else {
        // You've reached the end of the line, so reload your own data
        [self displayLocalResource];
    }
}


- (void)displayLocalResource
{
    onFirstPage = YES;
    //    [detailWebView loadHTMLString:contentString baseURL:nil];
    [detailWebView loadRequest:webRequest];
}


-(IBAction)goForward:(id)sender {
	[detailWebView goForward];
}


- (IBAction)refreshTouchDown:(id)sender {
    [detailWebView reload];
}

//设置按钮状态
-(void)setBtnState
{
    if ([detailWebView canGoForward]) {
        [forwardBtn setImage:[UIImage imageNamed:@"right_arrow.png"] forState:UIControlStateNormal];
        [forwardBtn setImage:[UIImage imageNamed:@"right_arrow.png"] forState:UIControlStateHighlighted];
        [forwardBtn setEnabled:YES];
    }else {
        [forwardBtn setImage:[UIImage imageNamed:@"right_arrow1.png"] forState:UIControlStateNormal];
        [forwardBtn setEnabled:NO];
    }
    
    if ([detailWebView canGoBack] || !onFirstPage) {
        [backBtn setImage:[UIImage imageNamed:@"left_arrow.png"] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"left_arrow.png"] forState:UIControlStateHighlighted];
        [backBtn setEnabled:YES];
    }else {
        [backBtn setImage:[UIImage imageNamed:@"left_arrow1.png"] forState:UIControlStateNormal];
        [backBtn setEnabled:NO];
    }
}


- (void)cleanView
{
    [detailWebView release];
    detailWebView = nil;
    [backBtn release];
    backBtn = nil;
    [forwardBtn release];
    forwardBtn = nil;
    [refreshBtn release];
    refreshBtn = nil;
    [contentString release];
    contentString = nil;
    self.webFileName = nil;
    self.webRequest = nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    float sysVer =[[[UIDevice currentDevice] systemVersion] floatValue];
    //ios6的特殊处理
    if (sysVer>= 6.0f)
    {
        
        //保证invisible, 因为即使在当前界面也会收到系统回调
        if (self.view.window == nil)
        {
            //做相关的释放操作
            [self cleanView];
            self.view = nil;    //确保下次会重新加载
        }
        
    }
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    [self cleanView];
}


- (void)dealloc {
    [detailWebView release];
    [backBtn release];
    [forwardBtn release];
    [refreshBtn release];
    [contentString release];
    [webFileName release];
    [webRequest release];
    [super dealloc];
}

@end
