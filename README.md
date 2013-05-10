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

### PUSHing it to Heroku

    $ git clone git@github.com:mjhea0/blackjack-sinatra.git
    $ bundle install
    $ git init
    $ git add .
    $ git commit -m "initial commit"
    $ heroku create <my-app-name>.
    $ git push heroku master

### Running it locally

    $ git clone git@github.com:mjhea0/blackjack-sinatra.git 
    $ ruby main.rb

Navigate to localhost:4567 in your browser

### PUSH code updates to Heroku

    git add .
    git commit -m "updated the header and footer"
    git push heroku master
