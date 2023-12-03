# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "active_model_serializers" # ActiveModelSerializers is undergoing some renovations. See Development Status.
gem "bcrypt", "~> 3.1.7" # Use Active Model has_secure_password
gem "bootsnap", "~> 1.16", require: false # Reduces boot times through caching; required in config/boot.rb
gem "jwt", "~> 2.7.1", require: false # Use Json Web Token (JWT) for token based authentication
gem "lol_dba", "~> 2.4" # lol_dba is a small package of rake tasks that scan your application models
gem "pg", "~> 1.4.6" # Use postgresql as the database for Active Record
gem "puma", "~> 5.0" # Use the Puma web server [https://github.com/puma/puma]
gem "rails", "~> 7.0.8" # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "redis", "~> 5.0.7" # A Ruby client that tries to match Redis' API one-to-one
gem "sorbet-static-and-runtime", "~> 0.5.11029" # Sorbet static and runtime in one gem
gem "valid_email2", "~> 5.0.3" # ActiveModel validation for email

group :development, :test do
  gem "brakeman", "~> 6.0.0" # Brakeman is a static analysis tool which checks applications for security vulnerabilities
  gem "dotenv-rails", "~> 2.8.1" # Autoload dotenv in Rails.
  gem "factory_bot_rails", "~> 6.2.0" # factory_bot is a fixtures replacement with a straightforward definition syntax
  gem "pry-rails", "~> 0.3.9" # Avoid repeating yourself, use pry-rails instead of copying the initializer
  gem "rspec-rails", "~> 6.0.2" # rspec-rails brings the RSpec testing framework to Ruby on Rails
  gem "rubocop-performance", "~> 1.16.0", require: false # Performance optimization analysis for your projects
  gem "rubocop-rails", "~> 2.18.0", require: false # A RuboCop extension focused on enforcing Rails best practices
  gem "rubocop-shopify", "~> 2.13.0", require: false # Gem containing the rubocop.yml config that corresponds
  gem "rubocop-sorbet", "~> 0.7.0", require: false # Automatic Sorbet code style checking tool.
end

group :development do
  gem "annotate", "~> 3.2.0" # Add a comment summarizing the current schema to the top or bottom of each of your...
  gem "bullet", "~> 7.0.7" # help to kill N+1 queries and unused eager loading.
  gem "tapioca", "~> 0.11.3" # Tapioca makes it easy to work with Sorbet in your codebase.
end

group :test do
  gem "shoulda-matchers", "~> 5.3.0" # Shoulda Matchers provides RSpec- and Minitest-compatible one-liners
end
