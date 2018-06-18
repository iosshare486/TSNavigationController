//
//  TSNavigationController.swift
//  TSNavigationController
//
//  Created by huangyuchen on 2018/6/16.
//  Copyright © 2018年 caiqr. All rights reserved.
//

import UIKit

class TSNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarHidden(true, animated: false)
        self.delegate = self
        self.interactivePopGestureRecognizer?.delegate = nil
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override init(rootViewController: UIViewController) {
        
        super.init(rootViewController: rootViewController)
        
        self.viewControllers = [TSWrapViewController.wrapViewController(withViewController: rootViewController)]
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        let isRootVC : Bool = viewController == navigationController.viewControllers.first
        navigationController.interactivePopGestureRecognizer?.isEnabled = !isRootVC
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

