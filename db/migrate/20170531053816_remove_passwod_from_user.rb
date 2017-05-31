class RemovePasswodFromUser < ActiveRecord::Migration[5.0]
  def down
  	remove_column :users, :password
  end

  def up
  	add_column :users, :password_digest, :string
  end
end
