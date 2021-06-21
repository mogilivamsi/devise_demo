class CreateAdharcards < ActiveRecord::Migration[5.2]
  def change
    create_table :adharcards do |t|
      t.integer :number
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
