source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
#gem 'activerecord-jdbcsqlite3-adapter', :require => 'jdbc-sqlite3', :require =>'arjdbc'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  
  gem 'bootstrap-sass', '~> 2.2.1.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :development do
  gem "debugger"
  gem "cucumber-rails", :require => false
end

group :test do
  gem "debugger"
  gem "autotest"
end

gem "capybara", :group => [:development, :test]
gem "haml", ">= 3.0.0"
gem "haml-rails"
gem 'jquery-rails', '~> 2.3.0'
gem "rspec-rails", ">= 2.0.1", :group => [:development, :test]
gem "factory_girl_rails"

gem 'thin'

gem "micromidi"
