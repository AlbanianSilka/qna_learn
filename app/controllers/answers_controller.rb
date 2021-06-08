class AnswersController < ApplicationController
  before_action :find_comment, only: [:create]
  after_action :publish_answer, only: [:create]
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @answer = @comment.answers.create(params[:answer].permit(:answer))
  end

  def publish_answer
    ActionCable.server.broadcast("post_channel_#{@comment.post_id}", {answer: @answer.answer})
  end

  private

  def find_comment
    @comment = Comment.find(params[:comment_id])
  end
end
