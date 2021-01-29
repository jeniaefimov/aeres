source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "rails", "~> 6.1.1"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"

gem "strong_migrations", "~> 0.7.6"

group :development, :test do
  gem "byebug"
end

group :development do
  gem 'rubocop', '~> 1.8', require: false
  gem 'rubocop-rails', '~> 2.8', '>= 2.8.1'
  gem 'rubocop-rspec', '~> 2.1'
end
