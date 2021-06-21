class AddColumnPriceToMobile < ActiveRecord::Migration[5.2]
  def change
    add_column :mobiles, :price ,:integer
  end
end
