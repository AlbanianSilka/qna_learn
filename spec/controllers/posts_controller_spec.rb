require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let(:post) { create(:post, user_id: user.id) }

  describe 'GET #index' do
    let(:posts) { create_list(:post, 3).sort_by(&:created_at).reverse }

    before { get :index }

    it 'assign posts array to @posts' do
      expect(assigns(:posts)).to eq posts
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: post } }
    let(:comments) { create_list(:comment, 3, post: post) }

    it 'assigns the requested post to @post' do
      expect(assigns(:post)).to eq post
    end

    it 'assigns the posts to @posts' do
      expect(assigns(:posts)).to eq posts
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns new Post to post' do
      expect(assigns(:post)).to be_a_new(Post)
    end

    it 'render new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new post in the database' do
        expect { post :create, params: { post: attributes_for(:post) } }.to change(Post, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { post: attributes_for(:post) }
        expect(response).to redirect_to post_path(assigns(:post))
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'assigns the requested post to @post' do
        patch :update, params: { id: post, post: attributes_for(:post) }, format: :js
        expect(assigns(:post)).to eq post
      end

      it 'change post attributes' do
        patch :update, params: { id: post, post: { title: 'new title', content: 'new content' } }, format: :js
        post.reload
        expect(post.title).to eq 'new title'
        expect(post.content).to eq 'new content'
      end

      it 'redirects to updated post' do
        patch :update, params: { id: post, post: attributes_for(:post) }, format: :js
        expect(response).to redirect_to post
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: post, post: { title: nil, content: 'new content' } }, format: :js }

      it 'does not change post attributes' do
        post.reload
        expect(post.title).to eq 'Title'
        expect(post.content).to eq 'Content'
      end
    end
  end

  describe 'DELETE #destroy' do
    before { post }

    it 'destroying post' do
      expect { delete :destroy, params: { id: post } }.to change(Post, :count).by(-1)
    end

    it 'redirect to index view' do
      delete :destroy, params: { id: post }
      expect(response).to redirect_to posts_path
    end
  end
end