class BookmarksController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    current_user.bookmark(@board)
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, success: 'ブックマークしました' }
      format.js
    end
  end

  def destroy
    @board = current_user.bookmarks.find(params[:id]).board
    current_user.unbookmark(@board)
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, success: 'ブックマークを外しました' }
      format.js
    end
  end
end
