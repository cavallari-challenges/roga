source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails',      '~> 6.0.3', '>= 6.0.3.2'
gem 'pg',         '1.2.3'
gem 'puma',       '~> 4.1'
gem 'bootsnap',   '>= 1.4.2', require: false
gem 'devise',     '4.7.2'
gem 'devise-jwt', '0.7.0'
gem 'rack-cors',  '1.1.1'
gem 'kaminari',   '1.2.1'
gem 'jbuilder',   '2.10.0'

group :development, :test do
  gem 'dotenv-rails', '2.7.5'
  gem 'pry-byebug',   '3.9.0'
  gem 'pry-rails',    '0.3.9'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

group :development do
  gem 'listen',                '~> 3.2'
  gem 'spring',                '2.1.0'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
