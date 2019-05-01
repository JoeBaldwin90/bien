class AddIndexesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :reviews, :user_id
    add_index :comments, :user_id
  end
end
