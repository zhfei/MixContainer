//
//  H5UIWebViewOCContainerController.m
//  MixContainer
//
//  Created by zhoufei on 2023/6/27.
//

#import "H5UIWebViewOCContainerController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "AppJSModel.h"
 
 
@interface H5UIWebViewOCContainerController()
@property (nonatomic, strong) UIWebView *webView;
@end
 
@implementation H5UIWebViewOCContainerController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.webView];
     
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:3000/"]];
    [self.webView loadRequest:req];
}
 
#pragma mark - Life Cycle
 
#pragma mark - Private Method
 
 
#pragma mark - Public Method
 
#pragma mark - Event
 
#pragma mark - Delegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if ([request.URL.scheme isEqualToString:@"position"]) {
        //自定义处理定位scheme
        JSContext *jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
        NSString *jsCode = @"qrResult('杭州，之江')";
        [jsContext evaluateScript:jsCode];
        return NO;
    }
     
    return YES;
}
 
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    JSContext *jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
     
    AppJSModel *jsModel = [AppJSModel new];
    jsContext[@"appModel"] = jsModel;
    jsContext[@"showAlert"] = ^(){
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"请输入支付信息" message:@"" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:defaultAction];
            UIAlertAction* cancleAction = [UIAlertAction actionWithTitle:@"Cancle" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:cancleAction];
             
            [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                textField.placeholder=@"请输入用户名";
            }];
            [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                textField.placeholder=@"请输入支付密码";
                textField.secureTextEntry=YES;
            }];
             
            [self presentViewController:alert animated:YES completion:nil];
        });
    };
}
 
 
#pragma mark - Getter, Setter
 
#pragma mark - NSCopying
 
#pragma mark - NSObject
 
 
 
 
- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.frame];
        _webView.delegate = self;
    }
    return _webView;
}
 
@end
