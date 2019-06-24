#
# Be sure to run `pod lib lint BMUIDecorator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BMUIDecorator'
  s.version          = '0.1.0'
  s.summary          = 'A ideal for utilizing json file to style UI'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Since the consistency in UI style is overwhelming our work, I need a system to avoid the chaos style.
The idea is by providing several json which define separate categories of styles, and then programers writes out style code in Decorator Code, finally matching them by Tags.
                       DESC

  s.homepage         = 'https://github.com/tzef/BMUIDecorator'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LEE ZHE YU' => 'tzef8220@gmail.com' }
  s.source           = { :git => 'https://github.com/tzef/BMUIDecorator.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Classes/**/*'
  s.swift_version = '5.0'

  # s.resource_bundles = {
  #   'BMUIDecorator' => ['BMUIDecorator/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
