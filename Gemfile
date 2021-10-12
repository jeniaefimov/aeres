# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "dotenv-rails", "~> 2.7", ">= 2.7.6", require: "dotenv/rails-now"

gem "rails", "~> 6.1.1"
gem "pg", "~> 1.1"
gem "puma", "~> 5.5"

gem "graphql", "~> 1.12.3"
gem "strong_migrations", "~> 0.7.6"

gem "clearance", "~> 1.12"

group :development, :test do
  gem "pry", "~> 0.14.0"
end

group :development do
  gem "rubocop", "~> 1.8", require: false
  gem "rubocop-rails", "~> 2.8", ">= 2.8.1"
  gem "rubocop-rspec", "~> 2.1"
end

group :test do
  gem "rspec-rails", "~> 4.0.2"
  gem "factory_bot_rails", "~> 6.1.0"
end
