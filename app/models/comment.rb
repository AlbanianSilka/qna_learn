class Comment < ApplicationRecord
  belongs_to :post
  has_many :answers
  validates :comment, presence: true
  validates :name, presence: true
  has_one_attached :file
  after_create_commit { RenderCommentJob.perform_later self }
  acts_as_votable

  scope :best_comments,     -> { where(best: true) }
  scope :not_best_comments, -> { where(best: false) }

  def choose_best!
      ActiveRecord::Base.transaction do
          post.comments.update_all(best: false)
          update!(best: true)

      end
    end
end
