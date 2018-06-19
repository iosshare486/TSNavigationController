# TSNavigation 文档说明

### 关于Navigation的使用
 - 创建Navigaion时使用TSNavigationController来代替系统UINavigationController，创建方式只能使用init(rootViewController:) , 其他配置UI的方法与系统的一样

***注意: 不能直接使用 NavigaionController.viewControllers = [UIViewController] 这种方式***

> override public init(rootViewController: UIViewController)



### 关于UIViewController的NavigationBar的快捷配置方法


1. 导航栏透明且隐藏底部黑线 ---> ` func ts_navBarHiddenBar() `   
2. 导航栏隐藏底部黑线 ---> ` func ts_shadowHidden() `   
3. 彻底隐藏导航栏 ---> ` func ts_navBarHiddenAll() `   
4. 设置导航栏模糊效果；true为模糊，false为不模糊 ---> ` func ts_isTranslucent(translucent: Bool) `   
5. 设置导航栏背景颜色 ---> ` func ts_navBarColor(color: UIColor) `   
6. 设置导航栏标题颜色 ---> ` func ts_navTitleColor(color: UIColor) `
7. 设置导航栏主题颜色 ---> ` func ts_navTintColor(color: UIColor) `
8. 设置导航栏图片(支持透明度调整，可用第9条方法调整透明度) ---> ` func ts_navBarImg(img: UIImage) `
9. 设置导航栏图片透明度 ---> ` func ts_navBarImgAlpha(alpha: Float) `
10. 获取导航栏高度 ---> ` func ts_naviBarHeight() `
