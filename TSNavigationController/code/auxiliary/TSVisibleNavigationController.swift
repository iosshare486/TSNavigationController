//
//  TSVisibleNavigationController.swift
//  TSNavigationController
//
//  Created by huangyuchen on 2018/6/16.
//  Copyright © 2018年 caiqr. All rights reserved.
//
//
//  这个Nav是结构中可以被看见的nav，但是不是用来跳转的

import UIKit

public class TSVisibleNavigationController: UINavigationController {
    
    override public func popViewController(animated: Bool) -> UIViewController? {
        
        return self.parent?.navigationController?.popViewController(animated: animated)
    }
    
    override public func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        
        return self.parent?.navigationController?.popToViewController(viewController, animated: animated)
    }
    
    override public func popToRootViewController(animated: Bool) -> [UIViewController]? {
        
        return self.parent?.navigationController?.popToRootViewController(animated: animated)
    }
    
    override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        
        let path = Bundle.init(for: TSNavigationController.self).path(forResource: "TSNavigationController", ofType: "bundle")
        
        let bundle = Bundle.init(path: path!)
        
        let image = UIImage.init(named: "tsnavigitionBackArrow", in: bundle, compatibleWith: nil)
        
        viewController.navigationItem.leftBarButtonItems = [UIBarButtonItem(image: image, style: UIBarButtonItem.Style.done, target: self, action: #selector(pop))]
        self.parent?.navigationController?.pushViewController(TSWrapViewController.wrapViewController(withViewController: viewController), animated: animated)
    }
    
    @objc func pop() {
        
        self.parent?.navigationController?.popViewController(animated: true)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
