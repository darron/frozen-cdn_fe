source 'http://rubygems.org'

gem 'rails', '3.2.1'

gem 'mysql2'
gem 'haml'
gem 'devise'
gem 'kaminari'
gem 'cancan'

gem 'foreman'
gem 'resque', require: 'resque/server', git: 'git://github.com/defunkt/resque.git'

gem "airbrake", git: 'https://github.com/airbrake/airbrake.git'

gem 'uuid'

gem 'lumberjack'
gem 'lumberjack_syslog_device'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development, :test do
  gem 'capybara'
  gem 'rspec-rails'
  gem 'haml-rails'
  gem 'hpricot'
  gem 'ruby_parser'
  gem 'web-app-theme', :git => 'https://github.com/pilu/web-app-theme.git'
  gem 'capistrano'
  gem 'capistrano_colors'
  gem 'vmc'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
group :production do
  gem 'unicorn'
  gem 'therubyracer'
end

# Deploy with Capistrano


# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

