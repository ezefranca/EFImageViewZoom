Pod::Spec.new do |s|
  s.name             = 'EFImageViewZoom'
  s.version          = '0.0.3'
  s.summary          = 'A very simple IBDesignable UIImageView with pinch zoom swift.'

  s.description      = <<-DESC
🌃 A very simple IBDesignable UIImageView with pinch zoom swift
                       DESC

  s.homepage         = 'https://github.com/ezefranca/EFImageViewZoom'
  s.screenshots     = 'https://camo.githubusercontent.com/1ad347256a484660cee3a1056f43a14b3215cf9d/68747470733a2f2f6d656469612e67697068792e636f6d2f6d656469612f7645426469696a6c674b3842572f67697068792e676966', 'https://camo.githubusercontent.com/6f69a608764e0db023b26906fee5bba6c117488d/68747470733a2f2f6d656469612e67697068792e636f6d2f6d656469612f317a4a4347556271477a4a4a65726b6f6b4c2f67697068792e676966'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ezefranca' => 'ezequiel.ifsp@gmail.com' }
  s.source           = { :git => 'https://github.com/ezefranca/EFImageViewZoom.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ezefranca'

  s.ios.deployment_target = '10.0'

  s.source_files = 'EFImageViewZoom.swift'

end
