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

    }
    
    @IBAction func goH5(_ sender: Any) {
        Router.shared.present(.h5(urlString: ""), from: self)
    }
    
    
    @objc func btnAction(_ sender: UIButton) {
        Router.shared.present(.unityContainer, from: self)
    }


}

