#
# Be sure to run `pod lib lint SOM.UI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SOM.UI'
  s.version          = '0.0.1'
  s.summary          = 'Testing a git with cocoapods - AKGitViewControllers.'
  s.description      = 'TODO: Add long description of the pod here.DESC LETS try make first PODS'
  s.homepage         = 'https://github.com/BooNoo/SOM.UI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vladimir' => 'swiftment.work@gmail.com' }
  s.source           = { :git => 'https://github.com/BooNoo/SOM.UI.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.2'
  s.source_files = 'SOM.UI/Classes/**/*'
  s.swift_version = '4.2'
  s.exclude_files = "Constrictor/Constrictor/*.plist"
  # s.resource_bundles = {
  #   'SOM.UI' => ['SOM.UI/Assets/*.png']
  # }
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
