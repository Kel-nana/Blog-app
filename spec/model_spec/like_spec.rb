require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(user_id: 1, post_id: 1) }

  before { subject.save }

  describe 'update_posts_likes_counter' do
    user = User.create(name: 'Man', photo: 'https://example.com', bio: 'bio', posts_counter: 0)
    post = Post.create(title: 'first post', text: 'captain america', author_id: user.id, comments_counter: 0,
                       likes_counter: 0)

    subject { described_class.create(post:, user_id: user.id) }

    it 'Check if post counter increases' do
      expect(subject.post.likes_counter).to eq(post.likes_counter)
    end
  end
end
