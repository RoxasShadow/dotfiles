Kernel.load 'lib/${project_name}/version.rb'

Gem::Specification.new { |s|
  s.name          = '${project_name}'
  s.version       = ${project_title}::VERSION
  s.author        = 'Giovanni Capuano'
  s.email         = 'webmaster@giovannicapuano.net'
  s.homepage      = 'http://www.giovannicapuano.net'
  s.platform      = Gem::Platform::RUBY
  s.summary       = '.'
  s.description   = '..'
  s.licenses      = 'WTFPL'

  s.require_paths = ['lib']
  s.files         = Dir.glob('lib/**/*.rb')
  s.executables   = '${project_name}'
  s.test_files    = Dir.glob('spec/**/*_spec.rb')

  s.add_dependency ' '

  s.add_development_dependency 'rake'
}