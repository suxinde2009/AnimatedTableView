Pod::Spec.new do |s|
  s.name         = "AnimatedTableView"
  s.version      = "1.0.0"
  s.summary      = "AnimatedTableView is a drop-in subclass of UITableView that lets you add custom animations to any UITableView."

  s.homepage     = "https://github.com/suxinde2009/AnimatedTableView"
  s.license      = "MIT"
  s.author             = { "suxinde2009" => "suxinde2009@126.com" }
  s.source       = { :git => "https://github.com/suxinde2009/AnimatedTableView.git", :tag => "#{s.version}" }
  
  s.swift_version = "4.0"
  s.ios.deployment_target = "9.0"
  
  s.source_files  = "AnimatedTableView/**/*.h", "AnimatedTableView/**/*.{h,m,swift}"
  s.public_header_files = "AnimatedTableView/**/*.h", "AnimatedTableView/**/*.h"
  s.frameworks = "UIKit", "Foundation"
end
