require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before do
    @user1 = User.create!(name: 'lulu', posts_counter: 0)
    @user2 = User.create!(name: 'prince', posts_counter: 0, bio: 'developer')
    @user3 = User.create!(name: 'ruby', posts_counter: 0)

    visit users_path
  end

  describe 'index page' do
    it 'displays usernames of all other users' do
      expect(page).to have_content('lulu')
      expect(page).to have_content('prince')
      expect(page).to have_content('ruby')
    end

    it 'displays profile picture for each user' do
      expect(page).to have_css('div.user-image')
    end

    it 'displays the number of posts each user has written' do
      expect(page).to have_content('Number of posts: 0')
    end

    it 'redirects to user show page when clicking on a user' do
      click_link 'prince'
      expect(page).to have_current_path(user_path(@user2))
    end
  end
end
