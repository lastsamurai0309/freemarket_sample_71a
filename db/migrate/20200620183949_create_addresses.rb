class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :address_name,  null: false
      t.string :address_furi,  null: false
      t.string :post_num,      null: false
      t.string :prefecture,    null: false
      t.string :city,          null: false
      t.string :address,       null: false
      t.string :billding
      t.string :phone_number
      t.references :user,  foreign_key: true
      t.timestamps
    end
  end
end
