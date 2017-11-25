Pod::Spec.new do |s|

s.name = 'AEAccordion'
s.version = '2.0.1'
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.summary = 'UITableViewController with accordion effect (expand / collapse cells)'

s.homepage = 'https://github.com/tadija/AEAccordion'
s.author = { 'tadija' => 'tadija@me.com' }
s.social_media_url = 'http://twitter.com/tadija'

s.source = { :git => 'https://github.com/tadija/AEAccordion.git', :tag => s.version }
s.source_files = 'Sources/*.swift'

s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

s.ios.deployment_target = '9.0'

end
