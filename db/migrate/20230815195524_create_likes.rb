class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
    add_foreign_key :likes, :users, column: :user_id
    add_foreign_key :likes, :posts, column: :post_id
    add_index :likes, :user_id
    add_index :likes, :post_id
  end
end

#rails generate migration CreateLikes author_id:integer post_id:integer CreatedAt:datetime UpdatedAt:datetime