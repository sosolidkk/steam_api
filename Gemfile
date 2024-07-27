# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in steam_api.gemspec
gemspec

group :development, :test do
  # Ruby's bikeshed-proof linter and formatter.
  # See: [https://rubygems.org/gems/standard]
  gem 'standard', '~> 1.3'

  # Debugging tool for Ruby.
  # See: [https://rubygems.org/gems/debug]
  gem 'debug', '~> 1.9'

  # A Ruby gem to test Ruby code.
  # See: [https://github.com/rspec]
  gem 'rspec', '~> 3.4'

  # Record your test suite's HTTP interactions and replay them during future test runs for fast, deterministic, and
  # accurate tests [https://rubygems.org/gems/vcr]
  gem 'vcr', '~> 6.2'

  # Library for stubbing and setting expectations on HTTP requests in Ruby.
  # See: [https://rubygems.org/gems/webmock]
  gem 'webmock', '~> 3.23'
end

group :test do
  # A code coverage analysis tool for Ruby.
  # See: [https://rubygems.org/gems/simplecov]
  gem 'simplecov', '~> 0.22', require: false
end
