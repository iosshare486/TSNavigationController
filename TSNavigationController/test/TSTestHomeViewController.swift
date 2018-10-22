//
//  TSTestHomeViewController.swift
//  TSNavigationController
//
//  Created by huangyuchen on 2018/6/17.
//  Copyright © 2018年 caiqr. All rights reserved.
//

import UIKit

class TSTestHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.ts_isTranslucent(translucent: false)
//        self.ts_navBarHiddenAll()
//        self.ts_navBarImg(img: #imageLiteral(resourceName: "testImage"))
        self.ts_navBarColor(color: .red)
        self.ts_navTitleColor(color: UIColor.blue)
        self.ts_navTintColor(color: UIColor.cyan)
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button.addTarget(self, action: #selector(buttonOnClick), for: UIControl.Event.touchUpInside)
        button.setTitle("TSTestHomeViewController", for: UIControl.State.normal)
        button.backgroundColor = .blue
        self.view.addSubview(button)
        self.view.backgroundColor = UIColor.cyan
        self.title = "home"
        // Do any additional setup after loading the view.
    }

    @objc func buttonOnClick() {
        
        self.navigationController?.pushViewController(TSTabbarSecondViewController(), animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
