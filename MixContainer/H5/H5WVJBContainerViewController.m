//
//  H5WVJBContainerViewController.m
//  MixContainer
//
//  Created by zhoufei on 2023/6/30.
//

#import "H5WVJBContainerViewController.h"
#import "WebViewJavascriptBridge.h"
 
@interface H5WVJBContainerViewController () <WKNavigationDelegate>
 
@property(nonatomic, strong) WebViewJavascriptBridge *bridge;
 
@end
 
@implementation H5WVJBContainerViewController
#pragma mark - Life Cycle
 
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     
    WKWebView *wkWebView = [[WKWebView alloc] initWithFrame:self.view.frame];
    wkWebView.navigationDelegate = self;
    [self.view addSubview:wkWebView];
     
    [WebViewJavascriptBridge enableLogging];
    self.bridge = [WebViewJavascriptBridge bridgeForWebView:wkWebView];
     
    // 在JS上下文中注册callOC方法
    [self.bridge registerHandler:@"testObjcCallback" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"收到了JS的调用");
        responseCallback(@"Object-C Received");
    }];
     
    // iOS调用JS
    [self.bridge callHandler:@"testJavascriptHandler" data:@{@"state":@"before ready"}];
     
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:3000/"]];
    [wkWebView loadRequest:req];
}
 
 
#pragma mark - Private Method
 
 
// MARK: overwrite
 
#pragma mark - Public Method
 
#pragma mark - Event
 
#pragma mark - Delegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
     
}
 
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
     
}
 
#pragma mark - Getter, Setter
 
#pragma mark - NSCopying
 
#pragma mark - NSObject
 
 
 
 
@end
