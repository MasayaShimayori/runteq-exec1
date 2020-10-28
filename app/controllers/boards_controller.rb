class BoardsController < ApplicationController
  def index
    if current_user
      @boards = current_user.boards

      unless @boards
        redirect_to login_path, danger: (t '.fail')
      end
      
    else
      redirect_to login_path
    end
  end
end
