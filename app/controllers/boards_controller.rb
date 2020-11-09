class BoardsController < ApplicationController
  def index
    if logged_in?
      @boards = Board.all
      if @boards.blank?
        # redirect_to login_path,
        flash[:danger] = (t '.fail')
      end
    else
      redirect_to login_path, danger: (t '.login')
    end
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path,success: "掲示板を作成しました"
    else
      flash.now[:danger] = "掲示板を作成できませんでした"
      render :new
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :body)
  end
end
