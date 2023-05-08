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
    }
}
