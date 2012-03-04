class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :authnum
      t.integer :client_id
      t.date :st_date
      t.date :end_date

      t.timestamps
    end
  end
end
