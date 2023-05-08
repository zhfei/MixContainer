//
//  UnityContainerViewController.swift
//  MixContainer
//
//  Created by zhoufei on 2023/5/8.
//

import Foundation
import UIKit
import UnityFramework

class UnityContainerViewController: UIViewController {
    var unityView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 创建 UnityView
        unityView = UnityFramework.getInstance()?.appController()?.rootView
        
        // 添加 UnityView 到视图层次中
        view.addSubview(unityView)
        
        // 配置 UnityView 的布局
        unityView.translatesAutoresizingMaskIntoConstraints = false
        unityView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        unityView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        unityView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        unityView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // 启动 Unity 引擎
        UnityFramework.getInstance()?.runEmbedded(withArgc: CommandLine.argc, argv: CommandLine.unsafeArgv, appLaunchOpts: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // 更新 UnityView 的尺寸
        UnityFramework.getInstance()?.appController()?.rootView.frame = unityView.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 恢复 Unity 引擎
        UnityFramework.getInstance()?.appController()?.resume()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // 暂停 Unity 引擎
        UnityFramework.getInstance()?.appController()?.pause()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // 停止 Unity 引擎
        UnityFramework.getInstance()?.appController()?.stop()
    }
}
