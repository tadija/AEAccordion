Pod::Spec.new do |s|

s.name = 'AEAccordion'
s.version = '2.1.0'
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.summary = 'UITableViewController with accordion effect (expand / collapse cells)'

s.source = { :git => 'https://github.com/tadija/AEAccordion.git', :tag => s.version }
s.source_files = 'Sources/*.swift'

s.swift_version = '4.2'

s.ios.deployment_target = '9.0'

s.homepage = 'https://github.com/tadija/AEAccordion'
s.author = { 'tadija' => 'tadija@me.com' }
s.social_media_url = 'http://twitter.com/tadija'

end
