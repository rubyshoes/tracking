class CreateClientlines < ActiveRecord::Migration
  def change
    create_table :clientlines do |t|
      t.integer :contract_id
      t.integer :client_id

      t.timestamps
    end
  end
end
