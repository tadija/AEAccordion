Pod::Spec.new do |s|
s.name = 'AEXibceptionView'
s.version = '1.0.0'
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.summary = 'Nested XIB files (XIB inside XIB)'

s.homepage = 'https://github.com/tadija/AEAccordion'
s.author = { 'Marko Tadić' => 'tadija@me.com' }
s.social_media_url = 'http://twitter.com/tadija'

s.source = { :git => 'https://github.com/tadija/AEAccordion.git', :tag => 'AEXibceptionView-v'+String(s.version) }
s.source_files = 'AEXibceptionView/*.swift'
s.ios.deployment_target = '9.0'
end