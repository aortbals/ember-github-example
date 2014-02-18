source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

## Style ##
gem 'sass-rails', '~> 4.0.0'  # Use SCSS for stylesheets
gem 'bourbon'                 # Bourbon.io, a simple and lightweight mixin library for Sass
gem 'neat'                    # Bourbon Neat, a lightweight semantic grid framework for Sass and Bourbon
gem 'bitters'                 # A dash of predefined style for your Bourbon stylesheets

## Javascript ##
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'ember-rails'
gem 'ember-source', '~> 1.4.0'
gem 'ember-data-source', '~> 1.0.0.beta.5'

group :development, :test do
  gem 'rspec-rails', '~> 2.0'
  gem 'fabrication' # Model stubber
  gem 'pry'         # Debugger
  gem 'shoulda'     # Matchers for rspec
end

group :developement do
  gem 'guard'         # Handle events on file system modifications
  gem 'guard-rspec'   # Run rspec specs automatically
end

group :test do
  gem 'vcr'         # Record HTTP interactions
  gem 'webmock'     # Stub HTTP requests
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'
