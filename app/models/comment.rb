class Comment < ApplicationRecord
  belongs_to :post
  has_many :answers
  validates :comment, presence: true
  validates :name, presence: true
  has_one_attached :file
  after_create_commit { RenderCommentJob.perform_later self }
  acts_as_votable
end
