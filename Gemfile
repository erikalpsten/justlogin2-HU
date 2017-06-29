source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'haml-rails'
gem 'font-awesome-rails'
gem 'money'
gem 'gibbon'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'refinerycms', '~> 3.0.0'
gem 'refinerycms-authentication-devise', '~> 1.0.4'
gem 'refinerycms-settings'
gem 'figaro'
gem 'dragonfly-s3_data_store', require: 'dragonfly/s3_data_store'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

# group :production do
#   gem 'rails_12factor'
# end

group :development do
  gem 'better_errors'
  gem 'capistrano', '~> 3.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rails', '~> 1.1.3'
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm', '~> 0.1.2'
  gem 'capistrano3-unicorn'
  gem 'html2haml'
  gem 'hub', :require => nil
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'guard-bundler', require: false
  gem 'guard-rails', require: false
  gem 'guard-rspec', require: false
  gem 'guard-cucumber', require: false
  gem 'rb-fchange', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-inotify', :require => false
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'web-console', '~> 2.0'
  gem 'letter_opener'
end

gem 'refinerycms-wymeditor', ['~> 1.0', '>= 1.0.7']
gem 'refinerycms-acts-as-indexed', '~> 3.0.0'
gem 'refinerycms-products', path: 'vendor/extensions'

gem 'refinerycms-policies', path: 'vendor/extensions'