class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :codename
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
