class CreateImagelikes < ActiveRecord::Migration[5.0]
  def change
    create_table :imagelikes do |t|
      t.references :imagepost, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
