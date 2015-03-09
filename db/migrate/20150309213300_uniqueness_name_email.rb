class UniquenessNameEmail < ActiveRecord::Migration
  def change
    add_index :contacts, [:user_id, :email], unique: true
    add_index :contacts, :user_id
  end
end
