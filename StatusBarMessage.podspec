#
# Be sure to run `pod lib lint StatusBarMessage.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StatusBarMessage'
  s.version          = '0.1.1'
  s.summary          = 'pull down tips from top of status bar'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A very simple tips use to pull down from top of status bar
                       DESC

  s.homepage         = 'https://github.com/LINAICAI/StatusBarMessage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'linaicai' => 'linaicai2012@gmail.com' }
  s.source           = { :git => 'https://github.com/LINAICAI/StatusBarMessage.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'StatusBarMessage/Classes/**/*'
  s.frameworks = 'UIKit', 'Foundation'
end
