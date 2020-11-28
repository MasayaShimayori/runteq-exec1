class BoardsController < ApplicationController
  def index
    @boards = Board.all.includes(:user).order(created_at: :desc)
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path, success: '掲示板を作成しました'
    else
      flash.now[:danger] = '掲示板を作成できませんでした'
      render :new
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :image)
  end
end
