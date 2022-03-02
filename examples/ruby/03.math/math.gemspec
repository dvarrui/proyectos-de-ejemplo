require 'date'
require_relative 'lib/math-polinomios/version'

Gem::Specification.new do |s|
  s.name        = Version::GEMNAME
  s.version     = Version::VERSION
  s.date        = Date.today.strftime("%Y-%m-%d")
  s.summary     = "Math polonomios"
  s.description = <<-EOF
    Math polinomios.
  EOF

  s.extra_rdoc_files = [ 'README.md', 'LICENSE' ] +
                       Dir.glob(File.join('docs','**','*.md'))

  s.license     = 'GPL-3.0'
  s.authors     = ['David Vargas Ruiz']
  s.email       = 'dvarrui@protonmail.com'
  s.homepage    = Version::HOMEPAGE

  s.executables << Version::NAME
  s.files       = Dir.glob(File.join('lib', '**', '*.*'))

  s.required_ruby_version = '>= 2.5.0'

  s.add_runtime_dependency 'colorize', '~> 0.8.1'

  s.add_development_dependency 'minitest', '~> 5.11'
end
