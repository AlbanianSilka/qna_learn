class Post < ApplicationRecord
  validates :title, :content, presence: true
  has_many_attached :file
  has_many :comments
  belongs_to :user
  acts_as_votable
end
