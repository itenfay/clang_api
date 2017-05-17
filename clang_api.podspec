Pod::Spec.new do |s|
  s.name         = "clang_api"
  s.version      = "1.0.6"
  s.summary      = "Using the C method to call the Objective-C interface, convenient and easy to use it."
  s.homepage     = "https://github.com/Eastze/clang_api"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Eastze" => "vinphy88@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = "6.0"
  s.source       = { :git => "https://github.com/Eastze/clang_api.git", :tag => s.version.to_s }
  s.source_files  = "clang_api/Classes/**/*.{h,m}"
  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true
end
