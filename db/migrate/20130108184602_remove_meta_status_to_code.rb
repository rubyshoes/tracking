class RemoveMetaStatusToCode < ActiveRecord::Migration
  def up
    remove_column :codes, :meta_status
  end
end
