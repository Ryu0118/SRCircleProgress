#
# Be sure to run `pod lib lint SRCircleProgress.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SRCircleProgress'
  s.version          = '0.2.1'
  s.summary          = 'A short description of SRCircleProgress.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Ryu0118/SRCircleProgress'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ryu0118' => 'ryunosuke.shibuya.3d@stu.hosei.ac.jp' }
  s.source           = { :git => 'https://github.com/Ryu0118/SRCircleProgress.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ryu_hu03'
  s.swift_versions   = ['5.3', '5.4', '5.5', '5.6']

  s.ios.deployment_target = '13.0'

  s.source_files = 'Sources/**/*'
  
  # s.resource_bundles = {
  #   'SRCircleProgress' => ['SRCircleProgress/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
