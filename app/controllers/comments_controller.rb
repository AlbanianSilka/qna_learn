class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:name, :comment, :user_id, :best, :file))
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  # def destroy_attachment
  #   @file = ActiveStorage::Attachment.find_by(params[:id])
  #   @file.purge
  #   redirect_back(fallback_location: posts_path)
  # end

end
