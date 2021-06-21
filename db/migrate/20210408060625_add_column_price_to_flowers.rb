class AddColumnPriceToFlowers < ActiveRecord::Migration[5.2]
  def change
    add_column :flowers, :price, :integer
  end
end
