//
//  H5ContainerViewController.swift
//  MixContainer
//
//  Created by zhoufei on 2023/5/8.
//

import Foundation
import UIKit
import WebKit

class H5ContainerViewController: UIViewController, WKUIDelegate, WKNavigationDelegate,WKScriptMessageHandler,WKURLSchemeHandler {
 
    var webView: WKWebView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
         
        // WKWebViewConfiguration: 用于配置WKWebView的属性和行为, 常见的操作有
        let webViewConfiguration = WKWebViewConfiguration()
         
        //1.配置WKUserContentController,管理WKUserScript(cookie脚本)和WKScriptMessageHandler原生与JS的交互
        let userContentController = WKUserContentController()
        webViewConfiguration.userContentController = userContentController
        //添加WKScriptMessageHandler脚本处理
        userContentController.add(self, name: "QRCodeScan")
        //添加WKUserScript，injectionTime注入时机为atDocumentStart页面加载时在，forMainFrameOnly不只在主框架中注入，所有的框架都注入。
        let cookieScript = WKUserScript(source: "document.cookie = 'cookieName=cookieValue; domain=example.com; path=/';", injectionTime: .atDocumentStart, forMainFrameOnly: false)
        userContentController.addUserScript(cookieScript)
         
        //2.自定义处理网络，处理Scheme为position的定位网络操作
        webViewConfiguration.setURLSchemeHandler(self, forURLScheme: "position")
 
         
        //3.偏好配置WKPreferences,设置网页缩放，字体
        let preferences = WKPreferences()
        preferences.minimumFontSize = 10
        if #available(iOS 14, *) {
            let webpagePreferences = WKWebpagePreferences()
            webpagePreferences.allowsContentJavaScript = true
            webViewConfiguration.defaultWebpagePreferences = webpagePreferences
        } else {
            preferences.javaScriptEnabled = true
        }
        preferences.javaScriptCanOpenWindowsAutomatically = true
        webViewConfiguration.preferences = preferences
         
        //4.多媒体设置，设置视频自动播放，画中画，逐步渲染
        webViewConfiguration.allowsInlineMediaPlayback = true
        webViewConfiguration.allowsPictureInPictureMediaPlayback = true
        webViewConfiguration.allowsAirPlayForMediaPlayback = true
        webViewConfiguration.suppressesIncrementalRendering = true
         
         
        //5.cookie设置
        //WKWebView默认是读取HTTPCookieStorage.shared中的cookie，所以把创建的cookie放置到HTTPCookieStorage.shared中即可。
        //创建cookie对象
        let properties = [
            HTTPCookiePropertyKey.name: "cookieName",
            HTTPCookiePropertyKey.value: "cookieValue",
            HTTPCookiePropertyKey.domain: "example.com",
            HTTPCookiePropertyKey.path: "/",
            HTTPCookiePropertyKey.expires: NSDate(timeIntervalSinceNow: 31556926)
        ] as [HTTPCookiePropertyKey : Any]
        let cookie = HTTPCookie(properties: properties)!
        // 将cookie添加到cookie storage中
        HTTPCookieStorage.shared.setCookie(cookie)
 
         
         
         
        webView = WKWebView(frame: .zero, configuration: webViewConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        self.view.addSubview(webView)
         
        loadURL(urlString: "http://localhost:3000/")
    }
     
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
         
        webView.frame = self.view.bounds
    }
     
    func loadURL(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
         
        let request = URLRequest(url: url)
        webView.load(request)
    }
 
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // 加载完成
    }
     
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        // 加载失败
    }
}
 
//WKScriptMessageHandler
extension H5ContainerViewController {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "QRCodeScan" {
            print(message)
             
            //JS回调，原生处理完后，通知JS结果
            let script = "qrResult('jack')"
            message.webView?.evaluateJavaScript(script,completionHandler: { res, _ in
                print(res)
            })
             
        }
    }
}
 
// WKURLSchemeHandler 的 Delegate
extension H5ContainerViewController {
    func webView(_ webView: WKWebView, start urlSchemeTask: WKURLSchemeTask) {
        print(webView)
    }
     
    func webView(_ webView: WKWebView, stop urlSchemeTask: WKURLSchemeTask) {
        print(webView)
    }
}
