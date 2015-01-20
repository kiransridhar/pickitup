class SearchesController < ApplicationController
  def index
    @results = Game.search(params[:query])
  end
end
