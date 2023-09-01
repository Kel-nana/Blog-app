class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.string :title
      t.text :text
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end
    add_foreign_key :posts, :users, column: :author_id
    add_index :posts, :author_id
  end
end






















































#rails generate migration CreatePosts author_id:integer title:text text:text comments_counter:integer likes_counter:integer updated_at:datetime created_at:datetime
#   second_post = Post.create(author: second_user, title: 'Hello', text: 'This is my second post')
# third_user = User.create(name: 'Abdul')
# third_user = User.create(name: 'Abdul', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Programmer and computer science specialist.')
#baqar_user = User.create(name: 'Baqar')
#baqar_post = Post.create( author_id: 3, title: 'top gun', text: 'Testing my post counter')
#dilsher_user = User.create(name: 'Dilsher')
#dilsher_post = Post.create(author: dilsher_user, title: 'Title', text: 'i am iron man')
# baqar_user = User.find_by(name: 'Baqar')
# baqar_user = Post.create(author: baqar_user, title: 'I Rock', text: 'maybe Death note is the best anime in the world')
# kigsley_user = User.create(name: 'Kingsley')
# kigsley_user =User.create(name: 'Kingsly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'An amazing coding partnere.')
# first_post = Post.first
# second_user = User.second
#Comment.create(post: first_post, : second_user, text: 'Hi Tom!' )
# Get references to the users and posts
# baqar_user = User.find_by(name: 'Baqar')
# dilsher_user = User.find_by(name: 'Dilsher')
# baqar_post = Post.find_by(title: 'Hello', author: baqar_user)
# dilsher_post = Post.find_by(title: 'Hello', author: dilsher_user)
# Create comments for the posts
# Comment.create(post: baqar_post, user: dilsher_user, text: 'Hi Baqar! How are you?')
# Comment.create(post: dilsher_post, user: baqar_user, text: 'Hello Dilsher! Nice post!')
# Comment.create(post: baqar_post, user: dilsher_user, text: 'Hi Baqar! How associations going?')
# Comment.create(post: dilsher_post, user: baqar_user, text: 'Hello Dilsher! You realise your one of the best logical thinkers in microverse!')
# Comment.create(post: baqar_post, user: dilsher_user, text: 'Hi Baqar! Consistency is the key?')

#adding likes for dilsher_user
# Post.all.each do |post|
#   Like.create(user: dilsher_user, post: post)
# end
#adding likes for baqar_user
# Post.all.each do |post|
#   Like.create(user: baqar_user, post: post)
# end
# Like.first
# Find a post that you know has likes (replace 1 with the actual post ID)
# post = Post.find(1)
# Create a new like for the post (replace 1 with the user ID)
# Like.create(user_id: 1, post: post)
# Destroy the like (replace 1 with the user ID)
# Like.find_by(user_id: 1, post: post).destroy
#repeating process for checking likes method
# post = Post.find(3)
# Like.create(user_id: 3, post: post)

      # # Create posts using the association
      # post1 = subject.posts.build(title: 'Post 1', text: 'Hello', created_at: 1.day.ago, comments_counter: 0,
      #                             likes_counter: 0)
      # post2 = subject.posts.build(title: 'Post 2', text: 'kelvin', created_at: 2.days.ago, comments_counter: 0,
      #                             likes_counter: 0)
      # post3 = subject.posts.build(title: 'Post 3', text: 'How are you', created_at: 3.days.ago, comments_counter: 0,
      #                             likes_counter: 0)
      # subject.posts.build(title: 'Post 4', text: 'Bonjour', created_at: 4.days.ago,
      #  comments_counter: 0,likes_counter: 0)
      # # Create an array of posts
      # postArr = [post1, post2, post3]
      # # Save each post in the array explicitly
      # postArr.each(&:save)
        # Expect the correct posts to be returned
      # expect(subject.new_posts.to_a).to eq([post3, post2, post1])




      # Fetch the user and post objects
# lilly_user = User.find_by(name: "Lilly")
# kingsly_post = Post.find_by(title: "Test")

# # Create a comment
# Comment.create(post: kingsly_post, user: lilly_user, text: 'Hi Baqar! How are your associations going?')
