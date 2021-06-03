class CommentsController < ApplicationController
  before_action :find_comment, only: [:destroy, :downvote, :upvote]
  before_action :authenticate_user!, only: [:destroy, :downvote, :upvote]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:name, :comment, :user_id, :best, :file))
    redirect_to post_path(@post)
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  def upvote
    if @comment.voted_up_by? current_user
      @comment.unvote_by(current_user)
    else
      @comment.upvote_by(current_user)
    end
    redirect_back fallback_location: root_path
  end

  def downvote
    if @comment.voted_down_by? current_user
      @comment.unvote_by(current_user)
    else
      @comment.downvote_by(current_user)
    end
    redirect_back fallback_location: root_path
  end

  def destroy_attachment
    @file = ActiveStorage::Attachment.find_by(params[:id])
    @file.purge
    redirect_back(fallback_location: posts_path)
  end

  private

  def find_comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

end
