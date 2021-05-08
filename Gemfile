# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'rails', '~> 6.1.3'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'friendly_id'
gem 'mail_form'
gem 'pagy', '~> 3.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'recaptcha', '~> 5.7'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'faker'
end

group :development do
  gem 'brakeman'
  gem 'bullet', '~> 6.1.0'
  gem 'listen', '~> 3.2'
  gem 'rubocop'
  gem 'rubocop-minitest', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara',                 '3.28.0'
  gem 'guard',                    '2.15.0'
  gem 'guard-minitest',           '2.4.6'
  gem 'minitest',                 '5.14.2'
  gem 'minitest-reporters',       '1.3.8'
  gem 'rails-controller-testing', '1.0.4'
  gem 'selenium-webdriver',       '3.142.4'
  gem 'webdrivers',               '4.1.2'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
