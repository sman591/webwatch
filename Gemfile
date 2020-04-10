source 'https://rubygems.org'

ruby IO.read(File.expand_path('.ruby-version', __dir__)).chomp

### Everything not wrapped with "custom gems" came default with Rails

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 5.0.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.3.1'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.x'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

###   Custom gems   ###

gem 'rodash', '~> 2.0'

gem 'dotenv-rails', '~> 2.2', require: 'dotenv/rails-now', group: %i[development test]

gem 'aws-sdk', '~> 2.3'
gem 'chunky_png', '~> 1.3.8'
gem 'haml-rails', '~> 1.0'
gem 'paperclip', '~> 5.2.0'
gem 'rollbar', '~> 2.14'
gem 'webshot', '~> 0.1.0'

gem 'omniauth', '~> 1.6.1'
gem 'omniauth-auth0', '~> 1.4.2'

gem 'validate_url', '~> 1.0'

gem 'sidekiq', '~> 6.0'
gem 'sidekiq-limit_fetch', '~> 3.4.0'

gem 'redis', '~> 4.0'

gem 'bootstrap', '4.0.0.alpha3'
gem 'font-awesome-rails', '~> 4.7'

source 'https://rails-assets.org' do
  gem 'rails-assets-jquery-timeago', '~> 1.5.4'
  gem 'rails-assets-simple-lightbox', '~> 1.2.9'
  gem 'rails-assets-tether', '>= 1.1.0'
  gem 'rails-assets-unveil', '~> 1.3.0'
end

group :production do
  gem 'rails_12factor', '~> 0.0.3'
end

group :test do
  gem 'shoulda-context', '~> 1.2'
  gem 'shoulda-matchers', '~> 3.1'
end

### End custom gems ###

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'

  ###   Custom gems   ###

  gem 'guard'
  gem 'guard-minitest'

  ### End custom gems ###
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# However, we don't use Windows, so this is gem is excluded
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
