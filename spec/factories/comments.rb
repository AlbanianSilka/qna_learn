FactoryBot.define do
  factory :comment do
    comment { 'Comment' }
    name { 'Name' }
    post
    user_id { create(:user).id }
  end
end