Pod::Spec.new do |spec|

  spec.name         = "LCPermissionsKit"
  
  spec.version      = "1.0.3"
  
  spec.summary      = "LCPermissionsKit is a convenient wrapper on the macOS permissions API"
  
  spec.description  = <<-DESC
  LCPermissionsKit is a convenient wrapper on the macOS permissions API, including photos, contacts, reminders, and full disk access permissions
                   DESC

  spec.homepage       = "https://github.com/DevLiuSir/LCPermissionsKit"
  
  spec.license        = { :type => "MIT", :file => "LICENSE" }
  
  spec.author         = { "Marvin" => "93428739@qq.com" }
  
  spec.swift_versions = ['5.0']
  
  spec.platform       = :osx
  
  spec.osx.deployment_target = "10.13"

  spec.source       = { :git => "https://github.com/DevLiuSir/LCPermissionsKit.git", :tag => "#{spec.version}" }
  
  spec.source_files = "Sources/LCPermissionsKit/**/*.{h,m,swift}"

  spec.frameworks   = 'Cocoa', 'Contacts', 'EventKit', 'Photos'

end
