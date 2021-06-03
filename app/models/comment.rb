class Comment < ApplicationRecord
  belongs_to :post
  has_one_attached :file
  acts_as_votable
end
