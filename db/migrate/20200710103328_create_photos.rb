class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :name, null: false
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
