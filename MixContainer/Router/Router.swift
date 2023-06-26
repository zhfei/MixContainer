//
//  Router.swift
//  MixContainer
//
//  Created by zhoufei on 2023/5/9.
//

import Foundation
import UIKit

enum RouterDestination {
    case native(viewController: UIViewController)
    case h5(urlString: String)
    case reactNative(screenName: String)
    case unityContainer
}

class Router {
    static let shared = Router()
    
    private init() {}
    
    func push(_ destination: RouterDestination, from source: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        switch destination {
        case .native(let viewController):
            source.navigationController?.pushViewController(viewController, animated: animated)
            completion?()
        case .h5(let urlString):
            let h5ViewController = H5ContainerViewController()
            source.navigationController?.pushViewController(h5ViewController, animated: animated)
            completion?()
        case .reactNative(let screenName):
            let reactNativeViewController = ReactNativeContainerViewController()
            source.navigationController?.pushViewController(reactNativeViewController, animated: animated)
            completion?()
        case .unityContainer:
            let unityContainerViewController = UnityContainerViewController()
            source.navigationController?.pushViewController(unityContainerViewController, animated: animated)
            completion?()
        }
    }
    
    func present(_ destination: RouterDestination, from source: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        switch destination {
        case .native(let viewController):
            source.present(viewController, animated: animated, completion: completion)
        case .h5(let urlString):
            let h5ViewController = H5ContainerViewController()
            source.present(h5ViewController, animated: animated, completion: completion)
        case .reactNative(let screenName):
            let reactNativeViewController = ReactNativeContainerViewController()
            source.present(reactNativeViewController, animated: animated, completion: completion)
        case .unityContainer:
            let unityContainerViewController = UnityContainerViewController()
            source.present(unityContainerViewController, animated: animated, completion: completion)
        }
    }
}
