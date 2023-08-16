class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.text :title
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
