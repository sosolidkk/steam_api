# frozen_string_literal: true

require_relative 'lib/steam_api/version'

Gem::Specification.new do |spec|
  spec.name = 'steam_api'
  spec.version = SteamApi::VERSION
  spec.authors = ['Nuuvem Team']
  spec.email = ['developers@nuuvem.com']

  spec.summary = 'A ruby client to fetch the Steam Web Api'
  spec.homepage = 'https://rubygems.org/gems/'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'bin'
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '>= 4.0', '< 6.0'
  spec.add_dependency 'dry-configurable', '~> 0.15'
  spec.add_dependency 'dry-struct', '~> 1.4'
  spec.add_dependency 'typhoeus', '~> 1.4'
end
