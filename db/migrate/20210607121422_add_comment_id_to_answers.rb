class AddCommentIdToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :comment_id, :integer
  end
end
