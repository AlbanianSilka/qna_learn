class Post < ApplicationRecord
  before_create :set_user
  has_many :comments
  belongs_to :user
  def set_user
    @user_id = current_user.id
  end
end
