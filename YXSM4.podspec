#
#  Be sure to run `pod spec lint YXSM4.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "YXSM4"
  s.version      = "1.0.0"
  s.summary      = "SM3,SM4加密"
  s.description  = <<-DESC
                   SM3,SM4加密,国密
                   DESC

  s.homepage     = "https://github.com/ShaoGangGitHub/YXSM4.git"
  s.license      = "MIT"

  s.author             = { "shaog" => "774031355@qq.com" }

 
  s.platform     = :ios





  s.source       = { :git => "https://github.com/ShaoGangGitHub/YXSM4.git", :tag => "#{s.version}" }

  s.source_files  = "YXSM4", "YXSM4/**/*.{h,m}"



end
