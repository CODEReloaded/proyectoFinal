source 'https://rubygems.org'

ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster.
# Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# gem for css
gem 'bootstrap', '~> 4.0.0.alpha3'
# gem for fonts
gem "font-awesome-rails" , '~> 4.5.0.1'

# gem for bootstrap.js
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '~> 1.1.1'
end

# Form builders
gem 'simple_form', '~> 3.2.0'

# Enums for (radio, checkbox) 'buttons' in simple_form
gem 'enumerize'

# Translations
gem 'rails-i18n', '~> 4.0.0'

# Authentication
gem 'devise', github: 'plataformatec/devise'
gem 'devise-i18n'
gem 'devise-encryptable'
gem 'omniauth-twitter'
gem 'omniauth-facebook'

# Pagination
gem 'kaminari', '~> 0.16.3'

# pet's photo
gem 'carrierwave'
gem 'rmagick', '~> 2.15', '>= 2.15.4'
gem 'refile-mini_magick'

# Autorization
gem 'cancancan', '~> 1.13'

# url customized
gem 'friendly_id', '~> 5.1'

# geolocation
gem 'geokit', '~> 1.10'
gem 'geokit-rails'
gem 'gmaps4rails'
gem 'underscore-rails'

# phone validation
gem 'phonelib'

# soft deleting
gem 'paranoia', '~> 2.1.5'

# Social actions, for "I'm interested in this pet"
gem "acts_as_follower"

# Social events (comment, share)
gem 'acts_as_commentable_with_threading'
gem 'commontator', '~> 4.11', '>= 4.11.1'
gem 'unread', '~> 0.8.0'

# This gem is for better-errors gem
gem 'binding_of_caller'

gem 'rails_12factor'
gem "rails-erd"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # To generate random objects for development environment
  gem 'ffaker', '~> 2.2'
  # To generate random objects for production environment
  gem 'factory_girl', '~> 4.7'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. 
  # Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'better_errors'
end