#
#  Be sure to run `pod spec lint HUCircleImage.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "HUCircleImage"
  s.version      = "0.0.2"
  s.summary      = "圆角图片处理，支持网络图"
  s.homepage     = "https://github.com/hujewelz"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license      = "MIT"
  s.author             = { "Jewelz Hu" => "hujewelz@163.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/hujewelz/HUCircleImage.git", :tag => "0.0.2" }
  s.source_files  = "HUCircleImage/source/**/*.{h,m}"
  s.framework  = "UIKit"

  
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
