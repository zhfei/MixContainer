//
//  ReactNativeContainerViewController.swift
//  MixContainer
//
//  Created by zhoufei on 2023/5/8.
//

import Foundation
import UIKit
import React

class ReactNativeContainerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")
        
        let rootView = RCTRootView(
            bundleURL: jsCodeLocation,
            moduleName: "App",
            initialProperties: nil,
            launchOptions: nil
        )
        rootView.frame = self.view.bounds
        self.view.addSubview(rootView)
        
//        self.view = rootView
        rootView.delegate = self
    }
}

// 实现 RCTRootViewDelegate 协议来处理 React Native 页面的回调
extension ReactNativeContainerViewController: RCTRootViewDelegate {
    func rootViewDidChangeIntrinsicSize(_ rootView: RCTRootView!) {
        // 处理 React Native 页面加载完成的事件
    }
}
