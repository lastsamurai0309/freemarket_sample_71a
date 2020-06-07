class CreatePurchaseHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_histories do |t|
      # t.text :message,                    null: false
      t.references :user, foreign_key: true
      # t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
