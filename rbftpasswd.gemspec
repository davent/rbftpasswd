# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','rbftpasswd_version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'rbftpasswd'
  s.version = Rbftpasswd::VERSION
  s.author = 'Dave Avent'
  s.email = 'davent@lumux.co.uk'
  s.homepage = 'http://lumux.co.uk'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Manage ProFTPd password file'
# Add your other files here if you make them
  s.files = %w(
bin/rbftpasswd
lib/rbftpasswd_version.rb
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','rbftpasswd.rdoc']
  s.rdoc_options << '--title' << 'rbftpasswd' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'rbftpasswd'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_runtime_dependency('gli')
  s.add_runtime_dependency('highline')
end
