source 'https://rubygems.org'

gem 'sinatra'
gem 'haml'
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'rake'

group :development, :test do
  gem 'sqlite3'
end
 
group :production do
  gem 'pg' # this gem is required to use postgres on Heroku
end

group :test do
  gem "rspec"
  gem "rack-test"
  gem "factory_girl"
end