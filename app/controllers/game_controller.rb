class GameController < ApplicationController
    before_action :set_game, only: [:show, :update, :destroy]
     
  def index
    @games = Game.all

    render json: @games
  end

 
  def show
    render json: @game
  end

  # POST /games
  def create
    @game = Game.new

    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update

    @game.turn(cell: cell, subgame: subgame) 
    # if @game.update(game_params)
    #   render json: @game
    # else
    #   render json: @game.errors, status: :unprocessable_entity
    # end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:id, :cell, :subgame)
    end
end
