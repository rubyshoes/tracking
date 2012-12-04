class AddMetaStatusToCode < ActiveRecord::Migration
  def change
    add_column :codes, :meta_status, :boolean
  end
end
