class CreateFlowers < ActiveRecord::Migration[5.2]
  def change
    create_table :flowers do |t|
      t.string :name
    
      t.string :colour

      t.timestamps
    end
  end
end
