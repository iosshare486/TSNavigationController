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

class TSVisibleNavigationController: UINavigationController {
    
    override func popViewController(animated: Bool) -> UIViewController? {
        
        return self.parent?.navigationController?.popViewController(animated: animated)
    }
    
    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        
        return self.parent?.navigationController?.popToViewController(viewController, animated: animated)
    }
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        
        return self.parent?.navigationController?.popToRootViewController(animated: animated)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        let leftButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        leftButton.setImage(#imageLiteral(resourceName: "tsnavigitionBackArrow.png"), for: .normal)
        leftButton.adjustsImageWhenHighlighted = false
        leftButton.addTarget(self, action: #selector(pop), for: .touchUpInside)
        leftButton.contentHorizontalAlignment = .left
        let nagetiveSpacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        nagetiveSpacer.width = -8
        viewController.navigationItem.leftBarButtonItems = [nagetiveSpacer , UIBarButtonItem(customView: leftButton)]
        self.parent?.navigationController?.pushViewController(TSWrapViewController.wrapViewController(withViewController: viewController), animated: animated)
    }
    
    @objc func pop() {
        
        self.parent?.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
