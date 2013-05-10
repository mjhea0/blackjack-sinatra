blackjack-sinatra
=================

1. Create an acount at Heroku.
1. Install the gem sudo gem install heroku.
1. If you do not have an SSH key you'll need to generate one and tell Heroku about it
1. Clone this repo
1. heroku create [optional-app-name]
1. git push heroku master

Want a database? Let's look at how to implement that. 


Putting it up on Heroku

  $ git clone 
  $ gem install bundler
  $ bundle
  $ heroku create -s cedar mywebapp
  $ git push heroku master
  $ bundle exec heroku open
Running it locally

  $ git clone 
  $ gem install bundler
  $ bundle
  $ bundle exec foreman
Navigate to localhost:5000 | 5100
