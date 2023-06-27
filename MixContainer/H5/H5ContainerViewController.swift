//
//  H5ContainerViewController.swift
//  MixContainer
//
//  Created by zhoufei on 2023/5/8.
//

import Foundation
import UIKit
import WebKit

class H5ContainerViewController: UIViewController {
     
    lazy var h5UIWebViewOCContainerController: H5UIWebViewOCContainerController = {
        return H5UIWebViewOCContainerController()
    }()
     
    lazy var h5WKWebViewContainerController: H5WKWebViewContainerController = {
        return H5WKWebViewContainerController()
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
         
//        self.addChild(h5UIWebViewOCContainerController)
//        self.view.addSubview(h5UIWebViewOCContainerController.view)
//        h5UIWebViewOCContainerController.view.frame = view.frame
         
        self.addChild(h5WKWebViewContainerController)
        self.view.addSubview(h5WKWebViewContainerController.view)
        h5WKWebViewContainerController.view.frame = view.frame
         
    }
}
