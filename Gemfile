source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3'
# Postgres for Database
gem 'pg', '~> 1.2'
# Use Puma as the app server
gem 'puma', '~> 5.0'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

gem 'bootsnap', '~> 1.7'

# To handle JWT
gem 'jwt', '~> 2.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Rubocop: linter
  gem 'rubocop', '~> 1.7'
  gem 'rubocop-rails', '~> 2.9'
  gem 'rubocop-rspec', '~> 2.2'
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-mocks'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'
end
