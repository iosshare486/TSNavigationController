//
//  UIViewController+NavigationBarConfig.swift
//  TSNavigationController
//
//  Created by huangyuchen on 2018/6/17.
//  Copyright © 2018年 caiqr. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    struct tsAssociatedKeys
    {
        static var tsNavBarImgView: UIImageView = UIImageView()
    }
    
    var ts_naviBackgroundImageView: UIImageView? {
        get {
            guard let def = objc_getAssociatedObject(self, &tsAssociatedKeys.tsNavBarImgView) as? UIImageView else {
                return nil
            }
            return def
        }
        set { objc_setAssociatedObject(self, &tsAssociatedKeys.tsNavBarImgView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    //导航栏透明且隐藏底部黑线
    public func ts_navBarHiddenBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        ts_shadowHidden()
        self.ts_naviBackgroundImageView?.isHidden = true
    }
    
    //隐藏底部黑线
    public func ts_shadowHidden() {
        if let barBackgroundView = navigationController?.navigationBar.subviews.first {
            let valueForKey = barBackgroundView.value(forKey:)
            
            if let shadowView = valueForKey("_shadowView") as? UIView {
                shadowView.isHidden = true
            }
        }
    }
    
    //显示底部黑线
    public func ts_shadowShow() {
        if let barBackgroundView = navigationController?.navigationBar.subviews.first {
            let valueForKey = barBackgroundView.value(forKey:)
            
            if let shadowView = valueForKey("_shadowView") as? UIView {
                shadowView.isHidden = false
            }
        }
    }
    
    //彻底隐藏导航栏
    public func ts_navBarHiddenAll() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //设置取消 导航栏模糊效果
    public func ts_isTranslucent(translucent: Bool) {
        navigationController?.navigationBar.isTranslucent = translucent
    }
    
    //设置导航栏背景颜色
    public func ts_navBarColor(color: UIColor) {
        navigationController?.navigationBar.barTintColor = color
    }
    //设置导航栏主题颜色
    public func ts_navTintColor(color: UIColor) {
        navigationController?.navigationBar.tintColor = color
    }
    
    //设置导航栏标题颜色
    public func ts_navTitleColor(color: UIColor) {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: color]
    }
    
    //设置导航栏图片(支持透明度调整)
    public func ts_navBarImg(img: UIImage) {
        
        if ts_naviBackgroundImageView == nil {
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            ts_shadowHidden()
            let naviHeight = ts_naviBarHeight()
            
            
            ts_naviBackgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: naviHeight))
            ts_naviBackgroundImageView?.autoresizingMask = .flexibleWidth
            ts_naviBackgroundImageView?.contentMode = .scaleAspectFill
            ts_naviBackgroundImageView?.clipsToBounds = true
            navigationController?.navigationBar.subviews.first?.insertSubview(ts_naviBackgroundImageView ?? UIImageView(), at: 0)
        }
        if ts_naviBackgroundImageView?.isHidden == true {
            ts_naviBackgroundImageView?.isHidden = false
        }
        ts_naviBackgroundImageView?.image = img
    }
    
    //设置导航栏图片透明度
    public func ts_navBarImgAlpha(alpha: Float) {
        
        if ts_naviBackgroundImageView != nil {
            ts_naviBackgroundImageView?.alpha = CGFloat(min(alpha, 1))
        }
    }
    
    public func ts_naviBarHeight() -> CGFloat {
        if navigationController != nil {
            return UIApplication.shared.statusBarFrame.height + (navigationController?.navigationBar.frame.size.height)!
        } else {
            return UIApplication.shared.statusBarFrame.height
        }
    }
    
}
