class BoardsController < ApplicationController
  def index
    if current_user
      if Board.exists?
        @boards = Board.all
      else
        redirect_to login_path, danger: (t '.fail')
      end
    else
      redirect_to login_path, danger: (t '.login')
    end
  end
end
