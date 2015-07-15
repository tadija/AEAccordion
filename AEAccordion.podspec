Pod::Spec.new do |s|
s.name = 'AEAccordion'
s.version = '1.0.0'
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.summary = 'UITableViewController with accordion effect (expand / collapse cells)'

s.homepage = 'https://github.com/tadija/AEAccordion'
s.author = { 'Marko Tadić' => 'tadija@me.com' }
s.social_media_url = 'http://twitter.com/tadija'

s.source = { :git => 'https://github.com/tadija/AEAccordion.git', :tag => s.version }
s.source_files = 'AEAccordion/*.swift'
s.ios.deployment_target = '9.0'
end