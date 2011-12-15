class AddPasswordToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :encrypted_password, :string
  end

  def self.down
	remove_column :employees, :encrypted_password
  end
end
