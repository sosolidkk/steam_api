# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in steam-interface.gemspec
gemspec

gem 'rake', '~> 13.0'

gem 'byebug', '~> 11.1', '>= 11.1.3', platforms: %i[mri mingw x64_mingw]
gem 'rspec', '~> 3.0'
gem 'simplecov', require: false
gem 'vcr', '~> 3.0', '>= 3.0.1', require: false
gem 'webmock', '~> 3.4', require: false

gem 'rubocop', '~> 1.21'

group :development do
  gem 'pronto-brakeman', '~> 0.11.0', require: false
  gem 'pronto-fasterer', '~> 0.11.0', require: false
  gem 'pronto-flay', '~> 0.11.0', require: false
  gem 'pronto-reek', '~> 0.11.0', require: false
  gem 'pronto-rubocop', '~> 0.11.0', require: false
  gem 'pronto', '~> 0.11.0'
end
