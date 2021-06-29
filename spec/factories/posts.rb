FactoryBot.define do
  factory :post do
    title { "Title" }
    content {"Content"}
    user_id { create(:user).id }
  end
  factory :invalid_post, class: 'Post' do
    title { 'Title' }
    user_id { create(:user).id }
  end
end
