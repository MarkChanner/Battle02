require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    p1 = Player.new(params[:p1_name])
    p2 = Player.new(params[:p2_name])
    $game = Game.new(p1, p2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  get '/attack' do
    @game = $game
    @game.attack
    if @game.defender.health == 0
      redirect '/result'
    else
      @game.switch_turn
      erb(:attack)
    end

  end

  get '/result' do
    erb(:result)
  end

  # start the server if ruby file executed directly
  # run! if app_file == $0
end
