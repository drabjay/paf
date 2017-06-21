# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paf/version'

Gem::Specification.new do |spec|
  spec.name          = 'paf'
  spec.version       = Paf::VERSION
  spec.authors       = ['John Bard']
  spec.email         = ['johnbard@globalnet.co.uk']

  spec.summary       = 'Royal Mail Postcode Address File (PAF) Formatter'
  spec.description   = <<-EOF
    A gem to format the elements of a Royal Mail Postcode Address File entry
    according to the rules described in the Royal Mail Programmer's Guide
    Edition 7, Version 5.0
    (http://www.royalmail.com/sites/default/files/docs/pdf/programmers_guide_edition_7_v5.pdf)
  EOF
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.5'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'rubocop', '~> 0.49'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.4'
end
