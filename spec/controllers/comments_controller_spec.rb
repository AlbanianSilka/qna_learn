require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:post) { create(:post, user_id: user.id) }
  let(:comment) { create(:comment, user_id: user.id, post: post) }

  setup do
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'assigns the requested comment to @comment' do
        patch :update, params: { id: answer.id, \
                                 post_id: post, comment: attributes_for(:comment) }, format: :js
        expect(assigns(:comment)).to eq comment
      end

      it 'changes comment attributes' do
        patch :update, params: { id: comment.id, post_id: post, \
                                 comment: { comment: 'new comment' } }, format: :js
        answer.reload
        expect(answer.body).to eq 'new comment'
      end
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:create_request) do
        post :create, params: \
        { post_id: post, answer: attributes_for(:answer), controller: answer }
      end

      it 'saves the new question in the database' do
        expect { create_request }.to change(question.answers, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      let(:create_request) do
        post :create, params: \
        { question_id: question, answer: attributes_for(:invalid_answer) }, format: :js
      end

      it 'doesnt save answer in db' do
        expect { create_request }.to_not change(Answer, :count)
      end

    end
  end
  describe 'DELETE #destroy' do
    before { comment }

    it 'deletes answer' do
      expect do
        delete :destroy, params: \
        { id: comment, post_id: post }, format: :js
      end.to change(Comment, :count).by(-1)
    end
  end
end