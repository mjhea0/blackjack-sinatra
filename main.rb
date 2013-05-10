require 'rubygems'
require 'sinatra'

set :sessions, true

helpers do
  def user_logged_in?
    if session[:username]
      true
    else
      false
    end
  end

  def find_face_value(face_value)
    ret_val = case face_value
      when '2' then '2'
      when '3' then '3'
      when '4' then '4'
      when '5' then '5'
      when '6' then '6'
      when '7' then '7'
      when '8' then '8'
      when '9' then '9'
      when '10' then '10'
      when 'J' then 'Jack'
      when 'Q' then 'Queen'
      when 'K' then 'King'
      when 'A' then 'Ace'
    end
    ret_val
  end

  def total(cards) 
    face_values = cards.map{|card| card[1] }

    total = 0
    face_values.each do |val|
      if val == "A"
        total += 11
      else
        total += (val.to_i == 0 ? 10 : val.to_i)
      end
    end

    face_values.select{|val| val == "A"}.count.times do
      break if total <= 21
      total -= 10
    end

    total
  end

end

# Home 
get '/' do
  if user_logged_in?
    redirect '/game'
  else
    erb :new_user
  end 
end

get '/new_user' do
  erb :new_user
end

post '/new_user' do
  session[:username] = params['username']
  if session[:username].length == 0
    @alert_message = "You didn't enter your name. Please try again."
    @alert_type = "alert-error"
    erb :new_user
  else
    redirect '/game'
  end
end

get '/game' do

  rank = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  session[:deck] = rank.shuffle!

  session[:dealer_cards] = []
  session[:player_cards] = []

  session[:player_cards] << session[:deck].pop
  session[:dealer_cards] << session[:deck].pop
  session[:player_cards] << session[:deck].pop
  session[:dealer_cards] << session[:deck].pop

  if total(session[:player_cards]) == 21
    @alert_message = "Congratulations! You got Blackjack! You win."
    @alert_type = "alert-success"
    @game_over = true
  end

  erb :game
end

post '/game/hit' do
  session[:player_cards] << session[:deck].pop
  if total(session[:player_cards]) == 21
    @alert_message = "Congratulations! You got Blackjack! You win."
    @alert_type = "alert-success"
    @game_over = true
  elsif total(session[:player_cards]) > 21
    @alert_message = "Sorry. You busted. You lose."
    @alert_type = "alert-error"
    @game_over = true
  end
  erb :game
end

post '/game/stay' do

  while total(session[:dealer_cards]) < 17
    session[:dealer_cards] << session[:deck].pop
  end
  if total(session[:dealer_cards]) > 21
    @alert_message = "Dealer busts. You win!"
    @alert_type = "alert-success"
    @game_over = true
  elsif total(session[:player_cards]) > total(session[:dealer_cards])
    @alert_message = "Congratulations. Your score is higher than the dealer. You win!"
    @alert_type = "alert-success"
    @game_over = true
  else
    @alert_message = "Sorry. Your score isn't higher than the dealer. You lose."
    @alert_type = "alert-error"
    @game_over = true
  end
  erb :game
end

get '/logout' do
  session.clear
  redirect '/'
end