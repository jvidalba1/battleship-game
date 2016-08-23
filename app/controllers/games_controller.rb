class GamesController < ApplicationController
  def index
    @games = Game.all
    @game = Game.new 
  end

  def create
    @game = Game.new
    if @game.save
      redirect_to new_game_user_path(@game)  
    else
      render 'index'
    end
  end

  def show
    @game = Game.find(params[:id])
  end
end
