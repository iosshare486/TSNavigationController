//
//  TSTabbarSecondViewController.swift
//  TSNavigationController
//
//  Created by huangyuchen on 2018/6/17.
//  Copyright © 2018年 caiqr. All rights reserved.
//

import UIKit

class TSTabbarSecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.ts_isTranslucent(translucent: false)
        self.ts_shadowHidden()
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button.addTarget(self, action: #selector(buttonOnClick), for: UIControlEvents.touchUpInside)
        button.setTitle("TSTabbarSecondViewController", for: UIControlState.normal)
        button.backgroundColor = .blue
        self.view.addSubview(button)
        self.view.backgroundColor = UIColor.white
        self.title = "Second"
        // Do any additional setup after loading the view.
    }
    
    @objc func buttonOnClick() {
        
        self.navigationController?.pushViewController(TSTestHomeViewController(), animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
