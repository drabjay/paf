lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paf/version'

Gem::Specification.new do |spec|
  spec.name          = 'paf'
  spec.version       = Paf::VERSION
  spec.authors       = ['John Bard']
  spec.email         = ['johnbard@globalnet.co.uk']
  spec.homepage      = 'https://github.com/drabjay/paf'

  spec.summary       = 'Royal Mail Postcode Address File (PAF) Formatter'
  spec.description   = <<-DESC
    A gem to format the elements of a Royal Mail Postcode Address File entry
    according to the rules described in the Royal Mail Programmer's Guide
    Edition 7, Version 6.2
    (https://www.poweredbypaf.com/wp-content/uploads/2024/11/Latest-Programmers_guide_Edition-7-Version-6-2.pdf)
  DESC
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.4'
  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.5'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'rubocop', '~> 0.49'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.4'
end
