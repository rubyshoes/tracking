class CreateCodelines < ActiveRecord::Migration
  def change
    create_table :codelines do |t|
      t.integer :contract_id
      t.integer :code_id
      t.integer :client_id
      t.decimal :units_alloc, :precision => 6, :scale => 2 

      t.timestamps
    end
  end
end
