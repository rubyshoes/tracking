class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :code_name
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
