class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.text :text

      t.timestamps
    end
    add_foreign_key :comments, :users, column: :user_id
    add_foreign_key :comments, :posts, column: :post_id
    add_index :comments, :user_id
    add_index :comments, :post_id
  end
end


#rails generate migration CreateComments author_id:integer post_id:integer Text:string UpdatedAt:datetime CreatedAt:datetime
