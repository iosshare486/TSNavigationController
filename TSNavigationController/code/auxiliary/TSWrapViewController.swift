//
//  TSWrapViewController.swift
//  TSNavigationController
//
//  Created by huangyuchen on 2018/6/16.
//  Copyright © 2018年 caiqr. All rights reserved.
//

import UIKit

public class TSWrapViewController: UIViewController {
    
    //防止创建方式不正确
    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //该类只能用该方式创建
    public static func wrapViewController(withViewController viewContoller: UIViewController) -> TSWrapViewController {
        
        let wrapNavController: TSVisibleNavigationController = TSVisibleNavigationController()
        
        wrapNavController.viewControllers = [viewContoller]
        
        let wrapViewController = TSWrapViewController()
        wrapViewController.view.addSubview(wrapNavController.view)
        wrapViewController.addChildViewController(wrapNavController)
        return wrapViewController
    }
    
    public func rootViewController() -> UIViewController {
        
        let nav: TSVisibleNavigationController = self.childViewControllers.first as! TSVisibleNavigationController
        return nav.viewControllers.first ?? nav
    }
    
    public override var tabBarItem: UITabBarItem! {
        
        set {
            
            self.tabBarItem = newValue
        }
        
        get {
            return self.rootViewController().tabBarItem
        }
    }
    public override var title: String? {
        
        set {
            self.title = newValue
        }
        
        get {
            
            return self.rootViewController().title
        }
    }
    
}
