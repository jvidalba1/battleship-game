class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @turns = @user.turns.build
  end

  def new
    @game = Game.find(params[:game_id])
    @users = @game.users.build
  end

  def create
    game = Game.find(params[:game_id])
    user = game.users.build(params[:user].permit(:name))
    user.build_ships
    user.save
    redirect_to game_user_path(game, user)
  end

  def attack
    
    x = params[:coordinate_x]
    y = params[:coordinate_y]
    @user = User.find(params[:user_id])

    @turn = @user.turns.build(coordinate_x: x, coordinate_y: y)
    @turn.attack_opponent
    @user.save!

    respond_to do |format|
      format.js
    end
  end
end
