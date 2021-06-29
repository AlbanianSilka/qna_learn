class Post < ApplicationRecord
  validates :title, :content, presence: true
  has_many_attached :file
  has_many :comments
  # has_many :subscriptions, dependent: :delete_all
  belongs_to :user, class_name: "User", optional: true
  acts_as_votable
end
