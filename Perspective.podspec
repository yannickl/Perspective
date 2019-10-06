Pod::Spec.new do |s|
  s.name             = 'Perspective'
  s.version          = '0.9.1'
  s.license          = 'MIT'
  s.swift_version    = ['5.0', '5.1']
  s.summary          = 'Powerful scrolling and motion parallax for iOS.'
  s.homepage         = 'https://github.com/yannickl/Perspective.git'
  s.social_media_url = 'https://twitter.com/yannickloriot'
  s.authors          = { 'Yannick Loriot' => 'contact@yannickloriot.com' }
  s.source           = { :git => 'https://github.com/yannickl/Perspective.git', :tag => s.version }
  s.screenshot       = 'https://user-images.githubusercontent.com/798235/51686425-a60d1c80-1ff0-11e9-92e6-d2a0166eaa88.png'

  s.ios.deployment_target = '11.0'

  s.ios.framework = 'UIKit'

  s.source_files = 'Sources/**/*.swift'
  s.requires_arc = true
end
