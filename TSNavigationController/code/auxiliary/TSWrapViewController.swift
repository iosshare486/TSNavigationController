//
//  TSWrapViewController.swift
//  TSNavigationController
//
//  Created by huangyuchen on 2018/6/16.
//  Copyright © 2018年 caiqr. All rights reserved.
//

import UIKit

class TSWrapViewController: UIViewController {
    
    //防止创建方式不正确
    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //该类只能用该方式创建
    static func wrapViewController(withViewController viewContoller: UIViewController) -> TSWrapViewController {
        
        let wrapNavController: TSVisibleNavigationController = TSVisibleNavigationController()
        
        wrapNavController.viewControllers = [viewContoller]
        
        let wrapViewController = TSWrapViewController()
        wrapViewController.view.addSubview(wrapNavController.view)
        wrapViewController.addChildViewController(wrapNavController)
        return wrapViewController
    }
    
    func rootViewController() -> UIViewController {
        
        let nav: TSVisibleNavigationController = self.childViewControllers.first as! TSVisibleNavigationController
        return nav.viewControllers.first ?? nav
    }
    
    override var tabBarItem: UITabBarItem! {
        
        set {
            
            self.tabBarItem = newValue
        }
        
        get {
            return self.rootViewController().tabBarItem
        }
    }
    override var title: String? {
        
        set {
            self.title = newValue
        }
        
        get {
            
            return self.rootViewController().title
        }
    }
    
}
