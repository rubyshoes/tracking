class RemoveClientIdFromContract < ActiveRecord::Migration
  def up
    remove_column :contracts, :client_id
      end

  def down
    add_column :contracts, :client_id, :integer
  end
end
