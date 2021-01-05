class CommentsController < ApplicationController
  def index; end

  def create
    @comment = current_user.comments.create(comment_params)
    @board = Board.find_by(id: params[:board_id])
    respond_to do |format|
    format.html {
      if @comment.save
        redirect_to @board, success: 'コメントを作成できました'
      else
        redirect_to @board, danger: 'コメントを作成できませんでした'
      end }
    format.js
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @comment = @board.comments.find(params[:format])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :board_id)
  end
end
