Pod::Spec.new do |s|

  s.name         = "RubiParser"
  s.version      = "1.0.2"
  s.summary      = "Ruby Character Parser"

  s.description  = <<-DESC
                   Swift Ruby character parser for NHK Easy News flavored HTML.
                   DESC

  s.homepage     = "https://github.com/KristopherGBaker/RubiParser"
  s.license      = "MIT"
  s.author             = { "Kristopher Baker" => "https://github.com/KristopherGBaker/" }
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source       = { :git => "https://github.com/KristopherGBaker/RubiParser.git", :tag => "#{s.version}" }

  s.source_files  = "RubiParser/**/*.swift"
  s.requires_arc = true

end
