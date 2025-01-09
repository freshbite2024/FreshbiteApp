source "https://rubygems.org"

ruby '3.3.5'  # Specify Ruby version for compatibility

gem 'mysql2', '~> 0.5.3'  # Ensure compatibility with MySQL
gem 'activerecord', '~> 6.0.0'  # Compatible with Ruby >= 2.5
gem 'puma', '~> 5.6.4'   # Puma is the default web server for Heroku
gem 'dotenv', '~> 2.8.1'  # For environment variables (useful for Heroku config vars)
gem 'rack', '~> 3.0'  # Rack is required for Heroku apps
gem 'sinatra', '~> 3.0'  # Sinatra for the web framework
gem 'sinatra-contrib', '~> 3.0'  # Sinatra extra functionality (optional, but common)

group :production do
  # gem 'pg'  # Heroku uses PostgreSQL by default, but you are using MySQL, so this is optional.
  gem 'heroku'  # Heroku gem (if needed for managing apps)
end

# group :development, :test do
#   gem 'sqlite3', '~> 1.4'  # For development and testing if you're using SQLite locally
# end
