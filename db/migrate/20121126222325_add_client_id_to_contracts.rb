class AddClientIdToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :client_id, :integer
  end
end
