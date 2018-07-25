//
//  TSWrapViewController.swift
//  TSNavigationController
//
//  Created by huangyuchen on 2018/6/16.
//  Copyright © 2018年 caiqr. All rights reserved.
//

import UIKit

public class TSWrapViewController: UIViewController {
    
    private var _visibleNavigationController: TSVisibleNavigationController? = nil
    public var visibleNavigationController: TSVisibleNavigationController? {
        
        get {
            return _visibleNavigationController
        }
    }
    
    
    
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
        wrapViewController._visibleNavigationController = wrapNavController
        wrapViewController.hidesBottomBarWhenPushed = viewContoller.hidesBottomBarWhenPushed
        wrapViewController.view.addSubview(wrapNavController.view)
        wrapViewController.addChildViewController(wrapNavController)
        
        viewContoller.addObserver(wrapViewController, forKeyPath: "hidesBottomBarWhenPushed", options: .new, context: nil)
        
        return wrapViewController
    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if let hidden: Bool = change![NSKeyValueChangeKey.newKey] as? Bool {
            
            self.hidesBottomBarWhenPushed = hidden
        }
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
