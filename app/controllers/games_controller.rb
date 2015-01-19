class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @games = Game.limit(10).order("name DESC")
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def edit
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      flash[:notice] = "Game created successfully"
      redirect_to game_path(@game)
    else
      render 'new'
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    redirect_to games_path
  end


  private

  def game_params
    params.require(:game).permit(:name, :address, :city, :state, :zip, :user_id)
  end
end
