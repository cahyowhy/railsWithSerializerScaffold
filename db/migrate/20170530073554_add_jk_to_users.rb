class AddJkToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :jk, :string
  end
end
