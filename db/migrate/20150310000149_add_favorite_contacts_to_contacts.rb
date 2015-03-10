class AddFavoriteContactsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :owner_favorite, :boolean, null: false, default: false
    add_column :contact_shares, :user_favorite, :boolean, null: false, default: false
  end
end
