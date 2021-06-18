class CommentSerializer < ActiveModel::Serializer
  attributes :id, :name, :comment
  has_many :comments
end
