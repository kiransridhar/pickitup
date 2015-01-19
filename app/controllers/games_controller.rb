class GamesController < ApplicationController
  def index
    @games = Game.order('name DESC')
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game
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
    params.require(:game).permit(:name, :address, :city, :state, :zip)
  end
end
