class AddFullNameToClients < ActiveRecord::Migration
  def change
    add_column :clients, :name, :string
  end
end
