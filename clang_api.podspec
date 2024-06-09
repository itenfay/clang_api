Pod::Spec.new do |s|
  s.name         = "clang_api"
  s.version      = "1.1.0"
  s.summary      = "存取bundle中的资源，读取本地化文本，执行选择器和UserDefaults的相关操作，调用通知中心的相关操作等。"
  s.homepage     = "https://github.com/itenfay/clang_api"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Tenfay" => "hansen981@126.com" }
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/itenfay/clang_api.git", :tag => s.version.to_s }
  s.source_files  = "clang_api/Classes/**/*.{h,m}"
  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true
end
