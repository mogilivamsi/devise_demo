class AddSeesionKeyToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :session_key, :string
  end
end
