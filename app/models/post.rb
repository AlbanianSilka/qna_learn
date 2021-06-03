class Post < ApplicationRecord
  has_many_attached :file
  has_many :comments
  belongs_to :user
end
