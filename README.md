Blackjack-Sinatra
================

Working App: http://desolate-bayou-1140.herokuapp.com/

To create a basic application in Sinatra:
-----------------------------

You need three files.

main.rb:

    require 'sinatra'

    get '/' do
      "hello world"
    end

Gemfile:

    source :rubygems

    gem 'heroku'
    gem 'sinatra'
    gem 'thin'

config.ru:

    require './main'
    run Sinatra::Application

Deploy

    $ bundle install
    $ git init
    $ git add .
    $ git commit -am "initial commit"
    $ heroku create <my-app-name>
    $ git push heroku master
    
Naviagate to the url or curl it.

That's right: No Procfile needed!

To work with Blackjack-Sinatra:
-----------------------------

1. Create an account on Heroku. (if neeeded)
1. Install the gem `sudo gem install heroku` (if needed)
1. Generate an SSH key. (if needed)

### Putting it up on Heroku

1. $ git clone git@github.com:mjhea0/blackjack-sinatra.git
1. $ bundle install
1. $ git init
1. $ git add .
1. $ git commit -m "initial commit"
1. $ heroku create <my-app-name.
1. $ git push heroku master

### Running it locally

1. $ git clone git@github.com:mjhea0/blackjack-sinatra.git 
1. $ ruby main.rb
1. Navigate to localhost:4567 in your browser

### Update

1. git add .
1. git commit -m "updated the header and footer"
1. git push heroku master
