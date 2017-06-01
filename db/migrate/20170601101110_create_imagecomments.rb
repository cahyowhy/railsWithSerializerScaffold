class CreateImagecomments < ActiveRecord::Migration[5.0]
  def change
    create_table :imagecomments do |t|
      t.references :user, foreign_key: true
      t.references :imagepost, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
