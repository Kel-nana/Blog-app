require 'rails_helper'

RSpec.describe PostsController, type: :request do
  before do
    @user = User.create(name: 'kel', posts_counter: 0)
    @post = Post.create!(title: 'post', text: 'posts added ', author: @user,
                         comments_counter: 0, likes_counter: 0)
  end

  describe 'GET /index' do
    before { get user_posts_url(@user.id) }

    it 'returns a successful response' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template('posts/index')
    end

    it 'response body displays correct placeholder text' do
      expect(response.body).to include('Users Post list')
    end
  end

  describe 'GET /show' do
    before { get user_post_url(user_id: @user.id, id: @post.id) }

    it 'returns a successful response' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template('posts/show')
    end

    it 'response body displays correct placeholder text' do
      expect(response.body).to include('Show a specific User Post')
    end
  end
end