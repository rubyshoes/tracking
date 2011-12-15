class AddSaltToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :salt, :string
  end
end
