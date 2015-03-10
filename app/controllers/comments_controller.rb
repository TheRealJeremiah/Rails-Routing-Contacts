class CommentsController < ApplicationController
  def index
    render json: Comment.where(
      commentable_id: params[:commentable_id],
      commentable_type: params[:commentable_type]
    )
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(
      :commentable_id,
      :commentable_type,
      :body,
      :author_id
      )
  end
end
