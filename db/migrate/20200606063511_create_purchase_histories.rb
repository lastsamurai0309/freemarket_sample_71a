class CreatePurchaseHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_histories do |t|

     

      t.timestamps
    end
  end
end
