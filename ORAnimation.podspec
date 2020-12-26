#
# Be sure to run `pod lib lint ORAnimation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ORAnimation'
  s.version          = '3.1.4'
  s.summary          = 'ORAnimation.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC 
  'A short description of ORAnimation.' 
  						DESC

  s.homepage         = 'https://github.com/Omega-R/ORAnimation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Egor Lindberg' => 'egor-lindberg@omega-r.com' }
  s.source           = { :git => 'https://github.com/Omega-R/ORAnimation.git', :branch => 'add_spm_support', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'

  s.source_files = 'Sources/ORAnimation/**/*'
  
  # s.resource_bundles = {
  #   'ORAnimation' => ['ORAnimation/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
