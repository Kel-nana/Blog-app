require 'rails_helper'

RSpec.describe 'User Posts', type: :feature do
  before do
    @user = User.create!(name: 'Lulu', posts_counter: 0)
    @post1 = Post.create!(title: 'Post 1', text: 'This is post 1', author: @user, comments_counter: 0, likes_counter: 0)
    @post2 = Post.create!(title: 'Post 2', text: 'This is post 2', author: @user, comments_counter: 0, likes_counter: 0)
    @post3 = Post.create!(title: 'Post 3', text: 'This is post 3', author: @user, comments_counter: 0, likes_counter: 0)
    @comment = Comment.create!(text: 'Nice post', user: @user, post: @post1)

    visit user_posts_path(@user)
  end

  describe 'Index Page' do
    it 'displays the user\'s profile picture' do
      expect(page).to have_css('div.user-image')
    end

    it 'displays the user\'s username' do
      expect(page).to have_content('Lulu')
    end

    it 'displays the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 3')
    end

    it 'displays a post\'s title' do
      expect(page).to have_content('Post 1')
      expect(page).to have_content('Post 2')
      expect(page).to have_content('Post 3')
    end

    it 'displays some of the post\'s body' do
      expect(page).to have_content('This is post 1')
      expect(page).to have_content('This is post 2')
      expect(page).to have_content('This is post 3')
    end

    it 'displays the first comments on a post' do
      expect(page).to have_content('Nice post')
    end

    it 'displays how many comments a post has' do
      expect(page).to have_content('Comment: 1')
    end

    it 'displays how many likes a post has' do
      expect(page).to have_content('Likes: 0')
    end


    it 'redirects to a post\'s show page when clicking on a post' do
      click_link 'Post 1'
      expect(page).to have_current_path(user_post_path(@user, @post1))
    end
  end
  describe 'Show Page' do
    before do
      @comment2 = Comment.create!(text: 'Great post', user: @user, post: @post1)
      visit user_post_path(@user, @post1)
    end
    it 'displays the post\'s title' do
      expect(page).to have_content('Post 1')
    end
    it 'displays the post\'s author' do
      expect(page).to have_content('by Lulu')
    end
    it 'displays the number of comments the post has' do
      expect(page).to have_content('Comments: 2')
    end
    it 'displays the number of likes the post has' do
      expect(page).to have_content('Likes: 0')
    end
    it 'displays the post\'s body' do
      expect(page).to have_content('This is post 1')
    end
    it 'displays the username of each commentor' do
      expect(page).to have_content('Lulu')
    end
    it 'displays the comment each commentor left' do
      expect(page).to have_content('Nice post')
      expect(page).to have_content('Great post')
    end
    it 'displays a button to add a comment' do
      expect(page).to have_button('Create New Comment')
    end
    it 'displays a button to like the post' do
      expect(page).to have_button('Like Post')
    end
  end
end
