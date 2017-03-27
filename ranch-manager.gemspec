# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','ranch-manager','version.rb'])

spec = Gem::Specification.new do |s|
  s.name = 'ranch-manager'
  s.license = "MIT"
  s.version = RanchManager::VERSION
  s.author = 'Peregrinator'
  s.email = 'bob.burbach@gmail.co'
  s.homepage = 'https://github.com/peregrinator/ranch-manager'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Command line tools for using Rancher in a development environment'

  s.files = `git ls-files`.split("
")

  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','ranch-manager.rdoc']
  s.rdoc_options << '--title' << 'ranch-manager' << '--main' << 'README.rdoc' << '-ri'

  s.bindir = 'bin'
  s.executables << 'ranch-manager'

  s.add_development_dependency('rake', '~> 12.0.0')
  s.add_development_dependency('rdoc', '~> 5.1.0')
  s.add_development_dependency('pry', '~> 0.10.4')

  s.add_runtime_dependency('gli','2.16.0')
  s.add_runtime_dependency('ghost','1.0.0')
end
