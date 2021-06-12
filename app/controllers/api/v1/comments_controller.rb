class Api::V1::AnswersController < Api::V1::BaseController
  before_action :authenticate_user!, only: :create
  before_action :find_post, only: :create

  def show
    respond_with Comment.find(params[:id]), adapter: :json, serializer: CommentSerializer
  end

  def index
    respond_with Comment.where(post_id: params[:post_id]), adapter: :json
  end

  def create
    if can?(:create, Comment)
      @comment = @post.comments.create(comment_params)
      render json: @comment, adapter: :json, serializer: CommentSerializer
    else
      render json: { message: 'Permission denied or not enough permissions.' }, status: :forbidden
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params[:comment].try(:permit, :body)
  end
end
