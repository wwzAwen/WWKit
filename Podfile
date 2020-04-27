# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

platform :ios, '9.0'
inhibit_all_warnings!

workspace 'ZMTKit.xcworkspace'
source 'https://github.com/CocoaPods/Specs.git'

def comment_pods
  pod 'AFNetworking', '~> 3.2.1'
  pod 'MJRefresh'
  pod 'MJExtension'
  pod 'Masonry'
  pod 'MBProgressHUD'
end

target 'WWProject' do
  use_frameworks!
  project 'WWProject/WWProject.xcodeproj'
  
  comment_pods
  
  target 'WWProjectTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'WWProjectUITests' do
    inherit! :search_paths
    # Pods for testing
  end
  
end

target 'ZMTKit' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  project 'WWKit/ZMTKit.xcodeproj'
  # Pods for ZMTKit
  
  comment_pods
  
  target 'ZMTKitTests' do
    inherit! :search_paths
    # Pods for testing
  end

end