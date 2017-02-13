class Api::V1::GamesController < ApplicationController
  # GET /api/v1/users/:id/games
  def index
    @user = User.find params[:id]
    json_response @user.games
  end

  # GET /api/v1/users/:id/games/:id
  def show
    @user = User.find params[:user]
    json_response @user.games.find params[:id]
  end
end
