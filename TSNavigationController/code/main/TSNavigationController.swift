//
//  TSNavigationController.swift
//  TSNavigationController
//
//  Created by huangyuchen on 2018/6/16.
//  Copyright © 2018年 caiqr. All rights reserved.
//

import UIKit

public class TSNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    private var _rootViewController: UIViewController? = nil
    private var _visibleNavitionController: TSVisibleNavigationController? = nil
    
    public var rootViewController: UIViewController? {
        
        get {
            
            return _rootViewController
        }
    }
    
    public var visibleNavitionController: TSVisibleNavigationController? {
        
        get {
            
            return _visibleNavitionController
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarHidden(true, animated: false)
        self.delegate = self
        self.interactivePopGestureRecognizer?.delegate = nil
    }
    
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override public init(rootViewController: UIViewController) {
        
        super.init(rootViewController: rootViewController)
        
        self._rootViewController = rootViewController
        
        let wrapViewController = TSWrapViewController.wrapViewController(withViewController: rootViewController)
        
        self._visibleNavitionController = wrapViewController.visibleNavigationController
        
        self.viewControllers = [wrapViewController]
    }
    
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        let isRootVC : Bool = viewController == navigationController.viewControllers.first
        navigationController.interactivePopGestureRecognizer?.isEnabled = !isRootVC
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

