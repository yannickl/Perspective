Pod::Spec.new do |s|
  s.name             = 'Perspective'
  s.version          = '0.9.0'
  s.license          = 'MIT'
  s.summary          = 'Powerful scrolling and motion parallax for iOS.'
  s.homepage         = 'https://github.com/yannickl/Perspective.git'
  s.social_media_url = 'https://twitter.com/yannickloriot'
  s.authors          = { 'Yannick Loriot' => 'contact@yannickloriot.com' }
  s.source           = { :git => 'https://github.com/yannickl/Perspective.git', :tag => s.version }
  s.screenshot       = 'https://user-images.githubusercontent.com/798235/51530434-36096580-1e3b-11e9-935e-8d5114c344ed.png'

  s.ios.deployment_target = '11.0'

  s.ios.framework = 'UIKit'

  s.source_files = 'Sources/*.swift'
  s.requires_arc = true
end
