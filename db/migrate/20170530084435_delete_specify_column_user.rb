class DeleteSpecifyColumnUser < ActiveRecord::Migration[5.0]
  def down
  	remove_column :users, :jenkel
  end

  def up
  	add_column :users, :username, :string
  	add_column :users, :profilepic, :string
  	add_column :users, :birthdate, :date
  	add_column :users, :password, :text
  	add_column :users, :weight, :float
  end
end
