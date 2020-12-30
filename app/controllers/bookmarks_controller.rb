class BookmarksController < ApplicationController
  before_action :set_board
  def create
    @bookmark = @board.bookmarks.create(user: current_user)
    redirect_to boards_path, success: 'ブックマークしました'
  end

  def destroy
    @bookmark = @board.bookmarks.find_by(user: current_user)
    @bookmark.destroy
    redirect_to boards_path, success: 'ブックマークを外しました'
  end

  private

  def set_board
    @board = Board.find_by(id: params[:board_id])
  end
end
