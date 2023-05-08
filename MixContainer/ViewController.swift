//
//  ViewController.swift
//  MixContainer
//
//  Created by zhoufei on 2023/5/8.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let btn = UIButton(type: UIButtonType.custom)
        btn.bounds = CGRect(x: 0, y: 0, width: 220, height: 45)
        btn.setTitleColor(UIColor(hex: "f37445"), for: UIControlState.normal)
        btn.setTitle("立即登录", for: UIControlState.normal)
        btn.titleLabel?.font = UIFont(name: "PingFangSC-Semibold", size: 16)
        btn.addTarget(self, action: #selector(btnAction(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(btn)
        btn.snp.makeConstraints { (maker) in
            maker.size.equalTo(loginBtnSize)
            maker.centerX.equalToSuperview()
            maker.top.equalTo(label.snp.bottom).offset(24)
        }
    }
    
    
    
    @objc func btnAction(_ sender: UIButton) {
        Router.shared.present(.unityContainer, from: self)
    }


}

