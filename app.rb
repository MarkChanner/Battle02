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
    # $game = Game.new(p1, p2)
    Game.instance(p1, p2)
    redirect '/play'
  end

  get '/play' do
    # @game = $game
    @game = Game.instance
    @game.switch_turn
    erb(:play)
  end

  get '/attack' do
    # @game = $game
    @game = Game.instance
    @game.attack
    @game.defender.health == 0 ? (redirect '/result') : erb(:attack)
  end

  get '/result' do
    erb(:result)
  end

  # start the server if ruby file executed directly
  # run! if app_file == $0
end
