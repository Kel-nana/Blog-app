require 'rails_helper'

RSpec.describe User, type: :model do
  # tests go here
  subject { User.new(name: 'John', photo: 'https://example.com', bio: 'tttt', posts_counter: 1) }

  before { subject.save }

  # Define validations tests for the User model.
  describe 'validations' do
    it 'Check name to not be empty' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Check post counter is numeric' do
      subject.posts_counter = 'nil'
      expect(subject).to_not be_valid
    end

    it 'Check post counter is greater than 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe 'new_posts' do
    it 'must return last three posts' do
      # Save the user object before creating posts
      subject.save
      post_attributes = [
        { title: 'Post 1', text: 'Hello', created_at: 1.day.ago, comments_counter: 0, likes_counter: 0 },
        { title: 'Post 2', text: 'kelvin', created_at: 2.days.ago, comments_counter: 0, likes_counter: 0 },
        { title: 'Post 3', text: 'How are you', created_at: 3.days.ago, comments_counter: 0, likes_counter: 0 }
      ]

      # Create posts using the association
      post_instances = post_attributes.map do |attributes|
        subject.posts.build(attributes)
      end

      # Save each post instance explicitly
      post_instances.each(&:save)
      # Expect the correct posts to be returned
      expect(subject.new_posts.to_a).to eq(post_instances)
    end
  end
end
