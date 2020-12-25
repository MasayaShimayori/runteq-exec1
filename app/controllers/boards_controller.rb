class BoardsController < ApplicationController
  before_action :set_board, only: %i[update destroy]

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new
    @comments = @board.comments.all.includes(:board).order(created_at: :desc)
  end

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

  def edit
    @board = current_user.boards.find(params[:id]) 
  end

  def update
    if @board.update(board_params)
      redirect_to boards_path, success: '掲示板を更新しました'
    else
      flash.now[:danger] = '掲示板を更新できませんでした'
      render :new 
    end
  end

  def destroy
    @board.destroy!
    redirect_to boards_path
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :image)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
