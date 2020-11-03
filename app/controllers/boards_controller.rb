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
end
