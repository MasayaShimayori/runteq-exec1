class CommentsController < ApplicationController
  def index; end

  def create
    @comment = current_user.comments.create(comment_params)
    @board = Board.find_by(id: params[:board_id])
    @comment.save
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
