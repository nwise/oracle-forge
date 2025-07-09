class MovesController < ApplicationController
  before_action :set_move, only: [:show, :edit, :update, :destroy]
  def index
    @moves = Move.ordered
  end

  def show
  end

  def new
    @move = Move.new
  end

  def create
    @move = Move.new(move_params)

    if @move.save
      respond_to do |format|
        format.html { redirect_to moves_path, notice: "Move was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @move.update(move_params)
      redirect_to moves_path, notice: "Move was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @move.destroy

    respond_to do |format|
      format.html { redirect_to moves_path, notice: "Move was successfully destroyed." }
      format.turbo_stream
    end
  end

  private

  def set_move
    @move = Move.find(params[:id])
  end

  def move_params
    params.require(:move).permit(:name, :description)
  end
end
