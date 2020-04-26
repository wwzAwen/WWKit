#
#  Be sure to run `pod spec lint WWKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "WWKit"
  spec.version      = "1.0.0"
  spec.summary      = "WWKit."
  spec.description  = "简单易用的APP架构"
  spec.homepage     = "https://github.com/wwzAwen/WWKit"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  spec.license      = "MIT"
  spec.author       = { "王文照" => "287312333@qq.com" }
  spec.source       = { :git => "https://github.com/wwzAwen/WWKit.git", :tag => "#{spec.version}" }
  spec.source_files  = "ZMTKit", "ZMTKit/**/*.{h,m}","ZMTKit/*.{h,m}","ZMTKit/**/**/*.{h,m}",
  # spec.exclude_files = "Classes/Exclude"
  spec.platform     = :ios, "9.0"
  spec.ios.deployment_target =  '9.0'
  spec.public_header_files = "ZMTKit/*.h"
  spec.private_header_files = "ZMTKit/*.pch", "ZMTKit/*.plist"
  spec.requires_arc = true
  spec.dependency 'AFNetworking'
  spec.dependency 'MJRefresh'
  spec.dependency 'MJExtension'
  spec.dependency 'Masonry'
  spec.dependency 'MBProgressHUD'


end
