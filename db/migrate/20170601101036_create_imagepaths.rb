class CreateImagepaths < ActiveRecord::Migration[5.0]
  def change
    create_table :imagepaths do |t|
      t.string :path
      t.references :imagepost, foreign_key: true

      t.timestamps
    end
  end
end
