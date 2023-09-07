RSpec.describe 'Users', type: :feature do
  before do
    @user1 = User.create!(name: 'lulu', posts_counter: 0)
    @user2 = User.create!(name: 'prince', posts_counter: 0, bio: 'programmer')
    @user3 = User.create!(name: 'ruby', posts_counter: 0)

    visit users_path
  end

  describe 'show page' do
    before do
      @post = Post.create!(title: 'ruby', text: 'ruby on rails is magic', author: @user2, comments_counter: 0,
                           likes_counter: 0)
      @comment = Comment.create!(text: 'Nice post', user: @user2, post: @post)
      visit user_path(@user2)
    end

    it 'displays the user\'s profile picture' do
      expect(page).to have_css('div.user-image')
    end

    it 'displays the user\'s username' do
      expect(page).to have_content('prince')
    end

    it 'displays the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 1')
    end

    it 'displays the user\'s bio' do
      expect(page).to have_content('programmer')
    end

    it 'displays the user\'s first 3 posts or less' do
      expect(page).to have_selector('.post_container', count: 1)
    end

    it 'displays a button to add new post' do
      click_link 'Create New Post'
      expect(page).to have_current_path(new_user_post_url(@user2.id))
    end

    it 'redirects to the user\'s post index page when clicking \'See all posts\'' do
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(@user2.id))
    end
  end
end
