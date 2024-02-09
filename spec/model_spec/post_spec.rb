require 'rails_helper'

describe Post, type: :model do
  # Create a user for testing purposes.
  let(:user) { User.create(name: 'Tulli') }
  # Set up a subject (Post) with initial attributes and save it before each test.
  subject { Post.new(title: 'Atomic Habits', text: 'instance variables', author: user) }
  before { subject.save }

  # Define validations tests for the Post model.
  describe 'validations' do
    it 'Check titlt to not be empty' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Check title length to not exceed 250 characters' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end

    it 'Check name to not be empty' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'Check comments counter is numeric' do
      subject.comments_counter = 'not a number'
      expect(subject).to_not be_valid
    end

    it 'Check comments counter is greater than 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Check likes counter is numeric' do
      subject.likes_counter = 'nil'
      expect(subject).to_not be_valid
    end

    it 'Check likes counter is greater than 0' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe '#update_user_posts_counter' do
    it 'increments the user posts_counter after save' do
      # Set up the initial user posts_counter.
      user.posts_counter = 0
      # Call the method to be tested.
      subject.update_user_posts_counter
      # Expect the user's posts_counter to be incremented by 1.
      expect(user.posts_counter).to eq(1)
    end
  end

  describe 'new_posts' do
    before do
      # Create a user and a post for testing comments.
      @user = User.create(name: 'Kingsley Abdul', photo: 'https://example.com', bio: 'I am a programmer',
                          posts_counter: 0)
      @post = Post.create(title: 'first post', text: 'captain america', author: @user, comments_counter: 0,
                          likes_counter: 0)
    end

    # Define comments data for testing.
    comments_data = [
      { text: 'Comment 1' },
      { text: 'Comment 2' },
      { text: 'Comment 3' },
      { text: 'Comment 4' },
      { text: 'Comment 5' }
    ]

    before do
      # Create comments based on the comments data and associate them with the user and post.
      @comments = comments_data.map { |data| Comment.create(data.merge(user: @user, post: @post)) }
    end

    it 'should return recent 5 comments' do
      # Define a test to check if 'new_comments' returns the most recent 5 comments.
      expect(@post.new_comments).to eq(@comments.reverse)
    end
  end
end
