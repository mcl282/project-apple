source 'https://rubygems.org'
ruby "2.3.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

# devise gem
gem 'devise', '~> 3.5', '>= 3.5.6'
gem 'devise_invitable', '~> 1.6'

#boostrap
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc



# gem for finding location based on ip address
gem 'geocoder', '~> 1.3', '>= 1.3.1'

#add figaro to manage api keys
gem 'figaro', '~> 1.1', '>= 1.1.1'

#for sendgrid web API
gem 'sendgrid', '~> 1.2', '>= 1.2.4'

#for photo uploads
gem 'carrierwave', '~> 0.11.2'
gem 'mini_magick', '~> 4.5', '>= 4.5.1'
gem 'fog', '~> 1.38'



# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#need this for guard to run
gem 'guard', '~> 2.13'

group :production do
  gem 'pg', '~> 0.18.4'
  gem 'rails_12factor', '~> 0.0.3'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  #preview emails
  gem 'letter_opener', '~> 1.4', '>= 1.4.1'
end
group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  

end

group :test do  
  gem 'minitest-reporters', '~> 1.1', '>= 1.1.8'
  gem 'mini_backtrace', '~> 0.1.3'
  gem 'guard-minitest', '~> 2.4', '>= 2.4.4'
end

