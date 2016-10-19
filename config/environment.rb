require 'bundler/setup'
Bundler.require

require_all('app/')

set :database, {adapter: "sqlite3", database: "db/database.sqlite3"}

require 'yelp'

Yelp.client.configure do |config|
  config.consumer_key = 'b_Cf5dt8sVO8mMg4QrUuKA'
  config.consumer_secret = '9p-c7UF8tiVVEZFwhTAY5aQgKo8'
  config.token = 'qFfEzYnzggpSLb5L89PSGJjqcq-Lhhx0'
  config.token_secret = '0qsNvgRw_N0dLwqzNuMS9tMxYEQ'
end
