To create a basic application:
-----------------------------

main.rb

    require 'sinatra'

    get '/' do
      "hello world"
    end

Gemfile

    source :rubygems

    gem 'heroku'
    gem 'sinatra'
    gem 'thin'

config.ru

    require './main'
    run Sinatra::Application

Deploy

    $ bundle install
    $ git init
    $ git add .
    $ git commit -am "initial commit"
    $ heroku create <my-app-name>
    $ git push heroku master

Tha's right: No Procfile!

blackjack-sinatra
=================

1. Create an account on Heroku.
1. Install the gem sudo gem install heroku.
1. Generate an SSH key.

### Putting it up on Heroku

1. $ git clone 
1. $ gem install bundler
1. $ bundle
1. $ heroku create
1. $ git push heroku master
1. $ bundle exec heroku open

### Running it locally

1. $ git clone 
1. $ gem install bundler
1. $ bundle
1. $ bundle exec foreman
1. Navigate to localhost:5000 | 5100

### Update

1. git add .
1. git commit -m "updated the header and footer"
1. git push heroku master
