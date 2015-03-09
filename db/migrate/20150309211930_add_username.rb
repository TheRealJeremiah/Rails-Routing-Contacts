class AddUsername < ActiveRecord::Migration
  def up
    drop_table :users
    create_table :users do |t|
      t.string :username, null: false

      t.timestamps
    end
  end

  def down
    drop_table :users
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.timestamps null: false
    end
  end
end
