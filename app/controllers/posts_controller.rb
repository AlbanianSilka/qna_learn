class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :edit, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, only: [:update, :edit, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post[:user_id] = current_user.id
    if @post.save
      redirect_to @post
    else
      render new
    end
  end

  def show
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  def upvote
    if @post.voted_up_by? current_user
      @post.unvote_by(current_user)
    else
      @post.upvote_by(current_user)
    end
    redirect_back fallback_location: root_path
  end

  def downvote
    if @post.voted_down_by? current_user
      @post.unvote_by(current_user)
    else
      @post.downvote_by(current_user)
    end
    redirect_back fallback_location: root_path
  end

  def destroy_attachment
    @file = ActiveStorage::Attachment.find_by(params[:id])
    @file.purge
    redirect_back(fallback_location: posts_path)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :file).merge(user_id: current_user.id)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
