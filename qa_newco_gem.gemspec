# frozen_string_literal: true

require_relative "lib/qa_newco_gem/version"

Gem::Specification.new do |spec|
  spec.name = "qa_newco_gem"
  spec.version = QaNewcoGem::VERSION
  spec.authors = ['LucasKoritar23']
  spec.email = ['lucas.gimenes23@gmail.com']

  spec.summary = 'A hello gem to the ruby world'
  spec.description = 'I just created this gem to say hello for the ruby gems world, okay.'
  spec.homepage = ''
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'httparty'
  spec.add_development_dependency 'logger'
end
