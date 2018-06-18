#
#  Be sure to run `pod spec lint TSNavigationController.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "TSNavigationController"
  s.version      = "1.0.0"
  s.summary      = "this is app navigation structure"

  s.description  = <<-DESC
                    这是一个导航栏结构，支付导航栏自定义透明度，自定义背景图片的操作
                   DESC
  s.platform     = :ios, "8.0"
  s.homepage     = "https://www.jianshu.com/u/8a7102c0b777"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "yuchenH" => "huangyuchen@caiqr.com" }
 
  s.source       = { :git => "http://gitlab.caiqr.com/ios_module/TSNavigationController.git", :tag => s.version }

  s.source_files  = "TSNavigationController/code/main", "TSNavigationController/code/auxiliary"

  s.resources = "TSNavigationController/code/source"

  s.framework  = "UIKit","Foundation"

  s.swift_version = '4.0'

  s.requires_arc = true
end

