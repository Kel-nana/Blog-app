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
#baqar_user = User.create(name: 'Baqar')
#baqar_post = Post.create(author: baqar_user, title: 'Hello', text: 'This is my second post')
#dilsher_user = User.create(name: 'Dilsher')
#dilsher_post = Post.create(author: dilsher_user, title: 'Hello', text: 'This is amazing i can do this all day Ref: Captain America')
# kigsley_user = User.find_by(name: 'Kingsley')
# kigsley_user = Post.create(author: kigsley_user, title: 'I Rock', text: 'Death note is the best anime in the world')
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


