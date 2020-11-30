class CommentsController < ApplicationController
  def index; end

  def create
    @comment = current_user.comments.build(comment_params)
    @board = Board.find_by(id: params[:board_id])
    if @comment.save
      redirect_to @board, success: 'コメントを作成できました'
    else
      redirect_to @board, danger: 'コメントを作成できませんでした'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :board_id)
  end

end
