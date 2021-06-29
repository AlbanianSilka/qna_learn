require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  sign_in_user

  setup do
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let!(:posts) { post :create, params: { post_id: post, comment: attributes_for(:comment) } }

      it 'saves the new comment in the database' do
        expect {{ comment: attributes_for(:comment) } }.to change(Comment, :count).by(1)
      end
    end
  end

end