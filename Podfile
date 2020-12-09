# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
inhibit_all_warnings!
#source 'https://github.com/CocoaPods/Specs.git'

target 'WWProject' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for WWProject
	
  pod 'AFNetworking', '~> 3.2.1'
  pod 'MJRefresh'
  pod 'MJExtension'
  pod 'Masonry'
  pod 'MBProgressHUD'
  pod 'WWKit', :path => 'WWKit/'
  pod 'XLPhotoBrowser+CoderXL', :git => 'https://github.com/tbl00c/XLPhotoBrowser.git', :tag => '1.2.1'
  pod 'ZZFLEX', :subspecs => ['ZZFLEX', 'DataBindKit'], :git => 'git@gitee.com:wwzAwen/ZZFLEX.git'

  target 'WWProjectTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'WWProjectUITests' do
    # Pods for testing
  end

end
