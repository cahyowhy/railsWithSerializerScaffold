class CreateImageposts < ActiveRecord::Migration[5.0]
  def change
    create_table :imageposts do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
